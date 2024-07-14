using System.Collections;
using UnityEngine;

public class Boss2 : MonoBehaviour
{
    public int maxHealth = 100;
    private int currentHealth;
    private Animator animator;
    private bool isExecutingAttack = false;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;

    private int n = 0;
    private bool isGroggy = false;
    private bool isExecutingPattern = false;

    void Start()
    {
        currentHealth = maxHealth;
        animator = GetComponent<Animator>();
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
            new ActionNode(ReduceDamage),
            new ActionNode(SpinAndExtinguishTorches),
            new ActionNode(LightMagicCircle),
            new ActionNode(LightBossEyesAndMouth),
            new ActionNode(LightBlueFlamesOnLimbs),
            new WhileNode(() => n < 8,
                new ActionNode(ReactToPlayerAttack)
            ),
            new ActionNode(SetGroggy)
        );
    }

    BTNode CreatePattern2Tree()
    {
        return new Sequence(
            new ActionNode(LightFourTorches),
            new WhileNode(() => n <= 8,
                new Sequence(
                    new ActionNode(MoveToSpecificArea),
                    new ActionNode(RandomAttack),
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
            new WhileNode(() => n < 3,
                new Sequence(
                    new ActionNode(DisplayAttackOrder),
                    new Selector(
                        new ActionNode(CheckAttackOrder),
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

    bool DefaultAttack()
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
                    StartCoroutine(Charge());
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
        n = 0;
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
        Debug.Log("Dashing and slashing with front paws (Critical Hit)");
        animator.SetTrigger("Dash");
        // 대쉬
        yield return new WaitForSeconds(1.0f);
        animator.SetTrigger("Slash");
        // 앞발 휘두르기
        yield return new WaitForSeconds(1.0f);
        isExecutingAttack = false;
    }

    IEnumerator Charge()
    {
        isExecutingAttack = true;
        Debug.Log("Charging (Damage-inflicting dash)");
        animator.SetTrigger("Charge");
        // 돌진
        yield return new WaitForSeconds(1.0f);
        isExecutingAttack = false;
    }

    IEnumerator Bite()
    {
        isExecutingAttack = true;
        Debug.Log("Biting");
        animator.SetTrigger("Bite");
        // 깨물기
        yield return new WaitForSeconds(1.0f);
        isExecutingAttack = false;
    }

    IEnumerator Slash()
    {
        isExecutingAttack = true;
        Debug.Log("Slashing with front paw");
        animator.SetTrigger("Slash");
        // 앞발 휘두르기
        yield return new WaitForSeconds(1.0f);
        isExecutingAttack = false;
    }

    // 패턴 1
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

    bool ReactToPlayerAttack()
    {
        Debug.Log("Boss is reacting to player attacks by lighting specific torches");
        n++;
        if (n == 5) Debug.Log("Speed reduced by 50%");
        if (n == 6) Debug.Log("Speed reduced by 40%");
        if (n == 7) Debug.Log("Speed reduced by 30%");
        return true;
    }

    bool SetGroggy()
    {
        if (n >= 8)
        {
            Debug.Log("Boss is now groggy");
            isGroggy = true;
        }
        return true;
    }

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

    bool RandomAttack()
    {
        Debug.Log("Performing random attack");
        return DefaultAttack();
    }

    bool StoreAttackType()
    {
        Debug.Log("Storing attack type based on area");
        n++;
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
        return DefaultAttack();
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

    bool CheckAttackOrder()
    {
        bool attackOrderOk = UnityEngine.Random.value > 0.5f;
        if (attackOrderOk)
        {
            Debug.Log("Player attacked in correct order");
            n++;
        }
        return attackOrderOk;
    }

    bool DealMapWideDamage()
    {
        Debug.Log("Incorrect order, dealing damage to the entire map");
        // 광역 공격
        return false;
    }
}