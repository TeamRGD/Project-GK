using System.Collections;
using UnityEngine;

public class Boss1 : MonoBehaviour
{
    public int maxHealth = 100;
    private int currentHealth;

    private BTNode behaviorTree;
    private int decodeCount = 0;
    private bool isAggroSelected = false;
    private bool isCorrectCode = false;
    private bool isExecutingPattern3 = false;

    void Start()
    {
        currentHealth = maxHealth;
        behaviorTree = CreateBehaviorTree();
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
                if (!isExecutingPattern3)
                {
                    StartCoroutine(ExecutePattern3());
                }
            }
            else if (currentHealth > 33)
            {
                behaviorTree.Execute();
            }
            else
            {
                ExecutePattern2();
            }
            yield return null;
        }
    }

    BTNode CreateBehaviorTree()
    {
        return new Sequence(
            new ActionNode(MakeInvulnerable),
            new ActionNode(GroundSlam),
            new ActionNode(HighlightBooks),
            new ActionNode(ChooseAggroTarget),
            new ActionNode(ActivateCodeInput),
            new Selector(
                new Sequence(
                    new ActionNode(CheckCorrectCode),
                    new ActionNode(HandleCorrectCode)
                ),
                new ActionNode(PerformRandomAttack)
            )
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

    bool MakeInvulnerable()
    {
        Debug.Log("Boss is now invulnerable");
        return true;
    }

    bool GroundSlam()
    {
        Debug.Log("Performing ground slam");
        return true;
    }

    bool HighlightBooks()
    {
        Debug.Log("Highlighting books");
        return true;
    }

    bool ChooseAggroTarget()
    {
        isAggroSelected = UnityEngine.Random.value > 0.5f;
        Debug.Log("Aggro target selected: " + isAggroSelected);
        return true;
    }

    bool ActivateCodeInput()
    {
        Debug.Log("Activating code input device");
        return true;
    }

    bool CheckCorrectCode()
    {
        isCorrectCode = UnityEngine.Random.value > 0.5f;
        return isCorrectCode;
    }

    bool HandleCorrectCode()
    {
        Debug.Log("Correct code entered");
        decodeCount++;
        if (decodeCount >= 3)
        {
            Debug.Log("Boss is now groggy");
        }
        else
        {
            Debug.Log("Resetting for next decoding");
        }
        return true;
    }

    bool PerformRandomAttack()
    {
        int attackType = UnityEngine.Random.Range(1, 5);
        switch (attackType)
        {
            case 1:
                Debug.Log("Attacking with spin attack");
                break;
            case 2:
                Debug.Log("Attacking with double arm");
                break;
            case 3:
                Debug.Log("Attacking with single arm");
                break;
            case 4:
                Debug.Log("Attacking with kick");
                break;
        }
        return true;
    }

    // 패턴 3 구현 (체력이 66 이상일 때 수행)
    IEnumerator ExecutePattern3()
    {
        isExecutingPattern3 = true;
        Debug.Log("Executing Pattern 3");
        // 패턴 3의 동작을 여기에 구현

        yield return new WaitForSeconds(5.0f); // 5초 대기

        isExecutingPattern3 = false;
    }

    // 패턴 2 구현 (체력이 33 이하일 때 수행)
    void ExecutePattern2()
    {
        Debug.Log("Executing Pattern 2");
        // 패턴 2의 동작을 여기에 구현
    }
}