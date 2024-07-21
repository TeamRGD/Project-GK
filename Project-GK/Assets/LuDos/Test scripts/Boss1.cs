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
        isGroggy = true; // 일단 이거 켜지면 로직은 실행 안됨
        //animator.SetTrigger("Groggy");
        // navMeshAgent.isStopped = true; // 이중 멈춤이면 없애도 됨
        return true;
    }

    bool RandomBasicAttack()
    {
        // 어그로 대상에게 기본 공격 (4개 중 랜덤)
        return true;
    }

    // 패턴 1
    void MakeInvincible()
    {
        // 무적 전환 코드
    }

    void LeftArmSlam()
    {
        // 왼쪽 팔 땅 내려치는 애니메이션 재생
    }

    bool ChangeBooksToGreen()
    {
        // N개의 책장에서 특정 책들을 연두색으로 변경
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        // 어그로 대상 선정 (50% 확률. 무작위)
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // 어그로 아닌 플레이어 지팡이 붉은색으로 변경
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool ActivateCipherDevice()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange)
        {

            canChange = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        // 옳은 암호 입력시, true 출력. 틀릴시, false 출력.
        return true;
    }

    bool ResetBookLightsAndAggro()
    {
        // 책의 빛을 끄고 보스 어그로 풀기, 카운트 + 1

        canChange = true;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // 무적 상태 해제 및 그로기

        return SetGroggy();
    }
}