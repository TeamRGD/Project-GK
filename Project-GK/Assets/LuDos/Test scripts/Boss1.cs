using System.Collections;
using UnityEngine;
using UnityEngine.AI;

public class Boss1 : MonoBehaviour
{
    public int maxHealth = 100;
    private int currentHealth;

    private int successCount = 0;

    private bool isGroggy = false;
    private bool isExecutingPattern = false;
    // private bool isExecutingAttack = false;
    private bool hasExecutedInitialActions = false;

    private bool canChange = true;

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
        if (Input.GetKeyDown(KeyCode.Space))
        {
            TakeDamage(10);
            Debug.Log("Boss Health: " + currentHealth);
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
            else
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
        isGroggy = true; // �ϴ� �̰� ������ ������ ���� �ȵ�
        //animator.SetTrigger("Groggy");
        // navMeshAgent.isStopped = true; // ���� �����̸� ���ֵ� ��
        return true;
    }

    bool RandomBasicAttack()
    {
        // ��׷� ��󿡰� �⺻ ���� (4�� �� ����)
        return true;
    }

    // ���� 1
    void MakeInvincible()
    {
        // ���� ��ȯ �ڵ�
    }

    void LeftArmSlam()
    {
        // ���� �� �� ����ġ�� �ִϸ��̼� ���
    }

    bool ChangeBooksToGreen()
    {
        // N���� å�忡�� Ư�� å���� ���λ����� ����
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // ��׷� ��� ���� (50% Ȯ��. ������)
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // ��׷� �ƴ� �÷��̾� ������ ���������� ����
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool ActivateCipherDevice()
    {
        // �߾ӿ� ��ȣ �Է� ��ġ Ȱ��ȭ
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        // ���� ��ȣ �Է½�, true ���. Ʋ����, false ���.
        return true;
    }

    bool ResetBookLightsAndAggro()
    {
        // å�� ���� ���� ���� ��׷� Ǯ��, ī��Ʈ + 1

        canChange = true;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // ���� ���� ���� �� �׷α�

        return SetGroggy();
    }
}