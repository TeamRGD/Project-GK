using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Boss2 : MonoBehaviour
{
    #region variables
    private int maxHealth = 100;
    private int currentHealth;

    private int magicCircleCount = 0;
    private int bossAttackCount = 0;
    private int successCount = 0;
    private int attackOrderCount = 0;

    private bool isGroggy = false;
    private bool isExecutingPattern = false;
    private bool isExecutingAttack = false;
    private bool hasExecutedInitialActions = false;
    private bool canDisplay = true;
    private bool canControlSpeed = false;

    private List<Vector3> storedPositions = new List<Vector3>();
    private List<System.Action> storedAttacks = new List<System.Action>();

    private List<int> correctOrder = new List<int>();
    private List<int> playerOrder = new List<int>();

    private NavMeshAgent navMeshAgent;
    private Animator animator;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;
    #endregion

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
        // 데미지 확인용
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
                        LightFourTorches();
                        StartCoroutine(MoveAndAttack());
                        ExtinguishAllTorches();
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
            new ActionNode(ResetBossAttackCount)
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
                            new ActionNode(CheckPlayerAttackOrder),
                            new ActionNode(DamageAllMap)
                        )
                    ),
                    new ActionNode(IncrementSuccessCount)
                )
            ),
            new ActionNode(SetGroggy)
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
        navMeshAgent.isStopped = true; // 이중 멈춤이면 없애도 됨
        return true;
    }

    // 기본 공격 (공격시 이펙트 구현해야함)
    bool RandomBasicAttack()
    {
        if (!isExecutingAttack)
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

    IEnumerator DashAndSlash()
    {
        isExecutingAttack = true;

        // 대쉬
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

        // 앞발 휘두르기
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

    // 패턴 1
    void ReduceDamage()
    {
        // Debug.Log("Damage taken reduced by 90%");
    }

    void SpinAndExtinguishTorches() // 코루틴으로 구현해야할듯
    {
        // Debug.Log("Spinning quickly to extinguish all torches");
    }

    void LightMagicCircle()
    {
        // Debug.Log("Lighting the magic circle");
    }

    void LightBossEyesAndMouth()
    {
        // Debug.Log("Lighting boss eyes and mouth");
    }

    bool ControlSpeed()
    {
        if (canControlSpeed) // 마법진에서 canControlSpeed = true; 해줘야함
        {
            if (magicCircleCount == 5)
            {
                navMeshAgent.speed *= 0.5f; // 속도 50%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 6)
            {
                navMeshAgent.speed *= 0.4f; // 속도 40%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 7)
            {
                navMeshAgent.speed *= 0.3f; // 속도 30%
                canControlSpeed = false;
            }
        }
        return true;
    }

    // 패턴 2

    void LightFourTorches()
    {
        // Debug.Log("Lighting 4 torches");
    }

    void ExtinguishAllTorches()
    {
        // Debug.Log("Extinguishing all torches");
    }

    IEnumerator MoveAndAttack()
    {
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
    }

    Vector3 GetRandomPosition()
    {
        return new Vector3(Random.Range(-10, 10), 0, Random.Range(-10, 10)); // 범위 조정 필요
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
                return () => StartCoroutine(DashAndSlash());
        }
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
        if (bossAttackCount < storedPositions.Count)
        {
            Vector3 targetPosition = storedPositions[bossAttackCount];
            StartCoroutine(MoveToPosition(targetPosition));
            return true;
        }
        return false;
    }

    bool PerformStoredAttack()
    {
        if (bossAttackCount < storedAttacks.Count)
        {
            System.Action storedAttack = storedAttacks[bossAttackCount];
            storedAttack.Invoke(); // 딜레이 필요할 수 있음
            bossAttackCount++;
            return true;
        }
        return false;
    }

    bool ResetBossAttackCount()
    {
        if (bossAttackCount >= storedPositions.Count)
        {
            bossAttackCount = 0;
        }
        return true;
    }

    // 패턴 3
    void Roar()
    {
        // Debug.Log("Roaring");
        //animator.SetTrigger("Roar");
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
        // UI에 표시
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
            // 맵 전체에 데미지를 입히는 로직


            attackOrderCount = 0;
            canDisplay = true;
        }
        return false; // true여도 상관없을듯
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
        // 어떤 플레이어가 공격했는지 구분하여 playerOrder에 추가
    }
}