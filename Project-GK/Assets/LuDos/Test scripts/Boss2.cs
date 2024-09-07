using Photon.Pun;
using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using TMPro;
using UnityEngine;
using UnityEngine.AI;
using System.IO;

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

    bool canDisplay = true;
    bool canControlSpeed = false;
    bool isInvincible = false;

    Coroutine randomBasicAttackCoroutine;
    Coroutine jumpToPositionCoroutine;
    Coroutine currentAttackCoroutine;
    Coroutine indicatorCoroutine;
    Coroutine shockwaveCoroutine;

    List<Vector3> storedPositions = new List<Vector3>();
    List<IEnumerator> storedAttacks = new List<IEnumerator>();

    [HideInInspector] public List<int> correctOrder = new List<int>();
    List<int> playerOrder = new List<int>();

    GameObject player;
    [HideInInspector] public List<GameObject> PlayerList;

    Animator animator;
    Rigidbody rb;

    GameObject currentIndicator;
    GameObject currentFill;
    GameObject currentShockwave;
    GameObject currentDamageCollider;

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
        rb = GetComponent<Rigidbody>();
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();
        StartCoroutine(ExecuteBehaviorTree());
    }

    void Update()
    {
        ForDebug();
    }

    void ForDebug()
    {
        if (Input.GetKeyDown(KeyCode.F))
        {
            TakeDamage(1);
            Debug.Log("Boss Health: " + currentHealth);
        }
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
                        StopRandomBasicAttack();
                        MakeInvincible();
                        yield return StartCoroutine(SpinAndExtinguishTorches());
                        LightMagicCircle();
                        LightBossEyesAndMouth();
                        hasExecutedInitialActions1 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern1Tree));
                }
            }
            else if (currentHealth <= 33 && currentHealth > 2)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions2)
                    {
                        StopRandomBasicAttack();
                        LightFourTorches();
                        yield return StartCoroutine(MoveAndAttack());
                        yield return RoarAndExtinguishAllTorches();
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
                        StopRandomBasicAttack();
                        MakeInvincible();
                        yield return StartCoroutine(Roar());
                        SpeedUp();
                        hasExecutedInitialActions3 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern3Tree));
                }
            }
            else if (currentHealth == 0)
            {
                StopRandomBasicAttack();
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
        StartCoroutine(GroggyTime(10.0f));

        return true;
    }
    IEnumerator GroggyTime(float time)
    {
        yield return new WaitForSeconds(time);

        if (!isInvincible)
        {
            currentHealth--;
        }
        isGroggy = false;
    }

    void Die()
    {
        Debug.Log("Die");
        isInvincible = true;

        // animator.SetTrigger("Die");
    }

    IEnumerator MakeDamageCollider(int idx, float maxLength, Vector3 position)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            if (idx == 0)
            {
                currentDamageCollider = PhotonNetwork.Instantiate(Path.Combine("Boss", "DamageCollider" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                float width = 0.5f;
                currentDamageCollider.transform.localScale = new Vector3(width, currentDamageCollider.transform.localScale.y, maxLength);

                yield return new WaitForSeconds(0.1f);

                PhotonNetwork.Destroy(currentDamageCollider);
                currentDamageCollider = null;
            }
            else if (idx == 1)
            {
                // 과녁 모양 콜라이더
            }
            else
            {
                currentDamageCollider = PhotonNetwork.Instantiate(Path.Combine("Boss", "DamageCollider" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                currentDamageCollider.transform.localScale = new Vector3(maxLength, currentDamageCollider.transform.localScale.y, maxLength);

                yield return new WaitForSeconds(0.1f);

                PhotonNetwork.Destroy(currentDamageCollider);
                currentDamageCollider = null;
            }
        }
    }

    IEnumerator ShowIndicator(int idx, float maxLength, Vector3 position, float duration)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            position.y = 0.15f; // 임시완

            if (idx == 0)
            {
                currentIndicator = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackIndicator" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));
                currentFill = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackFill" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                float width = 0.5f;
                currentIndicator.transform.localScale = new Vector3(width, currentIndicator.transform.localScale.y, maxLength);
                currentFill.transform.localScale = new Vector3(width, currentFill.transform.localScale.y, 0);

                float elapsedTime = 0f;
                while (elapsedTime < duration)
                {
                    elapsedTime += Time.deltaTime;
                    float t = elapsedTime / duration;

                    float currentLength = Mathf.Lerp(0, maxLength, t);
                    currentFill.transform.localScale = new Vector3(width, currentFill.transform.localScale.y, currentLength);

                    yield return null;
                }

                PhotonNetwork.Destroy(currentIndicator);
                currentIndicator = null;
                PhotonNetwork.Destroy(currentFill);
                currentFill = null;

                StartCoroutine(MakeDamageCollider(idx, maxLength, position));
            }
            else if (idx == 1)
            {
                // 과녁 모양 콜라이더
            }
            else
            {
                currentIndicator = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackIndicator" + idx.ToString()), position, Quaternion.identity);
                currentFill = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackFill" + idx.ToString()), position, Quaternion.identity);

                currentIndicator.transform.localScale = new Vector3(maxLength, currentIndicator.transform.localScale.y, maxLength);
                currentFill.transform.localScale = Vector3.zero;

                float elapsedTime = 0f;
                while (elapsedTime < duration)
                {
                    elapsedTime += Time.deltaTime;
                    float t = elapsedTime / duration;

                    float currentScale = Mathf.Lerp(0, maxLength, t);
                    currentFill.transform.localScale = new Vector3(currentScale, currentFill.transform.localScale.y, currentScale);

                    yield return null;
                }

                PhotonNetwork.Destroy(currentIndicator);
                currentIndicator = null;
                PhotonNetwork.Destroy(currentFill);
                currentFill = null;

                StartCoroutine(MakeDamageCollider(idx, maxLength, position));
            }
        }
    }

    void StopRandomBasicAttack()
    {
        if (randomBasicAttackCoroutine != null)
        {
            StopCoroutine(randomBasicAttackCoroutine);
            randomBasicAttackCoroutine = null;
            isExecutingAttack = false;
        }
        else if (jumpToPositionCoroutine != null)
        {
            StopCoroutine(jumpToPositionCoroutine);
            jumpToPositionCoroutine = null;
        }
        else if (currentAttackCoroutine != null)
        {
            StopCoroutine(jumpToPositionCoroutine);
            jumpToPositionCoroutine = null;
        }

        if (currentIndicator != null)
        {
            StopCoroutine(indicatorCoroutine);
            PhotonNetwork.Destroy(currentIndicator);
            currentIndicator = null;
        }
        if (currentFill != null)
        {
            PhotonNetwork.Destroy(currentFill);
            currentFill = null;
        }
        if (currentShockwave != null)
        {
            StopCoroutine(shockwaveCoroutine);
            PhotonNetwork.Destroy(currentShockwave);
            currentShockwave = null;
        }
        if (currentDamageCollider != null)
        {
            PhotonNetwork.Destroy(currentDamageCollider);
            currentDamageCollider = null;
        }
    }

    // 기본 공격
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
                    StartCoroutine(JawSlamWithShockwave());
                    break;
                case 4:
                    StartCoroutine(SpinAndTargetSmash());
                    break;
                case 5:
                    StartCoroutine(RoarAndSmash());
                    break;
                case 6:
                    StartCoroutine(FocusAndLinearShockwave());
                    break;
            }
        }
        return true;
    }

    IEnumerator ShortDashAndSlash()
    {
        Debug.Log("ShortDashAndSlash");

        isExecutingAttack = true;

        // 짧은 대쉬
        //animator.SetTrigger("ShortDashAndSlash");

        float dashTime = 0.5f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator DoubleDash()
    {
        Debug.Log("DoubleDash");

        isExecutingAttack = true;

        // 첫 번째 돌진 (A 플레이어)
        GameObject playerA = GetRandomPlayer();
        Vector3 directionToPlayerA = (playerA.transform.position - transform.position).normalized;
        Quaternion lookRotationA = Quaternion.LookRotation(directionToPlayerA);
        transform.rotation = lookRotationA;

        float dashTime = 1.0f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        //animator.SetTrigger("Dash");

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(2.0f);

        // 두 번째 돌진 (B 플레이어)
        GameObject playerB = GetRandomPlayer(exclude: playerA);
        Vector3 directionToPlayerB = (playerB.transform.position - transform.position).normalized;
        Quaternion lookRotationB = Quaternion.LookRotation(directionToPlayerB);
        transform.rotation = lookRotationB;

        elapsedTime = 0.0f;

        //animator.SetTrigger("Dash");

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator JawSlamWithShockwave()
    {
        Debug.Log("JawSlamWithShockwave");

        isExecutingAttack = true;

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        //animator.SetTrigger("JawSlamWithShockwave");
        yield return new WaitForSeconds(2.0f); // 캐스팅 시간

        // 충격파
        shockwaveCoroutine = StartCoroutine(CreateShockwave(4.5f, 0.1f, targetPosition, 2.0f));

        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator SpinAndTargetSmash()
    {
        Debug.Log("SpinAndTargetAttack");

        isExecutingAttack = true;

        // 시계 방향 회전 및 공격
        //animator.SetTrigger("SpinAndTargetSmash_C");
        yield return new WaitForSeconds(1.0f);


        // 반시계 방향 회전 및 공격
        //animator.SetTrigger("SpinAndTargetSmash");
        yield return new WaitForSeconds(1.0f);


        // 다시 시계 방향 회전 및 공격
        //animator.SetTrigger("SpinAndTargetSmash_C");
        yield return new WaitForSeconds(1.0f);


        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator RoarAndSmash()
    {
        Debug.Log("RoarAndDash");

        isExecutingAttack = true;

        //animator.SetTrigger("RoarAndSmash");
        yield return new WaitForSeconds(0.5f);

        // 슬로우
        SlowAllPlayers(0.3f, 2.0f); // 2초간 30% 슬로우

        // 대쉬
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

        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator FocusAndLinearShockwave()
    {
        Debug.Log("FocusAndSmash");

        isExecutingAttack = true;

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        //animator.SetTrigger("FocusAndLinearShockwave");
        yield return new WaitForSeconds(2.0f); // 정신 집중 시간 동안 받는 데미지 50% 감소

        // 충격파
        shockwaveCoroutine = StartCoroutine(CreateShockwave(4.5f, 0.1f, targetPosition, 2.0f));
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
            // 플레이어의 슬로우 로직 추가
            // 예시: player.GetComponent<PlayerController>().ApplySlow(slowAmount, duration);
        }
    }

    IEnumerator CreateShockwave(float maxRadius, float startScale, Vector3 position, float speed)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            position.y = 0.15f; // 임시완

            currentShockwave = PhotonNetwork.Instantiate(Path.Combine("Boss", "ShockWave"), position, Quaternion.identity);

            float currentScale = startScale;

            while (currentScale < maxRadius)
            {
                currentScale += speed * Time.deltaTime;
                currentShockwave.transform.localScale = new Vector3(currentScale, currentShockwave.transform.localScale.y, currentScale);

                yield return null;
            }

            PhotonNetwork.Destroy(currentShockwave);
            currentShockwave = null;
        }
    }

    // 패턴 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");
        isInvincible = true;
    }

    IEnumerator SpinAndExtinguishTorches()
    {
        Debug.Log("SpinAndExtinguishTorches");
        //animator.SetTrigger("QuickSpin");
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
        if (canControlSpeed) // 마법진에서 canControlSpeed = true; 해줘야함
        {
            Debug.Log("ControlSpeed");

            float speedMultiplier = 1.0f;

            if (magicCircleCount == 5)
            {
                speedMultiplier = 0.5f; // 속도 50%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 6)
            {
                speedMultiplier = 0.4f; // 속도 40%
                canControlSpeed = false;
            }
            else if (magicCircleCount == 7)
            {
                speedMultiplier = 0.3f; // 속도 30%
                canControlSpeed = false;
            }

            // 애니메이션 속도 조절
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

    // 패턴 2
    void LightFourTorches()
    {
        Debug.Log("LightFourTorches");
    }

    IEnumerator MoveAndAttack()
    {
        Debug.Log("MoveAndAttack");

        Vector3 center = new Vector3(0, 0, 0); // 중앙
        float radius = 45.0f; // 반지름

        for (int n = 0; n < 8; n++)
        {
            Vector3 targetPosition = GetRandomPosition(center, radius);
            IEnumerator randomAttack = GetRandomAttack();

            storedPositions.Add(targetPosition);
            storedAttacks.Add(randomAttack);

            // GameObject indicator = Instantiate(targetIndicator, targetPosition, Quaternion.identity);

            yield return JumpToPosition(targetPosition);
            yield return StartCoroutine(randomAttack); // 코루틴 실행
            yield return new WaitForSeconds(3.0f);
        }
    }


    IEnumerator RoarAndExtinguishAllTorches()
    {
        Debug.Log("RoarAndExtinguishAllTorches");
        animator.SetTrigger("Roar");
        yield return new WaitForSeconds(3.0f);
    }

    Vector3 GetRandomPosition(Vector3 center, float radius)
    {
        Vector2 randomPoint = Random.insideUnitCircle * radius;
        return new Vector3(center.x + randomPoint.x, center.y, center.z + randomPoint.y);
    }


    IEnumerator GetRandomAttack()
    {
        int attackType = UnityEngine.Random.Range(1, 7);
        switch (attackType)
        {
            case 1:
                return ShortDashAndSlash();
            case 2:
                return DoubleDash();
            case 3:
                return JawSlamWithShockwave();
            case 4:
                return SpinAndTargetSmash();
            case 5:
                return RoarAndSmash();
            case 6:
                return FocusAndLinearShockwave();
            default:
                return ShortDashAndSlash();
        }
    }

    IEnumerator JumpToPosition(Vector3 targetPosition)
    {
        Vector3 startPosition = transform.position;
        float jumpHeight = 10.0f; // 점프 높이
        float jumpDuration = 2.0f; // 점프 시간

        float elapsedTime = 0.0f;

        // animator.SetTrigger("Jump");

        while (elapsedTime < jumpDuration)
        {
            float progress = elapsedTime / jumpDuration;
            float height = Mathf.Sin(Mathf.PI * progress) * jumpHeight; // 포물선 계산
            transform.position = Vector3.Lerp(startPosition, targetPosition, progress) + Vector3.up * height;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = targetPosition;

        yield return new WaitForSeconds(1.0f); // 점프 후 대기 시간
    }

    IEnumerator JumpToStoredPosition()
    {
        Debug.Log("JumpToStoredPosition");

        if (bossAttackCount < storedPositions.Count)
        {
            Vector3 targetPosition = storedPositions[bossAttackCount];
            jumpToPositionCoroutine = StartCoroutine(JumpToPosition(targetPosition));
            yield return new WaitForSeconds(1.0f);
        }
        yield break;
    }

    IEnumerator PerformStoredAttack()
    {
        Debug.Log("PerformStoredAttack");

        if (bossAttackCount < storedAttacks.Count)
        {
            IEnumerator storedAttack = storedAttacks[bossAttackCount];
            currentAttackCoroutine = StartCoroutine(storedAttack);

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

    // 패턴 3
    IEnumerator Roar()
    {
        Debug.Log("Roar");
        //animator.SetTrigger("Roar");
        yield return new WaitForSeconds(2.0f);
    }
    void SpeedUp()
    {
        moveSpeed += 2.0f;
    }

    IEnumerator Dash()
    {
        Debug.Log("Dash");

        isExecutingAttack = true;

        //animator.SetTrigger("Dash");

        player = GameObject.FindWithTag("Player"); // player 랜덤으로 선택하는 로직 필요함
        Debug.Log(player);

        Vector3 directionToPlayer = (player.transform.position - transform.position).normalized;
        Quaternion lookRotation = Quaternion.LookRotation(directionToPlayer);
        transform.rotation = lookRotation;

        float dashTime = 1.0f;
        float dashSpeed = 10.0f; // 대쉬 속도
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
            correctOrder = new List<int> { 1, 1, 1, 1, 1, 1, 1, 1 }; // 실험용
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
            // 맵 전체에 데미지를 입히는 로직
            Debug.Log("DamageAllMap");

            attackOrderCount = 0;
            canDisplay = true;
        }
        return false; // true여도 상관없을듯
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
        // 어떤 플레이어가 공격했는지 구분하여 playerOrder에 추가
    }
}