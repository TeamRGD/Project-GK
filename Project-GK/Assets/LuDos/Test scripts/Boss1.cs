using System.Collections;
using System.Collections.Generic;
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
    private bool isExecutingAttack = false;
    private bool isExecutingAreaAttack = false;
    private bool hasExecutedInitialActions = false;

    private bool canChange1 = true;
    private bool canChange2 = true;
    private bool IsCorrect = false;

    private List<int> attackedAreas = new List<int>();

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
                        MakeInvincible();
                        JumpToCenter();
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
        if (!isExecutingAttack)
        {
            Debug.Log("RandomBasicAttack");

            int attackType = UnityEngine.Random.Range(1, 7);
            //switch (attackType)
            //{
            //    case 1:
            //        StartCoroutine();
            //        break;
            //    case 2:
            //        StartCoroutine();
            //        break;
            //    case 3:
            //        StartCoroutine();
            //        break;
            //    case 4:
            //        StartCoroutine();
            //        break;
            //    case 5:
            //        StartCoroutine();
            //        break;
            //    case 6:
            //        StartCoroutine();
            //        break;
            //}
        }
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
        if (canChange1)
        {

            canChange1 = false;
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // ��׷� ��� ���� (50% Ȯ��. ������)
        if (canChange1)
        {

            canChange1 = false;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // ��׷� �ƴ� �÷��̾� ������ ���������� ����
        if (canChange1)
        {

            canChange1 = false;
        }
        return true;
    }

    bool ActivateCipherDevice1()
    {
        // �߾ӿ� ��ȣ �Է� ��ġ Ȱ��ȭ
        if (canChange1)
        {
            // ��ȣ �Է� ��ġ�� ��ȣ ����

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

        canChange1 = true;
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
            // ��ȣ �Է� ��ġ�� ��ȣ ����

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
}