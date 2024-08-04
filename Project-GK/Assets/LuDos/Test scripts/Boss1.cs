using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;

public class Boss1 : MonoBehaviour
{
    public int maxHealth = 100;
    private int currentHealth;

    private int successCount = 0;
    private int attackCount = 0;
    public int playerAttackCount = 0;

    private int selectedBookCaseIndex = 0;
    private bool hasCollidedWithBookCase = false;
    private int collidedBookCaseIndex = -1;

    private bool isGroggy = false;
    private bool isExecutingPattern = false;
    private bool isExecutingAttack = false;
    private bool isExecutingAreaAttack = false;
    private bool isExecutingBookAttack = false;
    private bool hasExecutedInitialActions1 = false;
    private bool hasExecutedInitialActions2 = false;
    private bool hasExecutedInitialActions3 = false;
    private bool attackBookCaseResult = false;

    private bool canChange1 = true;
    private bool canChange2 = true;
    public bool IsCorrect = false;
    private bool canDisplay = true;

    public int Code;

    private Vector3 targetBookCasePosition;

    private List<int> attackedAreas = new List<int>();
    public List<GameObject> BookCases; // 8개의 책장의 위치를 담아둔 리스트

    // private NavMeshAgent navMeshAgent;
    // private Animator animator;
    private GameObject player;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;

    void Start()
    {
        currentHealth = maxHealth;
        //animator = GetComponent<Animator>();
        // navMeshAgent = GetComponent<NavMeshAgent>();
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();
        StartCoroutine(ExecuteBehaviorTree());
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.F))
        {
            TakeDamage(1);
            Debug.Log("Boss Health: " + currentHealth);
        }
        if (Input.GetKeyDown(KeyCode.O))
        {
            IsCorrect = true;
        }
    }

    IEnumerator ExecuteBehaviorTree()
    {
        while (true)
        {
            if (currentHealth > 66)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions1)
                    {
                        MakeInvincible();
                        LeftArmSlam();
                        hasExecutedInitialActions1 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern1Tree));
                }
            }
            else if (currentHealth > 33)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions2)
                    {
                        MakeInvincible();
                        JumpToCenter();
                        hasExecutedInitialActions2 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern2Tree));
                }
            }
            else if (currentHealth > 0)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions3)
                    {
                        MakeInvincible();
                        Scream();
                        hasExecutedInitialActions3 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern3Tree));
                }
            }
            else
            {
                Die();
                break;
            }
            yield return null;
        }
    }

    BTNode CreatePattern1Tree()
    {
        return new Sequence(
            new ActionNode(ChangeBooksToGreen),
            new ActionNode(SelectAggroTarget),
            new ActionNode(ChangeStaffToRed),
            new ActionNode(ActivateCipherDevice1),
            new ActionNode(RandomBasicAttack),
            new WhileNode(() => successCount < 3,
                new Sequence(
                    new ActionNode(IsCipherCorrect),
                    new ActionNode(ResetBookLightsAndAggro)
                    )
                ),
            new ActionNode(ReleaseInvincibilityAndGroggy)
        );
    }

    BTNode CreatePattern2Tree()
    {
        return new Sequence(
            new WhileNode(() => attackCount < 6,
                new ActionNode(AttackAreas)
                ),
            new ActionNode(ActivateCipherDevice2),
            new ActionNode(ChargeAttack),
            new Sequence(
                new ActionNode(IsCipherCorrect),
                new ActionNode(ReleaseInvincibilityAndGroggy)
                )
        );
    }

    BTNode CreatePattern3Tree()
    {
        return new Sequence(
            new ActionNode(DisplayBookCaseOrder),
            new WhileNode(() => playerAttackCount < 8,
                new Selector(
                    new Sequence(
                        new ActionNode(LightBookCase),
                        new ActionNode(AttackBookCase)
                        ),
                    new ActionNode(DamageAllMap)
                    )
                ),
            new ActionNode(ReleaseInvincibilityAndGroggy)
        );
    }

    IEnumerator ExecutePattern(BTNode patternTree)
    {
        isExecutingPattern = true;
        isGroggy = false;

        while (!isGroggy)
        {
            patternTree.Execute();
            yield return null;
        }

        isExecutingPattern = false;
    }

    public void TakeDamage(int amount)
    {
        currentHealth -= amount;
        if (currentHealth < 0)
        {
            currentHealth = 0;
        }
    }

    bool SetGroggy()
    {
        isGroggy = true; // 일단 이거 켜지면 로직은 실행 안됨
        //animator.SetTrigger("Groggy");
        // navMeshAgent.isStopped = true; // 이중 멈춤이면 없애도 됨
        return true;
    }

    void Die()
    {
        //navMeshAgent.isStopped = true;

        //animator.SetTrigger("Die");
    }

    bool RandomBasicAttack()
    {
        // 어그로 대상 지정 필요
        if (!isExecutingAttack)
        {
            Debug.Log("RandomBasicAttack");

            int attackType = UnityEngine.Random.Range(1, 7);
            switch (attackType)
            {
                case 1:
                    StartCoroutine(SpinningArmAttackCoroutine());
                    break;
                case 2:
                    StartCoroutine(ShockwaveAttackCoroutine());
                    break;
                case 3:
                    StartCoroutine(AlternatingArmSlamCoroutine());
                    break;
                case 4:
                    StartCoroutine(LegStompShockwaveCoroutine());
                    break;
                case 5:
                    StartCoroutine(PalmStrikeCoroutine());
                    break;
                case 6:
                    StartCoroutine(HalfMapSweepCoroutine());
                    break;
            }
        }
        return true;
    }

    IEnumerator SpinningArmAttackCoroutine()
    {
        isExecutingAttack = true;

        // 팔을 돌리며 원형범위로 맵 전범위 타격
        for (int i = 0; i < 4; i++)
        {
            // 시계방향
            // animator.SetTrigger("SpinArmsClockwise");
            yield return new WaitForSeconds(1.0f);

            // 반시계방향
            if (i == 1)
            {
                // animator.SetTrigger("SpinArmsCounterclockwise");
                yield return new WaitForSeconds(1.0f);
            }
        }

        isExecutingAttack = false;
    }

    IEnumerator ShockwaveAttackCoroutine()
    {
        isExecutingAttack = true;

        // animator.SetTrigger("Shockwave");

        // 3단계 충격파
        for (int i = 0; i < 3; i++)
        {
            // 충격파 생성


            yield return new WaitForSeconds(3.0f);
        }

        isExecutingAttack = false;
    }

    IEnumerator AlternatingArmSlamCoroutine()
    {
        isExecutingAttack = true;

        // 각 팔을 번갈아 들어 내리치며 타격 (총 5번)
        for (int i = 0; i < 5; i++)
        {
            if (i == 4)
            {
                // animator.SetTrigger("StrongArmSlam");
            }
            else
            {
                // animator.SetTrigger("ArmSlam" + (i % 2));
            }

            yield return new WaitForSeconds(0.5f);
        }

        isExecutingAttack = false;
    }

    IEnumerator LegStompShockwaveCoroutine()
    {
        isExecutingAttack = true;

        // animator.SetTrigger("LegStomp");

        // 범위 타격 + 충격파


        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator PalmStrikeCoroutine()
    {
        isExecutingAttack = true;

        // animator.SetTrigger("PalmStrike");

        // 손바닥으로 내려치기 (피격 플레이어 2초 기절)


        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator HalfMapSweepCoroutine()
    {
        isExecutingAttack = true;

        // animator.SetTrigger("HalfMapSweep");

        // 맵 쓸기 (반원 형태의 범위)


        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    // 패턴 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");
    }

    void LeftArmSlam()
    {
        Debug.Log("LeftArmSlam");
    }

    bool ChangeBooksToGreen()
    {
        // 8개의 책장에서 4개의 책장 선택, 배열에 저장해둠
        // 선택된 4개의 책장 내에서 각각 랜덤 개수만큼 책에 초록불 켜기, 각각의 개수 배열에 저장해둠
        if (canChange1)
        {
            Debug.Log("ChangeBooksToGreen");


            //canChange1 = false;
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // 어그로 대상 선정 (50% 확률. 무작위)
        if (canChange1)
        {
            Debug.Log("SelectAggroTarget");


            //canChange1 = false;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // 어그로 아닌 플레이어 지팡이 붉은색으로 변경
        if (canChange1)
        {
            Debug.Log("ChangeStaffToRed");

            //canChange1 = false;
        }
        return true;
    }

    bool ActivateCipherDevice1()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange1)
        {
            Debug.Log("ActivateCipherDevice1");

            Code = 1111; // 임시 설정 코드, 원래 계산하는 로직임
            UIManager_Ygg.Instance.patternCode = Code;
            canChange1 = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        // 옳은 암호 입력시, true 출력. 틀릴 시, false 출력.
        if (IsCorrect) // IsCorrect는 암호 입력 장치에 올바른 암호가 입력되었을 때 true로 바뀜.
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    bool ResetBookLightsAndAggro()
    {
        // 책의 빛을 끄고 보스 어그로 풀기, 카운트 + 1

        Debug.Log("ResetBookLightsAndAggro");

        canChange1 = true;
        IsCorrect = false;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // 무적 상태 해제 및 그로기

        Debug.Log("ReleaseInvincibilityAndGroggy");

        return SetGroggy();
    }

    // 패턴 2
    void JumpToCenter()
    {
        Debug.Log("JumpToCenter");
    }
    bool AttackAreas()
    {
        if (isExecutingAreaAttack) return false;
        StartCoroutine(AttackAreasCoroutine());
        return true;
    }

    IEnumerator AttackAreasCoroutine()
    {
        isExecutingAreaAttack = true;

        // animator.SetTrigger("RaiseArms");

        yield return new WaitForSeconds(1.0f); // 애니메이션 대기 시간

        int untouchedArea = Random.Range(1, 9);

        attackedAreas.Add(untouchedArea); // ActivateCipherDevice 에서 암호 입력 장치로 전달
        // Debug.Log("Untouched Area: " + untouchedArea);

        // animator.SetTrigger("AttackAreas");

        // yield return new WaitForSeconds(0.5f); // 타격 애니메이션 대기 시간

        attackCount++;

        isExecutingAreaAttack = false;
    }
    bool ActivateCipherDevice2()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange2)
        {
            Code = 2222; // 임시, 원래 attackedAreas를 통해 전달
            UIManager_Ygg.Instance.patternCode = Code;
            canChange2 = false;
        }
        return true;
    }


    bool ChargeAttack()
    {
        if (canChange2)
        {
            StartCoroutine(ChargeAttackCoroutine());
        }
        return true;
    }

    IEnumerator ChargeAttackCoroutine()
    {
        // 10초간 기 모으기
        // animator.SetTrigger("Charge");

        yield return new WaitForSeconds(10.0f);

        // 기 발사
        // animator.SetTrigger("ReleaseCharge");

        attackedAreas.Clear();
    }

    // 패턴 3
    void Scream()
    {
        // animator.SetTrigger("Scream");
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            // UI에 책장의 개수만큼 원 띄우기

            canDisplay= false;
        }
        return true;
    }
    bool LightBookCase()
    {
        if (isExecutingBookAttack) return false;
        StartCoroutine(LightBookCaseCoroutine());
        return true;
    }

    IEnumerator LightBookCaseCoroutine()
    {
        isExecutingBookAttack = true;

        selectedBookCaseIndex = Random.Range(0, 8);
        
        // BookCase의 Light ON

        yield return new WaitForSeconds(1.0f);

        isExecutingBookAttack = false;
    }

    bool AttackBookCase()
    {
        if (isExecutingBookAttack) return false;
        StartCoroutine(AttackBookCaseCoroutine());
        return attackBookCaseResult;
    }

    IEnumerator AttackBookCaseCoroutine()
    {
        isExecutingBookAttack = true;

        // Player 방향으로 돌진

        // animator.SetTrigger("AttackBookCase");

        Vector3 startPosition = transform.position;
        player = GameObject.FindWithTag("Player"); // 두 플레이어 번갈아가며 선택하는 로직 필요함

        hasCollidedWithBookCase = false;
        collidedBookCaseIndex = -1;

        while (!hasCollidedWithBookCase)
        {
            transform.position = Vector3.MoveTowards(transform.position, player.transform.position, Time.deltaTime * (Vector3.Distance(startPosition, player.transform.position) / 1.0f));
            yield return null;
        }

        yield return new WaitForSeconds(1.0f);

        if (collidedBookCaseIndex == selectedBookCaseIndex)
        {
            attackBookCaseResult = true;
            playerAttackCount++;
        }
        else
        {
            attackBookCaseResult = false;
        }

        isExecutingBookAttack = false;
    }
    bool DamageAllMap()
    {
        // 맵 전역 데미지

        canDisplay = true;
        playerAttackCount= 0;

        return true;
    }

    // 그 외
    int GetCollidedBookCaseIndex(GameObject collisionObject)
    {
        for (int i = 0; i < BookCases.Count; i++)
        {
            if (BookCases[i] == collisionObject)
            {
                return i;
            }
        }
        return -1;
    }
    void OnCollisionEnter(Collision collision)
    {
        //if (collision.gameObject.CompareTag("BookCase"))
        //{
        //    hasCollidedWithBookCase = true;
        //    collidedBookCaseIndex = GetCollidedBookCaseIndex(collision.gameObject);
        //}
    }
}