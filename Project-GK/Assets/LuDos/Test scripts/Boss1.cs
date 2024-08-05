using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;

public class Boss1 : MonoBehaviour
{
    public int maxHealth = 33;
    private int currentHealth;

    private int successCount = 0;
    private int attackCount = 0;
    public int collisionCount = 0;

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
    private bool isWrongBookCase = false;

    private Coroutine chargeAttackCoroutine;
    private Coroutine moveBackCoroutine;

    private bool canChange1 = true;
    private bool canChange2 = true;
    private bool canDisplay = true;
    public bool IsCorrect = false;

    private bool isInvincible = false;
    private bool isAggroFixed = false;

    public int Code;


    private List<int> bookcaseIndices = new List<int>();
    private List<int> numberOfBooks = new List<int>();
    private List<int> attackedAreas = new List<int>();
    public List<GameObject> BookCases; // 7개의 책장의 위치를 담아둔 리스트
    public List<GameObject> Areas;

    // private NavMeshAgent navMeshAgent;
    // private Animator animator;
    private GameObject player;
    public List<GameObject> PlayerList;
    private GameObject aggroTarget;
    public GameObject ChangedStaff;
    private Rigidbody rb;
    public GameObject Pattern3ShockWave;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;

    void Start()
    {
        currentHealth = maxHealth;
        //animator = GetComponent<Animator>();
        // navMeshAgent = GetComponent<NavMeshAgent>();
        rb = GetComponent<Rigidbody>();
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
        if (Input.GetKeyDown(KeyCode.C))
        {
            collisionCount++;
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
                        if (isGroggy)
                        {
                            StopCoroutine(ExecutePattern(pattern1Tree));
                            isGroggy = false;
                            // navMeshAgent.isStopped = false;
                        }

                        MakeInvincible();
                        yield return StartCoroutine(JumpToCenter());
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
                        if (isGroggy)
                        {
                            StopCoroutine(ExecutePattern(pattern2Tree));
                            isGroggy = false;
                            // navMeshAgent.isStopped = false;
                        }

                        MakeInvincible();
                        Scream();
                        hasExecutedInitialActions3 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern3Tree));
                }
            }
            else
            {
                StopCoroutine(ExecutePattern(pattern3Tree));
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
            new WhileNode(() => collisionCount < 8,
                new Sequence(
                    new ActionNode(LightAndAttackBookCase),
                    new ActionNode(DamageAllMap)
                    )
                ),
            new ActionNode(ReleaseInvincibilityAndGroggy)
        );
    }

    IEnumerator ExecutePattern(BTNode patternTree)
    {
        isExecutingPattern = true;

        while (!isGroggy)
        {
            patternTree.Execute();
            yield return null;
        }

        isExecutingPattern = false;
    }

    public void TakeDamage(int amount)
    {
        if (!isInvincible)
        {
            currentHealth -= amount;
            if (currentHealth < 0)
            {
                currentHealth = 0;
            }
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
        Debug.Log("Die");

        //navMeshAgent.isStopped = true;

        //animator.SetTrigger("Die");
    }

    bool RandomBasicAttack()
    {
        // 어그로 대상 지정 필요
        if (!isExecutingAttack)
        {
            Debug.Log("RandomBasicAttack");

            if (isAggroFixed)
            {
                // 한놈만 팬다
                aggroTarget = PlayerList[0];
            }
            else
            {
                // 랜덤하게 둘 중 선택
                int idx = Random.Range(0, PlayerList.Count);
                aggroTarget = PlayerList[idx];
            }

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

        isInvincible = true;
    }

    void LeftArmSlam()
    {
        Debug.Log("LeftArmSlam");

        // animator.SetTrigger("LeftArmSlam");
    }

    bool ChangeBooksToGreen()
    {
        if (canChange1)
        {
            Debug.Log("ChangeBooksToGreen");

            // 7개의 책장 중에서 랜덤하게 4개의 책장 선택
            while (bookcaseIndices.Count < 4)
            {
                int index = Random.Range(0, 7);
                if (!bookcaseIndices.Contains(index))
                {
                    bookcaseIndices.Add(index);
                }
            }
            Debug.Log("Selected Bookcase Indices: " + string.Join(", ", bookcaseIndices));

            // 각 책장에서 몇 개의 책을 선택할건지 정함
            for (int i = 0; i < 4; i++)
            {
                int numBooks = Random.Range(1, 11);
                numberOfBooks.Add(numBooks);
            }
            Debug.Log("Number of Books to Select: " + string.Join(", ", numberOfBooks));

            for (int i = 0; i < bookcaseIndices.Count; i++)
            {
                int bookcaseIndex = bookcaseIndices[i];
                int numBooks = numberOfBooks[i];
                Debug.Log("Bookcase " + bookcaseIndex + ": Selecting " + numBooks + " books");

                // 각 책장에서 책 선택
                List<int> bookIndices = new List<int>();
                while (bookIndices.Count < numBooks)
                {
                    int bookIndex = Random.Range(0, 10);
                    if (!bookIndices.Contains(bookIndex))
                    {
                        bookIndices.Add(bookIndex);
                    }
                }
                Debug.Log("Bookcase " + bookcaseIndex + ": Selected Book Indices: " + string.Join(", ", bookIndices));

                // 책을 초록색으로 바꿈 [임시완]
                //foreach (int bookIndex in bookIndices)
                //{
                //    Transform book = BookCases[bookcaseIndex].transform.GetChild(bookIndex);
                //    book.gameObject.SetActive(true);
                //    // Debug.Log("Bookcase " + bookcaseIndex + ": Book " + bookIndex + " light turned on.");
                //}
            }
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        if (canChange1)
        {
            Debug.Log("SelectAggroTarget");

            isAggroFixed = true;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // 어그로 아닌 플레이어 지팡이 붉은색으로 변경
        if (canChange1)
        {
            Debug.Log("ChangeStaffToRed");

            // ChangedStaff.SetActive(true); [임시완] 이거 하나 끄고 하나 켜는 방식으로 할까
        }
        return true;
    }

    bool ActivateCipherDevice1()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange1)
        {
            Debug.Log("ActivateCipherDevice1");

            for(int i = 0; i < 4; i++)
            {
                Code += (bookcaseIndices[i] + 1) * numberOfBooks[i];
            }
            // UIManager_Ygg.Instance.patternCode = Code;
            canChange1 = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        if (IsCorrect)
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
        Debug.Log("ResetBookLightsAndAggro");

        // 책 불빛 끄기 [임시완]
        //foreach (GameObject bookCase in BookCases)
        //{
        //    foreach (Transform book in bookCase.transform)
        //    {
        //        if (book.gameObject.activeSelf)
        //        {
        //            book.gameObject.SetActive(false);
        //            // Debug.Log("Book " + book.name + " light turned off.");
        //        }
        //    }
        //}

        canChange1 = true;
        IsCorrect = false;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // 무적 상태 해제 및 그로기

        Debug.Log("ReleaseInvincibilityAndGroggy");

        isInvincible = false;

        if (!canChange2)
        {
            Debug.Log("StopCoroutine");
            StopCoroutine(chargeAttackCoroutine);
            canChange2 = true;
        }
        if (!canDisplay)
        {
            Debug.Log("StopCoroutine");
            StopCoroutine(moveBackCoroutine);
            canDisplay = true;
        }

        return SetGroggy();
    }

    // 패턴 2
    IEnumerator JumpToCenter()
    {
        isExecutingPattern = true;

        Vector3 targetPosition = new Vector3(-4.0f, 0.31f, 2.25f); // [임시완]
        float jumpSpeed = 15f;

        Vector3 startPosition = transform.position;
        float distance = Vector3.Distance(startPosition, targetPosition);
        float totalTime = distance / jumpSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < totalTime)
        {
            float t = elapsedTime / totalTime;
            float height = Mathf.Sin(Mathf.PI * t) * 10.0f; // 점프 높이
            transform.position = Vector3.Lerp(startPosition, targetPosition, t) + Vector3.up * height;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // 최종 위치 설정
        transform.position = targetPosition;

        isExecutingPattern = false;
    }

    bool AttackAreas()
    {
        if (isExecutingAreaAttack) return false;

        Debug.Log("AttackAreas");
        Debug.Log("attackCount: " + attackCount);

        StartCoroutine(AttackAreasCoroutine());
        return true;
    }

    IEnumerator AttackAreasCoroutine()
    {
        isExecutingAreaAttack = true;

        // animator.SetTrigger("RaiseArms");
        Debug.Log("RaiseArms...");

        int untouchedArea = Random.Range(0, 8);

        attackedAreas.Add(untouchedArea); // ActivateCipherDevice 에서 암호 입력 장치로 전달
        // Debug.Log("Untouched Area: " + untouchedArea);

        for (int i = 0; i < Areas.Count; i++) // [임시완]
        {
            if (i != untouchedArea)
            {
                Areas[i].SetActive(true);
            }
        }

        yield return new WaitForSeconds(4.0f);

        // animator.SetTrigger("AttackAreas");

        for (int i = 0; i < Areas.Count; i++)
        {
            Areas[i].SetActive(false);
        }

        attackCount++;

        isExecutingAreaAttack = false;
    }
    bool ActivateCipherDevice2()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange2)
        {
            Code = ConvertListToInt(attackedAreas);
            Debug.Log("Code: " + Code);
            Debug.Log("Attacked Areas: " + string.Join(", ", attackedAreas));
            // UIManager_Ygg.Instance.patternCode = Code;
        }
        return true;
    }

    int ConvertListToInt(List<int> list)
    {
        StringBuilder sb = new StringBuilder();
        foreach (int value in list)
        {
            sb.Append(value);
        }
        return int.Parse(sb.ToString());
    }


    bool ChargeAttack()
    {
        if (canChange2)
        {
            canChange2 = false;
            chargeAttackCoroutine = StartCoroutine(ChargeAttackCoroutine());
        }
        return true;
    }

    IEnumerator ChargeAttackCoroutine()
    {
        // 10초간 기 모으기
        // animator.SetTrigger("Charge");
        Debug.Log("Charge...");

        yield return new WaitForSeconds(10.0f);

        // 기 발사
        // animator.SetTrigger("ReleaseCharge");
        Debug.Log("ReleaseCharge");

        StartCoroutine(CreateShockwave());

        attackedAreas.Clear();
        attackCount = 0;
        canChange2 = true;
    }

    IEnumerator CreateShockwave()
    {
        GameObject shockwave = Instantiate(Pattern3ShockWave, transform.position, Quaternion.identity);
        float duration = 2.0f; // 충격파가 퍼지는 시간
        float elapsedTime = 0.0f;

        while (elapsedTime < duration)
        {
            float t = elapsedTime / duration;
            float outerRadius = Mathf.Lerp(1, 10, t); // 외부 반지름 조정
            float innerRadius = Mathf.Lerp(0, 9, t); // 내부 반지름 조정
            shockwave.transform.localScale = new Vector3(outerRadius, 1, outerRadius);
            // 내부 반지름 조정은 쉐이더 또는 메쉬 조작이 필요할 수 있습니다.
            // 여기에 추가적인 로직을 넣어야 합니다.

            elapsedTime += Time.deltaTime;
            yield return null;
        }

        Destroy(shockwave); // 충격파 효과 제거
    }

    // 패턴 3
    void Scream()
    {
        Debug.Log("Scream");
        // animator.SetTrigger("Scream");
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            // UI에 책장의 개수만큼 원 띄우기

            Debug.Log("DisplayBookCaseOrder");

            canDisplay = false;
        }
        return true;
    }
    bool LightAndAttackBookCase()
    {
        if (!isExecutingBookAttack)
        {
            StartCoroutine(LightAndAttackBookCaseCoroutine());
        }
        return isWrongBookCase; // Default false
    }

    IEnumerator LightAndAttackBookCaseCoroutine()
    {
        isExecutingBookAttack = true;

        // 랜덤하게 책장 선택
        selectedBookCaseIndex = Random.Range(0, 7);
        Debug.Log("Book Case Index: " + selectedBookCaseIndex);

        // BookCase의 Light ON


        yield return new WaitForSeconds(5.0f); // 불 켜는 시간

        // Player 방향으로 돌진
        Debug.Log("Attack BookCase");
        // animator.SetTrigger("AttackBookCase");

        player = GameObject.FindWithTag("Player"); // 두 플레이어 번갈아가며 선택하는 로직 필요함
        Vector3 targetPosition = player.transform.position;
        Vector3 direction = (targetPosition - transform.position).normalized;
        transform.LookAt(targetPosition);

        hasCollidedWithBookCase = false;
        collidedBookCaseIndex = -1;

        while (!hasCollidedWithBookCase)
        {
            transform.position += direction * Time.deltaTime * 10.0f;
            yield return null;
        }

        if (collidedBookCaseIndex == selectedBookCaseIndex)
        {
            Debug.Log("Correct Collision");
            collisionCount++;
        }
        else
        {
            isWrongBookCase = true;
        }

        yield return moveBackCoroutine = StartCoroutine(MoveBackToCenter());

        isExecutingBookAttack = false;
    }

    IEnumerator MoveBackToCenter()
    {
        Debug.Log("MoveBackToCenter");

        Vector3 startPosition = transform.position;
        Vector3 centerPosition = new Vector3(-4.0f, 0.31f, 2.25f); // 맵의 중앙 위치
        float moveDuration = 5.0f;
        float elapsedTime = 0.0f;

        while (elapsedTime < moveDuration)
        {
            transform.position = Vector3.Lerp(startPosition, centerPosition, elapsedTime / moveDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = centerPosition;
    }

    bool DamageAllMap()
    {
        // 맵 전역 데미지
        Debug.Log("DamageAllMap");

        canDisplay = true;
        collisionCount = 0;
        isWrongBookCase = false;

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
        if (collision.gameObject.CompareTag("BookCase"))
        {
            hasCollidedWithBookCase = true;
            collidedBookCaseIndex = GetCollidedBookCaseIndex(collision.gameObject);

            rb.velocity = Vector3.zero;
            rb.angularVelocity = Vector3.zero;
        }
    }
}