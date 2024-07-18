using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Boss2 : MonoBehaviour
{
    public int maxHealth = 100;
    private int currentHealth;

    private int magicCircleCount = 0;

    private int attackCount = 0;

    private int successCount = 0;

    private bool isGroggy = false;

    private int pattern2Count = 0;
    private int attackOrderCount = 0;

    private bool isExecutingPattern = false;
    private bool isExecutingAttack = false;
    private bool hasExecutedInitialActions = false;
    private bool canDisplay = true;

    private List<int> correctOrder = new List<int>();
    private List<int> playerOrder = new List<int>();

    private List<Vector3> storedPositions = new List<Vector3>();
    private List<System.Action> storedAttacks = new List<System.Action>();

    private NavMeshAgent navMeshAgent;

    private Animator animator;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;


    void Start()
    {
        currentHealth = maxHealth;
        //animator = GetComponent<Animator>();
        navMeshAgent = GetComponent<NavMeshAgent>();
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();
        StartCoroutine(ExecuteBehaviorTree());
    }

    void Update()
    {
        // ������ Ȯ�ο�
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
                        ReduceDamage();
                        SpinAndExtinguishTorches();
                        LightMagicCircle();
                        LightBossEyesAndMouth();
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
                        StartCoroutine(ExecutePattern2InitialActions());
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
                        Roar();
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
            new ActionNode(ControlSpeed),
            new Selector(
                new Sequence(
                    new ConditionNode(() => magicCircleCount < 8),
                    new ActionNode(RandomBasicAttack)
                ),
                new Sequence(
                    new ConditionNode(() => magicCircleCount >= 8),
                    new ActionNode(SetGroggy)
                )
            )
        );
    }

    BTNode CreatePattern2Tree()
    {
        return new Sequence(
            new ActionNode(MoveToStoredPosition),
            new ActionNode(PerformStoredAttack),
            new ActionNode(ResetPattern2Count)
        );
    }

    BTNode CreatePattern3Tree()
    {
        return new Sequence(
            new ActionNode(RandomBasicAttack),
            new WhileNode(() => successCount < 3,
                new Sequence(
                    new ActionNode(DisplayAttackOrder),
                    new WhileNode(() => attackOrderCount < 8,
                        new Selector(
                            new ConditionNode(CheckPlayerAttackOrder),
                            new ActionNode(DamageAllMap)
                        )
                    ),
                    new ActionNode(IncrementSuccessCount)
                )
            ),
            new ActionNode(SetGroggy)
        );
    }

    public void TakeDamage(int amount)
    {
        currentHealth -= amount;
        if (currentHealth < 0)
        {
            currentHealth = 0;
        }
    }

    bool RandomBasicAttack()
    {
        if (!isExecutingPattern && !isExecutingAttack)
        {
            int attackType = UnityEngine.Random.Range(1, 5);
            switch (attackType)
            {
                case 1:
                    StartCoroutine(DashAndSlash());
                    break;
                case 2:
                    StartCoroutine(Dash());
                    break;
                case 3:
                    StartCoroutine(Bite());
                    break;
                case 4:
                    StartCoroutine(Slash());
                    break;
            }
        }
        return true;
    }

    IEnumerator ExecutePattern(BTNode patternTree)
    {
        isExecutingPattern = true;
        // n = 0;
        isGroggy = false;

        while (!isGroggy)
        {
            patternTree.Execute();
            yield return null;
        }

        isExecutingPattern = false;
    }

    // �⺻ ����
    IEnumerator DashAndSlash()
    {
        isExecutingAttack = true;

        // �뽬
        //animator.SetTrigger("Dash");

        float dashTime = 1.0f;
        float dashSpeed = 10.0f;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            navMeshAgent.Move(transform.forward * dashSpeed * Time.deltaTime);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // �չ� �ֵθ���
        //animator.SetTrigger("Slash");
        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator Dash()
    {
        isExecutingAttack = true;

        //animator.SetTrigger("Dash");

        float dashTime = 1.0f;
        float dashSpeed = 10.0f;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            navMeshAgent.Move(transform.forward * dashSpeed * Time.deltaTime);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        isExecutingAttack = false;
    }

    IEnumerator Slash()
    {
        isExecutingAttack = true;

        //animator.SetTrigger("Slash");

        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator Bite()
    {
        isExecutingAttack = true;
 
        //animator.SetTrigger("Bite");

        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    // ���� 1
    bool ControlSpeed()
    {
        if (magicCircleCount >= 5 && magicCircleCount < 6)
        {
            navMeshAgent.speed *= 0.5f; // �ӵ� 50%
        }
        else if (magicCircleCount >= 6 && magicCircleCount < 7)
        {
            navMeshAgent.speed *= 0.4f; // �ӵ� 40%
        }
        else if (magicCircleCount >= 7 && magicCircleCount < 8)
        {
            navMeshAgent.speed *= 0.3f; // �ӵ� 30%
        }
        return true;
    }


    bool SetGroggy()
    {
        isGroggy = true;
        //animator.SetTrigger("Groggy");
        navMeshAgent.isStopped = true;
        return true;
    }

    bool ReduceDamage()
    {
        // Debug.Log("Damage taken reduced by 90%");
        return true;
    }

    bool SpinAndExtinguishTorches()
    {
        // Debug.Log("Spinning quickly to extinguish all torches");
        return true;
    }

    bool LightMagicCircle()
    {
        // Debug.Log("Lighting the magic circle");
        return true;
    }

    bool LightBossEyesAndMouth()
    {
        // Debug.Log("Lighting boss eyes and mouth");
        return true;
    }

    // ���� 2
    IEnumerator ExecutePattern2InitialActions()
    {
        LightFourTorches();

        for (int n = 0; n < 8; n++)
        {
            Vector3 targetPosition = GetRandomPosition();
            System.Action randomAttack = GetRandomAttack();

            storedPositions.Add(targetPosition);
            storedAttacks.Add(randomAttack);

            yield return MoveToPosition(targetPosition);
            randomAttack.Invoke();
            yield return new WaitForSeconds(3.0f);
        }

        ExtinguishAllTorches();
    }

    Vector3 GetRandomPosition()
    {
        return new Vector3(Random.Range(-10, 10), 0, Random.Range(-10, 10)); // ���� ���� �ʿ�
    }

    System.Action GetRandomAttack()
    {
        int attackType = UnityEngine.Random.Range(1, 5);
        switch (attackType)
        {
            case 1:
                return () => StartCoroutine(DashAndSlash());
            case 2:
                return () => StartCoroutine(Dash());
            case 3:
                return () => StartCoroutine(Bite());
            case 4:
                return () => StartCoroutine(Slash());
            default:
                return () => StartCoroutine(Slash());
        }
    }

    bool ResetPattern2Count()
    {
        if (pattern2Count >= storedPositions.Count)
        {
            pattern2Count = 0;
        }
        return true;
    }

    IEnumerator MoveToPosition(Vector3 targetPosition)
    {
        navMeshAgent.SetDestination(targetPosition);
        while (Vector3.Distance(transform.position, targetPosition) > 0.1f)
        {
            yield return null;
        }
    }

    bool MoveToStoredPosition()
    {
        if (pattern2Count < storedPositions.Count)
        {
            Vector3 targetPosition = storedPositions[pattern2Count];
            StartCoroutine(MoveToPosition(targetPosition));
            return true;
        }
        return false;
    }

    bool PerformStoredAttack()
    {
        if (pattern2Count < storedAttacks.Count)
        {
            System.Action storedAttack = storedAttacks[pattern2Count];
            storedAttack.Invoke();
            pattern2Count++;
            return true;
        }
        return false;
    }

    bool LightFourTorches()
    {
        // Debug.Log("Lighting 4 torches");
        return true;
    }

    bool ExtinguishAllTorches()
    {
        // Debug.Log("Extinguishing all torches");
        return true;
    }

    // ���� 3
    bool Roar()
    {
        Debug.Log("Roaring");
        //animator.SetTrigger("Roar"); // ��ȿ �ִϸ��̼� Ʈ���� ����
        return true;
    }

    bool DisplayAttackOrder()
    {
        if (canDisplay)
        {
            Debug.Log("Displaying attack order on screen");

            playerOrder = new List<int> { 0, 0, 0, 0, 0, 0, 0, 0 };
            correctOrder = new List<int> { 1, 1, 1, 1, 2, 2, 2, 2 };
            Shuffle(correctOrder);

            DisplayOrderOnUI(correctOrder);

            attackOrderCount = 0;

            canDisplay = false;
        }
        return true;
    }

    void Shuffle<T>(List<T> list)
    {
        for (int i = list.Count - 1; i > 0; i--)
        {
            int j = Random.Range(0, i + 1);
            T temp = list[i];
            list[i] = list[j];
            list[j] = temp;
        }
    }

    void DisplayOrderOnUI(List<int> order)
    {
        // UI�� order�� ǥ��
    }

    bool CheckPlayerAttackOrder()
    {
        if (playerOrder[attackOrderCount] != 0)
        {
            if (playerOrder[attackOrderCount] == correctOrder[attackOrderCount])
            {
                attackOrderCount++;
                return true;
            }
            return false;
        }
        return false;
    }

    bool DamageAllMap()
    {
        if (playerOrder[attackOrderCount] != 0)
        {
            // �� ��ü�� �������� ������ ����


            attackOrderCount = 0;
            canDisplay = true;
        }
        return false; // true���� ���������
    }

    bool IncrementSuccessCount()
    {
        if (attackOrderCount >= 8)
        {
            successCount++;
            canDisplay = true;
        }
        return true;
    }

    private void OnCollisionEnter(Collision collision)
    {
        // � �÷��̾ �����ߴ��� �����Ͽ� playerOrder�� �߰�
    }
}