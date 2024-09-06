using Photon.Pun;
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
    int maxHealth = 100;
    int currentHealth;
    float moveSpeed = 10.0f;

    bool isFirstTimeBelow66 = true;
    bool isFirstTimeBelow33 = true;
    bool isFirstTimeBelow2 = true;

    int magicCircleCount = 0;
    int bossAttackCount = 0;
    int successCount = 0;
    [HideInInspector] public int attackOrderCount = 0;

    bool isGroggy = false;
    bool isExecutingPattern = false;
    bool isExecutingAttack = false;
    bool hasExecutedInitialActions1 = false;
    bool hasExecutedInitialActions2 = false;
    bool hasExecutedInitialActions3 = false;
    bool hasHealthDroppedBelowThreshold = false;

    bool canDisplay = true;
    bool canControlSpeed = false;

    List<Vector3> storedPositions = new List<Vector3>();
    List<System.Action> storedAttacks = new List<System.Action>();

    [HideInInspector] public List<int> correctOrder = new List<int>();
    List<int> playerOrder = new List<int>();

    GameObject player;
    // public GameObject targetIndicator;

    Animator animator;

    BTNode pattern1Tree;
    BTNode pattern2Tree;
    BTNode pattern3Tree;
    #endregion

    void Start()
    {
        //if (targetIndicator != null)
        //{
        //    targetIndicator.SetActive(false);
        //}

        currentHealth = maxHealth;
        //animator = GetComponent<Animator>();
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
            if (currentHealth == 66)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions1)
                    {
                        MakeInvincible();
                        yield return StartCoroutine(SpinAndExtinguishTorches());
                        LightMagicCircle();
                        LightBossEyesAndMouth();

                        hasExecutedInitialActions1 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern1Tree));
                }
            }
            else if (currentHealth == 33)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions2)
                    {
                        LightFourTorches();
                        yield return StartCoroutine(MoveAndAttack());
                        ExtinguishAllTorches();

                        hasExecutedInitialActions2 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern2Tree));
                }
            }
            else if (currentHealth == 2)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions3)
                    {
                        // StopCoroutine(ExecutePattern(pattern2Tree));
                        Roar();

                        hasExecutedInitialActions3 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern3Tree));
                }
            }
            else if (currentHealth == 0)
            {

                Die();
                break;
            }
            else
            {
                if (!isGroggy)
                {
                    RandomBasicAttack();
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

        while (!isGroggy)
        {
            patternTree.Execute();

            //if (currentHealth <= 33 && !hasHealthDroppedBelowThreshold)
            //{
            //    hasHealthDroppedBelowThreshold = true;
            //    break;
            //}

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

        isGroggy = true;
        return true;
    }

    void Die()
    {
        Debug.Log("Die");


        // animator.SetTrigger("Die");
    }

    // �⺻ ����
    bool RandomBasicAttack()
    {
        if (!isExecutingAttack)
        {
            Debug.Log("RandomBasicAttack");

            int attackType = UnityEngine.Random.Range(1, 7);
            switch (attackType)
            {
                case 1:
                    StartCoroutine(ShortDashAndSlash());
                    break;
                case 2:
                    StartCoroutine(DoubleDash());
                    break;
                case 3:
                    StartCoroutine(HeadSlamWithShockwave());
                    break;
                case 4:
                    StartCoroutine(SpinAndTargetAttack());
                    break;
                case 5:
                    StartCoroutine(RoarAndDash());
                    break;
                case 6:
                    StartCoroutine(FocusAndSmash());
                    break;
            }
        }
        return true;
    }

    IEnumerator ShortDashAndSlash()
    {
        Debug.Log("ShortDashAndSlash");

        isExecutingAttack = true;

        // ª�� �뽬
        //animator.SetTrigger("ShortDash");

        float dashTime = 0.5f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // �� �չ� �ֵθ���
        //animator.SetTrigger("Slash");
        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator DoubleDash()
    {
        Debug.Log("DoubleDash");

        isExecutingAttack = true;

        // ù ��° ���� (A �÷��̾�)
        GameObject playerA = GetRandomPlayer();
        Vector3 directionToPlayerA = (playerA.transform.position - transform.position).normalized;
        Quaternion lookRotationA = Quaternion.LookRotation(directionToPlayerA);
        transform.rotation = lookRotationA;

        float dashTime = 1.0f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(0.5f);

        // �� ��° ���� (B �÷��̾�)
        GameObject playerB = GetRandomPlayer(exclude: playerA);
        Vector3 directionToPlayerB = (playerB.transform.position - transform.position).normalized;
        Quaternion lookRotationB = Quaternion.LookRotation(directionToPlayerB);
        transform.rotation = lookRotationB;

        elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator HeadSlamWithShockwave()
    {
        Debug.Log("HeadSlamWithShockwave");

        isExecutingAttack = true;

        //animator.SetTrigger("HeadSlam");
        yield return new WaitForSeconds(2.0f); // ĳ���� �ð�

        // �����


        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator SpinAndTargetAttack()
    {
        Debug.Log("SpinAndTargetAttack");

        isExecutingAttack = true;

        // �ð� ���� ȸ�� �� ����
        //animator.SetTrigger("SpinClockwise");
        yield return new WaitForSeconds(1.0f);
        // ���� ���� �߰�

        // �ݽð� ���� ȸ�� �� ����
        //animator.SetTrigger("SpinCounterClockwise");
        yield return new WaitForSeconds(1.0f);
        // ���� ���� �߰�

        // �ٽ� �ð� ���� ȸ�� �� ����
        //animator.SetTrigger("SpinClockwise");
        yield return new WaitForSeconds(1.0f);
        // ���� ���� �߰�

        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator RoarAndDash()
    {
        Debug.Log("RoarAndDash");

        isExecutingAttack = true;

        //animator.SetTrigger("Roar");

        // ���ο�
        SlowAllPlayers(0.3f, 2.0f); // 2�ʰ� 30% ���ο�

        yield return new WaitForSeconds(1.0f); // ���ο� ���� �ð�

        // �뽬
        GameObject targetPlayer = GetRandomPlayer();
        Vector3 directionToPlayer = (targetPlayer.transform.position - transform.position).normalized;
        Quaternion lookRotation = Quaternion.LookRotation(directionToPlayer);
        transform.rotation = lookRotation;

        float dashTime = 0.5f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // �չ� �������
        //animator.SetTrigger("Smash");
        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator FocusAndSmash()
    {
        Debug.Log("FocusAndSmash");

        isExecutingAttack = true;

        // ���� ����
        //animator.SetTrigger("Focus");
        yield return new WaitForSeconds(2.0f); // ���� ���� �ð� ���� �޴� ������ 50% ����

        // �������
        //animator.SetTrigger("Smash");
        yield return new WaitForSeconds(0.5f); // ���� �Ϸ� �� ª�� ���

        // �����


        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    GameObject GetRandomPlayer(GameObject exclude = null)
    {
        GameObject[] players = GameObject.FindGameObjectsWithTag("Player");
        List<GameObject> playerList = new List<GameObject>(players);

        if (exclude != null)
        {
            playerList.Remove(exclude);
        }

        int randomIndex = UnityEngine.Random.Range(0, playerList.Count);
        return playerList[randomIndex];
    }

    void SlowAllPlayers(float slowAmount, float duration)
    {
        GameObject[] players = GameObject.FindGameObjectsWithTag("Player");
        foreach (GameObject player in players)
        {
            // �÷��̾��� ���ο� ���� �߰�
            // ����: player.GetComponent<PlayerController>().ApplySlow(slowAmount, duration);
        }
    }

    // ���� 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");
    }

    IEnumerator SpinAndExtinguishTorches()
    {
        Debug.Log("SpinAndExtinguishTorches");
        yield return new WaitForSeconds(1.0f);
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

            float speedMultiplier = 1.0f;

            if (magicCircleCount == 5)
            {
                speedMultiplier = 0.5f; // �ӵ� 50%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 6)
            {
                speedMultiplier = 0.4f; // �ӵ� 40%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 7)
            {
                speedMultiplier = 0.3f; // �ӵ� 30%
                canControlSpeed = false;
            }

            // �ִϸ��̼� �ӵ� ����
            if (animator != null)
            {
                animator.speed *= speedMultiplier;
            }

            AdjustMoveSpeed(speedMultiplier);
        }
        return true;
    }

    void AdjustMoveSpeed(float multiplier)
    {
        moveSpeed *= multiplier;
    }

    // ���� 2
    void LightFourTorches()
    {
        Debug.Log("LightFourTorches");
    }

    IEnumerator MoveAndAttack()
    {
        Debug.Log("MoveAndAttack");

        Vector3 center = new Vector3(0, 0, 0); // �߾�
        float radius = 45.0f; // ������

        for (int n = 0; n < 8; n++)
        {
            Vector3 targetPosition = GetRandomPosition(center, radius);
            System.Action randomAttack = GetRandomAttack();

            storedPositions.Add(targetPosition);
            storedAttacks.Add(randomAttack);

            // GameObject indicator = Instantiate(targetIndicator, targetPosition, Quaternion.identity);

            yield return JumpToPosition(targetPosition);
            randomAttack.Invoke();
            yield return new WaitForSeconds(3.0f);
        }
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
        int attackType = UnityEngine.Random.Range(1, 7);
        switch (attackType)
        {
            case 1:
                return () => StartCoroutine(ShortDashAndSlash());
            case 2:
                return () => StartCoroutine(DoubleDash());
            case 3:
                return () => StartCoroutine(HeadSlamWithShockwave());
            case 4:
                return () => StartCoroutine(SpinAndTargetAttack());
            case 5:
                return () => StartCoroutine(RoarAndDash());
            case 6:
                return () => StartCoroutine(FocusAndSmash());
            default:
                return () => StartCoroutine(ShortDashAndSlash());
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
            transform.position = Vector3.Lerp(startPosition, targetPosition, progress) + Vector3.up * height;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = targetPosition;

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
        float dashSpeed = 10.0f; // �뽬 �ӵ�
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(4.0f);

        isExecutingAttack = false;
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

    void OnCollisionEnter(Collision collision)
    {
        // � �÷��̾ �����ߴ��� �����Ͽ� playerOrder�� �߰�
    }
}