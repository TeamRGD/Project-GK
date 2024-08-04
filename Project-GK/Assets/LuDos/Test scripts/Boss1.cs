using System.Collections;
using System.Collections.Generic;
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

    public int Code;

    private Vector3 targetBookCasePosition;

    private List<int> attackedAreas = new List<int>();
    public List<GameObject> BookCases; // 8���� å���� ��ġ�� ��Ƶ� ����Ʈ

    // private NavMeshAgent navMeshAgent;
    // private Animator animator;
    private GameObject player;
    private Rigidbody rb;

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
        isGroggy = true; // �ϴ� �̰� ������ ������ ���� �ȵ�
        //animator.SetTrigger("Groggy");
        // navMeshAgent.isStopped = true; // ���� �����̸� ���ֵ� ��
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
        // ��׷� ��� ���� �ʿ�
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

        // ���� ������ ���������� �� ������ Ÿ��
        for (int i = 0; i < 4; i++)
        {
            // �ð����
            // animator.SetTrigger("SpinArmsClockwise");
            yield return new WaitForSeconds(1.0f);

            // �ݽð����
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

        // 3�ܰ� �����
        for (int i = 0; i < 3; i++)
        {
            // ����� ����


            yield return new WaitForSeconds(3.0f);
        }

        isExecutingAttack = false;
    }

    IEnumerator AlternatingArmSlamCoroutine()
    {
        isExecutingAttack = true;

        // �� ���� ������ ��� ����ġ�� Ÿ�� (�� 5��)
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

        // ���� Ÿ�� + �����


        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator PalmStrikeCoroutine()
    {
        isExecutingAttack = true;

        // animator.SetTrigger("PalmStrike");

        // �չٴ����� ����ġ�� (�ǰ� �÷��̾� 2�� ����)


        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator HalfMapSweepCoroutine()
    {
        isExecutingAttack = true;

        // animator.SetTrigger("HalfMapSweep");

        // �� ���� (�ݿ� ������ ����)


        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    // ���� 1
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
        // 8���� å�忡�� 4���� å�� ����, �迭�� �����ص�
        // ���õ� 4���� å�� ������ ���� ���� ������ŭ å�� �ʷϺ� �ѱ�, ������ ���� �迭�� �����ص�
        if (canChange1)
        {
            Debug.Log("ChangeBooksToGreen");


        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // ��׷� ��� ���� (50% Ȯ��. ������)
        if (canChange1)
        {
            Debug.Log("SelectAggroTarget");


        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // ��׷� �ƴ� �÷��̾� ������ ���������� ����
        if (canChange1)
        {
            Debug.Log("ChangeStaffToRed");


        }
        return true;
    }

    bool ActivateCipherDevice1()
    {
        // �߾ӿ� ��ȣ �Է� ��ġ Ȱ��ȭ
        if (canChange1)
        {
            Debug.Log("ActivateCipherDevice1");

            Code = 1111; // �ӽ� ���� �ڵ�, ���� ����ϴ� ������
            // UIManager_Ygg.Instance.patternCode = Code;
            canChange1 = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        // ���� ��ȣ �Է½�, true ���. Ʋ�� ��, false ���.
        if (IsCorrect) // IsCorrect�� ��ȣ �Է� ��ġ�� �ùٸ� ��ȣ�� �ԷµǾ��� �� true�� �ٲ�.
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
        // å�� ���� ���� ���� ��׷� Ǯ��, ī��Ʈ + 1

        Debug.Log("ResetBookLightsAndAggro");

        canChange1 = true;
        IsCorrect = false;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // ���� ���� ���� �� �׷α�

        Debug.Log("ReleaseInvincibilityAndGroggy");

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

    // ���� 2
    void JumpToCenter() // �ڷ�ƾ���� �����ؾ���
    {
        Debug.Log("JumpToCenter");
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

        yield return new WaitForSeconds(1.0f); // �ִϸ��̼� ��� �ð�

        int untouchedArea = Random.Range(1, 9);

        attackedAreas.Add(untouchedArea); // ActivateCipherDevice ���� ��ȣ �Է� ��ġ�� ����
        // Debug.Log("Untouched Area: " + untouchedArea);

        // animator.SetTrigger("AttackAreas");

        // yield return new WaitForSeconds(0.5f); // Ÿ�� �ִϸ��̼� ��� �ð�

        attackCount++;

        isExecutingAreaAttack = false;
    }
    bool ActivateCipherDevice2()
    {
        // �߾ӿ� ��ȣ �Է� ��ġ Ȱ��ȭ
        if (canChange2)
        {
            Code = 2222; // �ӽ�, ���� attackedAreas�� ���� ����
            Debug.Log("Attacked Areas: " + string.Join(", ", attackedAreas));
            // UIManager_Ygg.Instance.patternCode = Code;
            //canChange2 = false;
        }
        return true;
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
        // 10�ʰ� �� ������
        // animator.SetTrigger("Charge");
        Debug.Log("Charge...");

        yield return new WaitForSeconds(10.0f);

        // �� �߻�
        // animator.SetTrigger("ReleaseCharge");
        Debug.Log("ReleaseCharge");

        attackedAreas.Clear();
        attackCount = 0;
        canChange2 = true;
    }

    // ���� 3
    void Scream()
    {
        Debug.Log("Scream");
        // animator.SetTrigger("Scream");
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            // UI�� å���� ������ŭ �� ����

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

        // �����ϰ� å�� ����
        selectedBookCaseIndex = Random.Range(0, 8);
        Debug.Log("Book Case Index: " + selectedBookCaseIndex);

        // BookCase�� Light ON


        yield return new WaitForSeconds(5.0f); // �� �Ѵ� �ð�

        // Player �������� ����
        Debug.Log("Attack BookCase");
        // animator.SetTrigger("AttackBookCase");

        player = GameObject.FindWithTag("Player"); // �� �÷��̾� �����ư��� �����ϴ� ���� �ʿ���
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
        Vector3 centerPosition = new Vector3(-4.0f, 0.31f, 2.25f); // ���� �߾� ��ġ
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
        // �� ���� ������
        Debug.Log("DamageAllMap");

        canDisplay = true;
        collisionCount = 0;
        isWrongBookCase = false;

        return true;
    }

    // �� ��
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