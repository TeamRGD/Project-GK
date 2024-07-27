using System.Collections;
using UnityEngine;
using UnityEngine.AI;

public class Boss1 : MonoBehaviour
{
    public int maxHealth = 100;
    private int currentHealth;

    private int successCount = 0;
    private int attackCount = 0;

    private bool isGroggy = false;
    private bool isExecutingPattern = false;
    // private bool isExecutingAttack = false;
    private bool hasExecutedInitialActions = false;

    private bool canChange = true;
    private bool IsCorrect = false;

    // private NavMeshAgent navMeshAgent;
    // private Animator animator;

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
            TakeDamage(10);
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
                    if (!hasExecutedInitialActions)
                    {
                        MakeInvincible();
                        LeftArmSlam();
                        hasExecutedInitialActions = true;
                    }

                    StartCoroutine(ExecutePattern(pattern1Tree));
                }
            }
            else if (currentHealth > 33)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions)
                    {

                        hasExecutedInitialActions = true;
                    }

                    StartCoroutine(ExecutePattern(pattern2Tree));
                }
            }
            else if (currentHealth > 0)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions)
                    {

                        hasExecutedInitialActions = true;
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
            new ActionNode(ActivateCipherDevice),
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
            new ActionNode(ActivateCipherDevice),
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
        // 어그로 대상에게 기본 공격 (6개 중 랜덤)
        return true;
    }

    // 패턴 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");
    }

    void LeftArmSlam()
    {
        // 왼쪽 팔 땅 내려치는 애니메이션 재생
        Debug.Log("LeftArmSlam");
    }

    bool ChangeBooksToGreen()
    {
        // N개의 책장에서 특정 책들을 연두색으로 변경
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // 어그로 대상 선정 (50% 확률. 무작위)
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // 어그로 아닌 플레이어 지팡이 붉은색으로 변경
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool ActivateCipherDevice()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        // 옳은 암호 입력시, true 출력. 틀릴시, false 출력.
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

        canChange = true;
        IsCorrect = false;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // 무적 상태 해제 및 그로기

        return SetGroggy();
    }

    // 패턴 2
    bool AttackAreas()
    {
        StartCoroutine(AttackAreasCoroutine());
        return true;
    }

    IEnumerator AttackAreasCoroutine()
    {
        // animator.SetTrigger("RaiseArms");

        yield return new WaitForSeconds(1.0f);

        // 8개의 구역 중 타격하지 않은 1개의 구역 선택 + 리스트에 저장하기
        int untouchedArea = Random.Range(0, 8);
        // Debug.Log("Untouched Area: " + untouchedArea);

        // 타격
        // animator.SetTrigger("AttackArea);

        // yield return new WaitForSeconds(0.5f); // 타격 애니메이션 대기 시간

        // 타격한 구역 데미지
        // Debug.Log("Deal Damage to Area " + untouchedArea);

        attackCount++;
    }

    bool ChargeAttack()
    {
        StartCoroutine(ChargeAttackCoroutine());
        return true;
    }

    IEnumerator ChargeAttackCoroutine()
    {
        // 10초간 기 모으기
        Debug.Log("Charging for 10 seconds");
        // animator.SetTrigger("Charge");

        yield return new WaitForSeconds(10.0f);

        // 기 모으기 완료 후 공격
        Debug.Log("Release Charged Attack");
        // animator.SetTrigger("ReleaseCharge");

        // 공격 처리 로직
        Debug.Log("Deal Damage with Charged Attack");

        // 암호 초기화
        IsCorrect = false;
    }
}