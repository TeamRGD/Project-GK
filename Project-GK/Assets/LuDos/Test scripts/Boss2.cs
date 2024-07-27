using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using TMPro;
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
    private bool hasExecutedInitialActions1 = false;
    private bool hasExecutedInitialActions2 = false;
    private bool hasExecutedInitialActions3 = false;
    private bool hasHealthDroppedBelowThreshold = false;

    private bool canDisplay = true;
    private bool canControlSpeed = false;

    private List<Vector3> storedPositions = new List<Vector3>();
    private List<System.Action> storedAttacks = new List<System.Action>();

    private List<int> correctOrder = new List<int>();
    private List<int> playerOrder = new List<int>();

    private GameObject player;
    public GameObject targetIndicator;

    private NavMeshAgent navMeshAgent;
    private Animator animator;

    private BTNode pattern1Tree;
    private BTNode pattern2Tree;
    private BTNode pattern3Tree;
    #endregion

    void Start()
    {
        //if (targetIndicator != null)
        //{
        //    targetIndicator.SetActive(false);
        //}

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
        if (Input.GetKeyDown(KeyCode.F))
        {
            TakeDamage(1);
            Debug.Log("Boss Health: " + currentHealth);
        }

        // �����
        if (Input.GetKeyDown(KeyCode.T))
        {
            playerOrder[attackOrderCount] = 1;
        }
        if (Input.GetKeyDown(KeyCode.Z))
        {
            playerOrder[attackOrderCount] = 2;  
        }
        if (Input.GetKeyDown(KeyCode.O))
        {
            magicCircleCount++;
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
                        SpinAndExtinguishTorches();
                        LightMagicCircle();
                        LightBossEyesAndMouth();

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
                        if (isGroggy)
                        {
                            StopCoroutine(ExecutePattern(pattern1Tree));
                            isGroggy = false;
                            navMeshAgent.isStopped = false;
                        }

                        LightFourTorches();
                        yield return StartCoroutine(MoveAndAttack());
                        ExtinguishAllTorches();

                        hasExecutedInitialActions2 = true;
                    }
                    if (!isExecutingPattern)
                    {
                        StartCoroutine(ExecutePattern(pattern2Tree));
                    }

                    // StartCoroutine(ExecutePattern(pattern2Tree));
                }
            }
            else if (currentHealth > 0)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions3)
                    {
                        StopCoroutine(ExecutePattern(pattern2Tree));

                        Roar();

                        hasExecutedInitialActions3 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern3Tree));
                }
            }
            else
            {
                StopCoroutine(ExecutePattern(pattern3Tree));
                Die();
                break;
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
        var jumpNode = new ActionCoroutineNode(JumpToStoredPosition, this);
        var attackNode = new ActionCoroutineNode(PerformStoredAttack, this);

        return new Sequence(
            jumpNode,
            attackNode,
            new ActionNode(() => {
                ResetBossAttackCount();
                jumpNode.Reset();
                attackNode.Reset();
                return true;
            })
        );
    }

    BTNode CreatePattern3Tree()
    {
        return new Sequence(
            new ActionNode(DashAttack),
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
        // isGroggy = false;

        while (!isGroggy)
        {
            patternTree.Execute();

            if (currentHealth <= 33 && !hasHealthDroppedBelowThreshold)
            {
                hasHealthDroppedBelowThreshold = true;
                break;
            }

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
        Debug.Log("SetGroggy");

        isGroggy = true; // �ϴ� �̰� ������ ������ ���� �ȵ�
        //animator.SetTrigger("Groggy");
        navMeshAgent.isStopped = true; // ���� �����̸� ���ֵ� ��
        return true;
    }

    void Die()
    {
        Debug.Log("Die");

        navMeshAgent.isStopped = true;

        // animator.SetTrigger("Die");
    }

    // �⺻ ���� (���ݽ� ����Ʈ �����ؾ��� + Ÿ�� �����ؾ���)
    bool RandomBasicAttack()
    {
        if (!isExecutingAttack)
        {
            Debug.Log("RandomBasicAttack");

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
        Debug.Log("DashAndSlash");

        isExecutingAttack = true;

        // �뽬
        //animator.SetTrigger("Dash");

        float dashTime = 1.0f;
        float dashSpeed = 10.0f * navMeshAgent.speed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            navMeshAgent.Move(transform.forward * dashSpeed * Time.deltaTime);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // �չ� �ֵθ���
        //animator.SetTrigger("Slash");
        yield return new WaitForSeconds(4.0f);

        isExecutingAttack = false;
    }

    IEnumerator Dash()
    {
        Debug.Log("Dash");

        isExecutingAttack = true;

        //animator.SetTrigger("Dash");

        player = GameObject.FindWithTag("Player"); // player �������� �����ϴ� ���� �ʿ���
        Debug.Log(player);

        Vector3 directionToPlayer = (player.transform.position - transform.position).normalized;
        Quaternion lookRotation = Quaternion.LookRotation(directionToPlayer);
        transform.rotation = lookRotation;

        float dashTime = 1.0f;
        float dashSpeed = 10.0f * navMeshAgent.speed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            navMeshAgent.Move(transform.forward * dashSpeed * Time.deltaTime);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(4.0f);

        isExecutingAttack = false;
    }

    IEnumerator Slash()
    {
        Debug.Log("Slash");

        isExecutingAttack = true;

        //animator.SetTrigger("Slash"); // �ִϸ��̼� ��� �ӵ� ����

        yield return new WaitForSeconds(4.0f);

        isExecutingAttack = false;
    }

    IEnumerator Bite()
    {
        Debug.Log("Bite");

        isExecutingAttack = true;

        //animator.SetTrigger("Bite"); // �ִϸ��̼� ��� �ӵ� ����

        yield return new WaitForSeconds(4.0f);

        isExecutingAttack = false;
    }

    // ���� 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");
    }

    void SpinAndExtinguishTorches() // �ڷ�ƾ���� �����ؾ��ҵ�
    {
        Debug.Log("SpinAndExtinguishTorches");
    }

    void LightMagicCircle()
    {
        Debug.Log("LightMagicCircle");
    }

    void LightBossEyesAndMouth()
    {
        Debug.Log("LightBossEyesAndMouth");
    }

    bool ControlSpeed()
    {
        if (canControlSpeed) // ���������� canControlSpeed = true; �������
        {
            Debug.Log("ControlSpeed");

            if (magicCircleCount == 5)
            {
                navMeshAgent.speed *= 0.5f; // �ӵ� 50%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 6)
            {
                navMeshAgent.speed *= 0.4f; // �ӵ� 40%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 7)
            {
                navMeshAgent.speed *= 0.3f; // �ӵ� 30%
                canControlSpeed = false;
            }
        }
        return true;
    }

    // ���� 2

    void LightFourTorches()
    {
        Debug.Log("LightFourTorches");
    }

    IEnumerator MoveAndAttack()
    {
        Debug.Log("MoveAndAttack");

        isExecutingPattern = true;

        Vector3 center = new Vector3(0, 0, 0); // �߾�
        float radius = 45.0f; // ������

        for (int n = 0; n < 8; n++)
        {
            Vector3 targetPosition = GetRandomPosition(center, radius);
            System.Action randomAttack = GetRandomAttack();

            storedPositions.Add(targetPosition);
            storedAttacks.Add(randomAttack);

            GameObject indicator = Instantiate(targetIndicator, targetPosition, Quaternion.identity);

            yield return JumpToPosition(targetPosition);
            randomAttack.Invoke();
            yield return new WaitForSeconds(3.0f);
        }

        isExecutingPattern = false;
    }


    void ExtinguishAllTorches()
    {
        Debug.Log("ExtinguishAllTorches");
    }

    Vector3 GetRandomPosition(Vector3 center, float radius)
    {
        Vector2 randomPoint = Random.insideUnitCircle * radius;
        return new Vector3(center.x + randomPoint.x, center.y, center.z + randomPoint.y);
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

    IEnumerator JumpToPosition(Vector3 targetPosition)
    {
        //if (targetIndicator != null)
        //{
        //    targetIndicator.transform.position = targetPosition;
        //    targetIndicator.SetActive(true);
        //}

        Vector3 startPosition = transform.position;
        float jumpHeight = 10.0f; // ���� ����
        float jumpDuration = 2.0f; // ���� �ð�

        float elapsedTime = 0.0f;

        while (elapsedTime < jumpDuration)
        {
            float progress = elapsedTime / jumpDuration;
            float height = Mathf.Sin(Mathf.PI * progress) * jumpHeight; // ������ ���
            navMeshAgent.Warp(Vector3.Lerp(startPosition, targetPosition, progress) + Vector3.up * height);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        navMeshAgent.Warp(targetPosition); // ���� ��ġ�� �̵�

        yield return new WaitForSeconds(1.0f); // ���� �� ��� �ð�

        //if (targetIndicator != null)  
        //{
        //    targetIndicator.SetActive(false);
        //}
    }

    IEnumerator JumpToStoredPosition()
    {
        Debug.Log("JumpToStoredPosition");

        if (bossAttackCount < storedPositions.Count)
        {
            Vector3 targetPosition = storedPositions[bossAttackCount];
            yield return StartCoroutine(JumpToPosition(targetPosition));
            yield return new WaitForSeconds(1.0f);
        }
        yield break;
    }

    IEnumerator PerformStoredAttack()
    {
        Debug.Log("PerformStoredAttack");

        if (bossAttackCount < storedAttacks.Count)
        {
            System.Action storedAttack = storedAttacks[bossAttackCount];
            storedAttack.Invoke();

            Debug.Log("bossAttackCount: " + bossAttackCount);

            bossAttackCount++;
            yield return new WaitForSeconds(4.0f);
        }
        yield break;
    }

    bool ResetBossAttackCount()
    {
        if (bossAttackCount >= storedPositions.Count)
        {
            Debug.Log("ResetBossAttackCount");

            bossAttackCount = 0;
        }
        return true;
    }

    // ���� 3
    void Roar()
    {
        Debug.Log("Roar");
        //animator.SetTrigger("Roar");
    }

    bool DashAttack()
    {
        if (!isExecutingAttack)
        {
            Debug.Log("DashAttack");

            StartCoroutine(Dash());
        }
        return true;
    }

    bool DisplayAttackOrder()
    {
        if (canDisplay)
        {
            Debug.Log("DisplayAttackOrder");

            playerOrder = new List<int> { 0, 0, 0, 0, 0, 0, 0, 0 };
            // correctOrder = new List<int> { 1, 1, 1, 1, 2, 2, 2, 2 };
            correctOrder = new List<int> { 1, 1, 1, 1, 1, 1, 1, 1 }; // �����
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
        // UI�� ǥ��
    }

    bool CheckPlayerAttackOrder()
    {
        if (playerOrder[attackOrderCount] != 0)
        {
            if (playerOrder[attackOrderCount] == correctOrder[attackOrderCount])
            {
                Debug.Log("AttackOrder Correct");
                Debug.Log("AttackOrder: " + attackOrderCount);

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
            Debug.Log("DamageAllMap");

            attackOrderCount = 0;
            canDisplay = true;
        }
        return false; // true���� ���������
    }

    bool IncrementSuccessCount()
    {
        if (attackOrderCount >= 8)
        {
            Debug.Log("IncrementSuccessCount");
            Debug.Log("SuccessCount: " + successCount);

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