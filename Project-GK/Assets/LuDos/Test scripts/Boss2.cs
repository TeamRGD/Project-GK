using System.Collections;
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

    private bool isExecutingPattern = false;
    private bool isExecutingAttack = false;
    private bool hasExecutedInitialActions = false;

    private NavMeshAgent navMeshAgent;

    private Animator animator;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;


    void Start()
    {
        currentHealth = maxHealth;
        animator = GetComponent<Animator>();
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
                    StartCoroutine(ExecutePattern(pattern2Tree));
                }
            }
            else
            {
                if (!isExecutingPattern)
                {
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
            new ActionNode(LightFourTorches),
            new WhileNode(() => attackCount <= 8,
                new Sequence(
                    new ActionNode(MoveToSpecificArea),
                    new ActionNode(RandomBasicAttack),
                    new ActionNode(StoreAttackType)
                )
            ),
            new ActionNode(ExtinguishAllTorches),
            new WhileNode(() => !isGroggy,
                new Sequence(
                    new ActionNode(MoveToDesignatedArea),
                    new ActionNode(PerformDesignatedAttack)
                )
            )
        );
    }

    BTNode CreatePattern3Tree()
    {
        return new Sequence(
            new ActionNode(Roar),
            new WhileNode(() => successCount < 3,
                new Sequence(
                    new ActionNode(DisplayAttackOrder),
                    new Selector(
                        // new ActionNode(CheckAttackOrder),
                        new ActionNode(DealMapWideDamage)
                    )
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

    // 기본 공격
    IEnumerator DashAndSlash()
    {
        isExecutingAttack = true;

        // 대쉬
        animator.SetTrigger("Dash");

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
        animator.SetTrigger("Slash");
        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator Dash()
    {
        isExecutingAttack = true;

        animator.SetTrigger("Dash");

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

        animator.SetTrigger("Slash");

        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator Bite()
    {
        isExecutingAttack = true;
 
        animator.SetTrigger("Bite");

        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    // 패턴 1
    bool ControlSpeed()
    {
        if (magicCircleCount >= 5 && magicCircleCount < 6)
        {
            navMeshAgent.speed *= 0.5f; // 속도 50%
        }
        else if (magicCircleCount >= 6 && magicCircleCount < 7)
        {
            navMeshAgent.speed *= 0.4f; // 속도 40%
        }
        else if (magicCircleCount >= 7 && magicCircleCount < 8)
        {
            navMeshAgent.speed *= 0.3f; // 속도 30%
        }
        return true;
    }


    bool SetGroggy()
    {
        isGroggy = true;
        animator.SetTrigger("Groggy");
        navMeshAgent.isStopped = true;
        return true;
    }

    bool ReduceDamage()
    {
        Debug.Log("Damage taken reduced by 90%");
        return true;
    }

    bool SpinAndExtinguishTorches()
    {
        Debug.Log("Spinning quickly to extinguish all torches");
        return true;
    }

    bool LightMagicCircle()
    {
        Debug.Log("Lighting the magic circle");
        return true;
    }

    bool LightBossEyesAndMouth()
    {
        Debug.Log("Lighting boss eyes and mouth");
        return true;
    }

    bool LightBlueFlamesOnLimbs()
    {
        Debug.Log("Lighting blue flames on arms or legs during basic attack");
        return true;
    }

    //bool ReactToPlayerAttack()
    //{
    //    Debug.Log("Boss is reacting to player attacks by lighting specific torches");
    //    n++;
    //    if (n == 5) Debug.Log("Speed reduced by 50%");
    //    if (n == 6) Debug.Log("Speed reduced by 40%");
    //    if (n == 7) Debug.Log("Speed reduced by 30%");
    //    return true;
    //}

    //bool SetGroggy()
    //{
    //    if (n >= 8)
    //    {
    //        Debug.Log("Boss is now groggy");
    //        isGroggy = true;
    //    }
    //    return true;
    //}

    // 패턴 2
    bool LightFourTorches()
    {
        Debug.Log("Lighting 4 torches");
        return true;
    }

    bool MoveToSpecificArea()
    {
        Debug.Log("Moving to specific area");
        return true;
    }

    bool StoreAttackType()
    {
        Debug.Log("Storing attack type based on area");
        attackCount++;
        return true;
    }

    bool ExtinguishAllTorches()
    {
        Debug.Log("Extinguishing all torches");
        return true;
    }

    bool MoveToDesignatedArea()
    {
        Debug.Log("Moving to designated area");
        return true;
    }

    bool PerformDesignatedAttack()
    {
        Debug.Log("Performing designated attack");
        return RandomBasicAttack();
    }

    // 패턴 3
    bool Roar()
    {
        Debug.Log("Roaring");
        return true;
    }

    bool DisplayAttackOrder()
    {
        Debug.Log("Displaying attack order on screen");
        return true;
    }

    //bool CheckAttackOrder()
    //{
    //    bool attackOrderOk = UnityEngine.Random.value > 0.5f;
    //    if (attackOrderOk)
    //    {
    //        Debug.Log("Player attacked in correct order");
    //        n++;
    //    }
    //    return attackOrderOk;
    //}

    bool DealMapWideDamage()
    {
        Debug.Log("Incorrect order, dealing damage to the entire map");
        // 광역 공격
        return false;
    }
}