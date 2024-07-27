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
        // ��׷� ��󿡰� �⺻ ���� (6�� �� ����)
        return true;
    }

    // ���� 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");
    }

    void LeftArmSlam()
    {
        // ���� �� �� ����ġ�� �ִϸ��̼� ���
        Debug.Log("LeftArmSlam");
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

        canChange = true;
        IsCorrect = false;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // ���� ���� ���� �� �׷α�

        return SetGroggy();
    }

    // ���� 2
    bool AttackAreas()
    {
        StartCoroutine(AttackAreasCoroutine());
        return true;
    }

    IEnumerator AttackAreasCoroutine()
    {
        // animator.SetTrigger("RaiseArms");

        yield return new WaitForSeconds(1.0f);

        // 8���� ���� �� Ÿ������ ���� 1���� ���� ���� + ����Ʈ�� �����ϱ�
        int untouchedArea = Random.Range(0, 8);
        // Debug.Log("Untouched Area: " + untouchedArea);

        // Ÿ��
        // animator.SetTrigger("AttackArea);

        // yield return new WaitForSeconds(0.5f); // Ÿ�� �ִϸ��̼� ��� �ð�

        // Ÿ���� ���� ������
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
        // 10�ʰ� �� ������
        Debug.Log("Charging for 10 seconds");
        // animator.SetTrigger("Charge");

        yield return new WaitForSeconds(10.0f);

        // �� ������ �Ϸ� �� ����
        Debug.Log("Release Charged Attack");
        // animator.SetTrigger("ReleaseCharge");

        // ���� ó�� ����
        Debug.Log("Deal Damage with Charged Attack");

        // ��ȣ �ʱ�ȭ
        IsCorrect = false;
    }
}