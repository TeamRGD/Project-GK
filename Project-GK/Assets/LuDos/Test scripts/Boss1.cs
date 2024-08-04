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
    public List<GameObject> BookCases; // 8���� å���� ��ġ�� ��Ƶ� ����Ʈ

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
        isGroggy = true; // �ϴ� �̰� ������ ������ ���� �ȵ�
        //animator.SetTrigger("Groggy");
        // navMeshAgent.isStopped = true; // ���� �����̸� ���ֵ� ��
        return true;
    }

    void Die()
    {
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
    }

    void LeftArmSlam()
    {
        Debug.Log("LeftArmSlam");
    }

    bool ChangeBooksToGreen()
    {
        // 8���� å�忡�� 4���� å�� ����, �迭�� �����ص�
        // ���õ� 4���� å�� ������ ���� ���� ������ŭ å�� �ʷϺ� �ѱ�, ������ ���� �迭�� �����ص�
        if (canChange1)
        {
            Debug.Log("ChangeBooksToGreen");


            //canChange1 = false;
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // ��׷� ��� ���� (50% Ȯ��. ������)
        if (canChange1)
        {
            Debug.Log("SelectAggroTarget");


            //canChange1 = false;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // ��׷� �ƴ� �÷��̾� ������ ���������� ����
        if (canChange1)
        {
            Debug.Log("ChangeStaffToRed");

            //canChange1 = false;
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
            UIManager_Ygg.Instance.patternCode = Code;
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

        return SetGroggy();
    }

    // ���� 2
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
        // 10�ʰ� �� ������
        // animator.SetTrigger("Charge");

        yield return new WaitForSeconds(10.0f);

        // �� �߻�
        // animator.SetTrigger("ReleaseCharge");

        attackedAreas.Clear();
    }

    // ���� 3
    void Scream()
    {
        // animator.SetTrigger("Scream");
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            // UI�� å���� ������ŭ �� ����

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
        
        // BookCase�� Light ON

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

        // Player �������� ����

        // animator.SetTrigger("AttackBookCase");

        Vector3 startPosition = transform.position;
        player = GameObject.FindWithTag("Player"); // �� �÷��̾� �����ư��� �����ϴ� ���� �ʿ���

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
        // �� ���� ������

        canDisplay = true;
        playerAttackCount= 0;

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
        //if (collision.gameObject.CompareTag("BookCase"))
        //{
        //    hasCollidedWithBookCase = true;
        //    collidedBookCaseIndex = GetCollidedBookCaseIndex(collision.gameObject);
        //}
    }
}