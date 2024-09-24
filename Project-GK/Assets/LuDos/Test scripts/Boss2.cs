using Photon.Pun;
using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using TMPro;
using UnityEngine;
using UnityEngine.AI;
using System.IO;

public class Boss2 : MonoBehaviourPunCallbacks
{
    #region variables
    float maxHealth = 100;
    float currentHealth;
    float moveSpeed = 10.0f;
    float rotSpeed = 75.0f;

    bool isFirstTimeBelow66 = true;
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

    Coroutine randomBasicAttackCoroutine;
    Coroutine indicatorCoroutine;
    Coroutine shockwaveCoroutine;
    Coroutine jumpToPositionCoroutine;
    Coroutine currentAttackCoroutine;

    bool canDisplay = true;
    bool canControlSpeed = false;
    bool isInvincible = false;
    bool isAggroFixed = false;
    bool isFocus = false;

    bool isStarted = false;

    public List<GameObject> AttackIndicators;
    public List<GameObject> AttackFills;
    public List<GameObject> DamageColliders;

    public GameObject DashCollider;

    public List<GameObject> MagicCircles;
    public List<GameObject> Torches;
    public List<GameObject> FootMesh;
    // public List<GameObject> EyesAndMouse;

    List<Vector3> storedPositions = new List<Vector3>();
    List<IEnumerator> storedAttacks = new List<IEnumerator>();

    [HideInInspector] public List<int> correctOrder = new List<int>();
    List<int> playerOrder = new List<int>();

    [HideInInspector] public List<GameObject> PlayerList;
    [HideInInspector] public GameObject aggroTarget;

    Animator animator;
    Rigidbody rb;
    public GameObject ShockWave;

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
        currentHealth = maxHealth;
        //animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();
        StartCoroutine(StartTime());
    }

    IEnumerator StartTime()
    {
        while (!isStarted)
        {
            if (PhotonNetwork.IsMasterClient && PlayerList.Count == 1)
            {
                isStarted = true;
                photonView.RPC("PlayerListSortRPC", RpcTarget.AllBuffered);
                StartCoroutine(ExecuteBehaviorTree());
                yield break;
            }
            yield return null;
        }
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
                        yield return StartCoroutine(SpinAndExtinguishAllTorches());
                        LightMagicCircle();
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
                    photonView.RPC("SetIsAggroFixed", RpcTarget.AllBuffered);
                    RandomBasicAttack();
                }
            }
            yield return null;
        }
    }

    [PunRPC]
    void SetIsAggroFixed()
    {
        isAggroFixed = false;
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
        photonView.RPC("DieRPC", RpcTarget.AllBuffered);

        // animator.SetTrigger("Die");
    }

    [PunRPC]
    void DieRPC()
    {
        isInvincible = true;
    }

    IEnumerator MakeDamageCollider(int idx, float maxLength, Vector3 position)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            if (idx == 0) { }
            else if (idx == 1)
            {
                // 임시완. 과녁 모양 콜라이더
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
            position.y = 0.15f;

            if (idx == 0)
            {
                currentIndicator = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackIndicator" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));
                currentFill = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackFill" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                float width = 0.5f;
                currentIndicator.transform.localScale = new Vector3(width, currentIndicator.transform.localScale.y, maxLength);
                currentFill.transform.localScale = new Vector3(width, currentFill.transform.localScale.y, 0);

                currentFill.transform.position = currentIndicator.transform.position - currentIndicator.transform.forward * (maxLength / 2);

                float elapsedTime = 0f;
                while (elapsedTime < duration)
                {
                    elapsedTime += Time.deltaTime;
                    float t = elapsedTime / duration;

                    float currentLength = Mathf.Lerp(0, maxLength, t);
                    currentFill.transform.localScale = new Vector3(width, currentFill.transform.localScale.y, currentLength);
                    currentFill.transform.position = currentIndicator.transform.position - currentIndicator.transform.forward * ((maxLength - currentLength) / 2);

                    yield return null;
                }

                PhotonNetwork.Destroy(currentIndicator);
                currentIndicator = null;
                PhotonNetwork.Destroy(currentFill);
                currentFill = null;
            }
            else if (idx == 1)
            {
                // 임시완. 과녁 모양 콜라이더
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

    IEnumerator LookAtTarget(Vector3 targetDirection, float rotationSpeed) // 동기화 필요
    {
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);

            float angleDifference = Vector3.SignedAngle(transform.forward, targetDirection, Vector3.up);

            if (angleDifference > 0)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "TurnLeft");
            }
            else
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "TurnRight");
            }

            while (Quaternion.Angle(transform.rotation, targetRotation) > 0.01f)
            {
                transform.rotation = Quaternion.RotateTowards(transform.rotation, targetRotation, rotationSpeed * Time.deltaTime);

                yield return null;
            }

            transform.rotation = targetRotation;

            if (isInvincible)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Invincible");
            }
            else
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Idle");
            }
        }
    }

    [PunRPC]
    void SelectAggroTargetRPC(int idx)
    {
        if (isAggroFixed)
        {
            aggroTarget = PlayerList[0].GetComponent<PlayerStateManager>().isAlive ? PlayerList[0] : PlayerList[1];
        }
        else
        {
            aggroTarget = PlayerList[idx].GetComponent<PlayerStateManager>().isAlive ? PlayerList[idx] : PlayerList[1 - idx];
        }
    }

    void SelectAggroTarget()
    {
        int idx = Random.Range(0, PlayerList.Count);
        photonView.RPC("SelectAggroTargetRPC", RpcTarget.AllBuffered, idx);
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
                    randomBasicAttackCoroutine = StartCoroutine(ShortDashAndSlash());
                    break;
                case 2:
                    randomBasicAttackCoroutine = StartCoroutine(DoubleDash());
                    break;
                case 3:
                    randomBasicAttackCoroutine = StartCoroutine(JawSlamWithShockwave());
                    break;
                case 4:
                    randomBasicAttackCoroutine = StartCoroutine(SpinAndTargetSmash());
                    break;
                case 5:
                    randomBasicAttackCoroutine = StartCoroutine(RoarAndSmash());
                    break;
                case 6:
                    randomBasicAttackCoroutine = StartCoroutine(FocusAndLinearShockwave());
                    break;
            }
        }
        return true;
    }

    [PunRPC]
    void PlayerListSortRPC()  // 임시완
    {
        StartCoroutine(WaitTime());
        PlayerList.Sort((player1, player2) => player1.name.CompareTo(player2.name));
    }

    IEnumerator WaitTime()
    {
        yield return new WaitForSeconds(1.0f);
    }

    void ActiveDashCollider(int idx) // 임시완 끝나면 동기화 함수로 변경하기
    {
        if (idx == 0) // 임시완
        {
            DashCollider.tag = "DamageCollider";
        }

        else if (idx == 1)
        {
            DashCollider.tag = "Untagged";
        }
    }

    void LightFoots(int idx) // 임시완
    {
        if (currentHealth == 66 || (currentHealth <= 33 && currentHealth > 2))
        {
            if (idx == 0)
            {
                for (int i = 0; i < FootMesh.Count; i++)
                {
                    // FootMesh[i].SetActive(true); // 빛나는 메쉬 넣어서 껐다 켤듯
                }
            }
            else if (idx == 1)
            {
                for (int i = 0; i < FootMesh.Count; i++)
                {
                    // FootMesh[i].SetActive(false);
                }
            }
        }
        else
        {
            if (true) // FootMesh가 켜져있다면 끄기
            {

            }
        }
    }

    IEnumerator ShortDashAndSlash()
    {
        Debug.Log("ShortDashAndSlash");

        isExecutingAttack = true;
        LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 20.0f, transform.position + transform.forward * 1.0f, 3.0f));
        yield return new WaitForSeconds(1.3f); // 임시완. 시간 정하기

        // 짧은 대쉬
        //animator.SetTrigger("ShortDashAndSlash");

        ActiveDashCollider(0);

        float dashTime = 0.5f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        ActiveDashCollider(1);

        indicatorCoroutine = StartCoroutine(ShowIndicator(2, 10.0f, transform.position + transform.forward * 4.0f, 1.0f)); // 임시완
        yield return new WaitForSeconds(1.0f); // 임시완. 시간 정하기

        LightFoots(1);
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    [PunRPC]
    void SetAggroTarget(int idx)
    {
        aggroTarget = PlayerList[idx];
    }

    IEnumerator DoubleDash()
    {
        Debug.Log("DoubleDash");

        isExecutingAttack = true;
        LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        photonView.RPC("SetAggroTarget", RpcTarget.AllBuffered, 0);
        //aggroTarget = PlayerList[0];
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 20.0f, transform.position + transform.forward * 1.0f, 3.0f));
        yield return new WaitForSeconds(1.3f); // 임시완. 시간 정하기

        ActiveDashCollider(0);

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

        ActiveDashCollider(1);

        yield return new WaitForSeconds(3.0f);

        photonView.RPC("SetAggroTarget", RpcTarget.AllBuffered, 1);
        //aggroTarget = PlayerList[1];
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 20.0f, transform.position + transform.forward * 1.0f, 3.0f));
        yield return new WaitForSeconds(1.3f); // 임시완. 시간 정하기

        ActiveDashCollider(0);

        elapsedTime = 0.0f;

        //animator.SetTrigger("Dash");

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        ActiveDashCollider(1);

        LightFoots(1);
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator JawSlamWithShockwave()
    {
        Debug.Log("JawSlamWithShockwave");

        isExecutingAttack = true;
        LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(2, 20.0f, transform.position + transform.forward * 6.0f, 3.0f));
        yield return new WaitForSeconds(2.2f); // 임시완

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        //animator.SetTrigger("JawSlamWithShockwave");
        yield return new WaitForSeconds(2.0f); // 임시완

        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 2.0f, transform.position + transform.forward * 6.0f, 2.0f));
        yield return new WaitForSeconds(2.0f);

        LightFoots(1);
        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator SpinAndTargetSmash()
    {
        Debug.Log("SpinAndTargetAttack");

        isExecutingAttack = true;
        LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 25.0f, transform.position, 3.0f)); // 임시완. 크기
        yield return new WaitForSeconds(2.2f);
        // animator.SetTrigger("SpinAndTargetSmash_C");
        yield return new WaitForSeconds(2.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position, 3.0f)); // 임시완. 크기
        yield return new WaitForSeconds(2.2f);
        // animator.SetTrigger("SpinAndTargetSmash");
        yield return new WaitForSeconds(2.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 25.0f, transform.position, 3.0f)); // 임시완. 크기
        yield return new WaitForSeconds(2.2f);
        // animator.SetTrigger("SpinAndTargetSmash_C");
        yield return new WaitForSeconds(2.0f);

        LightFoots(1);
        yield return new WaitForSeconds(1.0f);

        isExecutingAttack = false;
    }

    IEnumerator RoarAndSmash()
    {
        Debug.Log("RoarAndDash");

        isExecutingAttack = true;
        LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        // animator.SetTrigger("RoarAndSmash");
        yield return new WaitForSeconds(0.5f);

        SlowAllPlayers(0.3f, 2.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(2, 20.0f, transform.position + transform.forward * 1.0f, 3.0f));
        yield return new WaitForSeconds(1.3f); // 임시완. 시간 정하기

        ActiveDashCollider(0);

        float dashTime = 0.5f;
        float dashSpeed = moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * dashSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        ActiveDashCollider(1);

        LightFoots(1);
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator FocusAndLinearShockwave()
    {
        Debug.Log("FocusAndSmash");

        isExecutingAttack = true;
        LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        //animator.SetTrigger("FocusAndLinearShockwave");
        indicatorCoroutine = StartCoroutine(ShowIndicator(2, 20.0f, transform.position + transform.forward * 1.0f, 2.5f));
        yield return StartCoroutine(DamageCoroutine(2.0f));

        shockwaveCoroutine = StartCoroutine(CreateLinearShockwave(1.5f, 0.1f, targetPosition, 2.0f)); // 임시완. 크기
        yield return new WaitForSeconds(2.0f);

        LightFoots(0);
        yield return new WaitForSeconds(1.0f);
        isExecutingAttack = false;
    }

    private IEnumerator DamageCoroutine(float duration)
    {
        photonView.RPC("SetIsFocus", RpcTarget.AllBuffered, true);
        //isFocus = true;

        yield return new WaitForSeconds(duration);

        photonView.RPC("SetIsFocus", RpcTarget.AllBuffered, false);
        //isFocus = false;
    }

    [PunRPC]
    void SetIsFocus(bool value)
    {
        isFocus = value;
    }

    void SlowAllPlayers(float slowAmount, float duration)
    {
        photonView.RPC("ApplySlowRPC", RpcTarget.AllBuffered, slowAmount, duration);
    }

    [PunRPC]
    void ApplySlowRPC(float slowAmount, float duration)
    {
        foreach (GameObject player in PlayerList)
        {
            player.GetComponent<PlayerController>().ApplySlow(slowAmount, duration);
        }
    }

    IEnumerator CreateShockwave(float maxRadius, float startScale, Vector3 position, float speed)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            position.y = 0.15f;

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

    IEnumerator CreateLinearShockwave(float maxRadius, float startScale, Vector3 position, float speed)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            Vector3 forwardOffset = transform.forward * 1.0f;
            position += forwardOffset;
            position.y = 0.15f;

            currentShockwave = PhotonNetwork.Instantiate(Path.Combine("Boss", "LinearShockWave"), position, Quaternion.identity); // 넣어줘야 함.

            float currentScale = startScale;
            Vector3 movementDirection = transform.forward;

            while (currentScale < maxRadius)
            {
                currentShockwave.transform.position += movementDirection * speed * Time.deltaTime;
                yield return null;
            }

            PhotonNetwork.Destroy(currentShockwave);
            currentShockwave = null;
        }
    }

    // 패턴 1
    void MakeInvincible()
    {
        if (PhotonNetwork.IsMasterClient)
        {
            //photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Invincible");
        }

        photonView.RPC("MakeInvincibleRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void MakeInvincibleRPC()
    {
        isInvincible = true;
    }

    IEnumerator SpinAndExtinguishAllTorches()
    {
        Debug.Log("SpinAndExtinguishTorches");
        //animator.SetTrigger("QuickSpin");

        yield return new WaitForSeconds(2.0f);

        for (int i = 0; i < Torches.Count; i++)
        {
            photonView.RPC("SetActiveRPC", RpcTarget.AllBuffered, Torches, i, false);
            Torches[i].SetActive(false);
        }
    }

    [PunRPC]
    void SetActiveRPC(List<GameObject> gameObjects, int idx, bool value)
    {
        gameObjects[idx].SetActive(value);
    }


    void LightMagicCircle()
    {
        Debug.Log("LightMagicCircle");

        for (int i = 0; i < MagicCircles.Count; i++)
        {
            photonView.RPC("SetActiveRPC", RpcTarget.AllBuffered, MagicCircles, i, true);
            MagicCircles[i].SetActive(true);
        }
    }

    bool ControlSpeed()
    {
        if (canControlSpeed) // 임시완. 마법진에서 canControlSpeed = true; 해줘야함
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

        for (int i = 0; i < 4; i++)
        {
            photonView.RPC("SetActiveRPC", RpcTarget.AllBuffered, Torches, 2 * i, true);
            Torches[2 * i].SetActive(true);
        }
    }

    IEnumerator MoveAndAttack()
    {
        Debug.Log("MoveAndAttack");

        Vector3 center = new Vector3(0, 0, 0);
        float radius = 45.0f;

        for (int n = 0; n < 8; n++)
        {
            Vector3 targetPosition = GetRandomPosition(center, radius);
            IEnumerator randomAttack = GetRandomAttack();

            storedPositions.Add(targetPosition);
            storedAttacks.Add(randomAttack);

            yield return JumpToPosition(targetPosition);
            yield return StartCoroutine(randomAttack);
            yield return new WaitForSeconds(3.0f);
        }
    }


    IEnumerator RoarAndExtinguishAllTorches()
    {
        Debug.Log("RoarAndExtinguishAllTorches");

        animator.SetTrigger("Roar");
        yield return new WaitForSeconds(3.0f);

        for (int i = 0; i < Torches.Count; i++)
        {
            photonView.RPC("SetActiveRPC", RpcTarget.AllBuffered, Torches, i, false);
            Torches[i].SetActive(false);
        }
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
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        Vector3 startPosition = transform.position;
        float jumpHeight = 10.0f;
        float jumpDuration = 2.0f;

        float elapsedTime = 0.0f;

        // animator.SetTrigger("Jump");

        while (elapsedTime < jumpDuration)
        {
            float progress = elapsedTime / jumpDuration;
            float height = Mathf.Sin(Mathf.PI * progress) * jumpHeight;
            transform.position = Vector3.Lerp(startPosition, targetPosition, progress) + Vector3.up * height;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = targetPosition;

        yield return new WaitForSeconds(1.0f);
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
        yield return new WaitForSeconds(3.0f);
    }
    void SpeedUp()
    {
        moveSpeed += 2.0f;
    }

    IEnumerator Dash()
    {
        Debug.Log("Dash");

        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);


        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 20.0f, transform.position + transform.forward * 1.0f, 3.0f));
        yield return new WaitForSeconds(1.3f); // 임시완. 시간 정하기

        ActiveDashCollider(0);

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

        ActiveDashCollider(1);

        yield return new WaitForSeconds(3.0f);

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

    bool DisplayAttackOrder() // 세부 구현 후 동기화 되도록 수정 필요.
    {
        if (canDisplay)
        {
            Debug.Log("DisplayAttackOrder");

            playerOrder = new List<int> { 0, 0, 0, 0, 0, 0, 0, 0 };
            // correctOrder = new List<int> { 1, 1, 1, 1, 2, 2, 2, 2 };
            correctOrder = new List<int> { 1, 1, 1, 1, 1, 1, 1, 1 }; // 임시완. 실험용
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
        // 임시완. UI에 표시
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
            Debug.Log("DamageAllMap");

            StartCoroutine(MakeDamageCollider(2, 40f, new Vector3(0, 0, 0))); // 임시완 크기

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
        if (collision.gameObject.CompareTag("Projectile_Wi"))
        {
            playerOrder.Add(0);
        }
        else if (collision.gameObject.CompareTag("Projectile_Zard"))
        {
            playerOrder.Add(1);
        }
    }

    // Photon Code
    public bool GetIsInvincible()
    {
        return isInvincible;
    }

    public void TakeDamage(float amount)
    {
        photonView.RPC("TakeDamageRPC", RpcTarget.All, amount);
    }

    [PunRPC]
    void TakeDamageRPC(float amount)
    {
        if (!isInvincible)
        {
            if (isFocus)
            {
                currentHealth -= 0.5f * amount;
            }
            else
            {
                currentHealth -= amount;
            }

            if (isFirstTimeBelow66 && currentHealth <= 66 && currentHealth > 33)
            {
                currentHealth = 66;
                isFirstTimeBelow66 = false;
            }
            else if (isFirstTimeBelow2 && currentHealth <= 2 && currentHealth > 0)
            {
                currentHealth = 2;
                isFirstTimeBelow2 = false;
            }
            else if (currentHealth < 0)
            {
                currentHealth = 0;
            }
            // UI
        }
    }
}