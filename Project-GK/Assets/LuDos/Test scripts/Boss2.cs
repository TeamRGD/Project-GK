using Photon.Pun;
using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using TMPro;
using UnityEngine;
using UnityEngine.AI;
using System.IO;
using Unity.VisualScripting;
using DG.Tweening;

public class Boss2 : MonoBehaviourPunCallbacks
{
    #region variables
    float maxHealth = 100;
    float currentHealth;
    float moveSpeed = 10.0f;
    float rotSpeed = 75.0f;
    float cooltime = 2.0f;

    bool isFirstTimeBelow66 = true;
    bool isFirstTimeBelow2 = true;

    [HideInInspector] public int magicCircleCount = 0;
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
    Coroutine dashCoroutine;

    bool canDisplay = true;
    [HideInInspector] public bool canControlSpeed = false;
    bool isInvincible = false;
    bool isAggroFixed = false;
    bool isFocus = false;

    bool isStarted = false;

    public GameObject Light;

    public List<GameObject> AttackIndicators;
    public List<GameObject> AttackFills;
    public List<GameObject> DamageColliders;

    public GameObject DashCollider;

    public List<GameObject> MagicCircles;
    public List<GameObject> Torches;
    public List<GameObject> FootMesh;
    // public List<GameObject> EyesAndMouse;
    public List<GameObject> Effects;

    List<Vector3> storedPositions = new List<Vector3>();
    List<int> storedAttacks = new List<int>();

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

    AudioSource audioSource;
    public AudioClip[] AudioClip;

    BTNode pattern1Tree;
    BTNode pattern2Tree;
    BTNode pattern3Tree;
    #endregion

    void Start()
    {
        currentHealth = maxHealth;
        audioSource = GetComponent<AudioSource>();
        animator = GetComponent<Animator>();
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
            if (PhotonNetwork.IsMasterClient && PlayerList.Count == 1) // should be fixed (Count => 2)
            {
                isStarted = true;
                photonView.RPC("PlayerListSortRPC", RpcTarget.All);
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
                        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Exit");
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
                        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Exit");
                        //LightFourTorches();
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
                        //StopRandomBasicAttack();
                        isGroggy = false;
                        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Exit");
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
                    photonView.RPC("SetIsAggroFixed", RpcTarget.All);
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

        var checkHealthNode = new ActionNode(() => {
            if (currentHealth <= 2)
            {
                StopRandomBasicAttack();
                isGroggy = true;
                return false;
            }
            return true;
        });

        return new Sequence(
            checkHealthNode,
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
        isGroggy = true;

        photonView.RPC("SetGroggyRPC", RpcTarget.All);

        StartCoroutine(GroggyTime(10.0f));

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Groggy");
        }

        return true;
    }

    [PunRPC]
    void SetGroggyRPC()
    {
        isInvincible = false;
        StopRandomBasicAttack();

        UIManager_Vanta.Instance.DisableAttackNode();
        foreach (GameObject torch in Torches)
        {
            if (!torch.activeSelf)
            {
                torch.SetActive(true);
            }
        }
    }


    IEnumerator GroggyTime(float time)
    {
        yield return new WaitForSeconds(time);
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Idle");
            yield return new WaitForSeconds(3.0f);
        }
        if (!isInvincible)
        {
            currentHealth--;
        }
        isGroggy = false;
    }

    [PunRPC]
    void DieRPC()
    {
        isInvincible = true;

        AnimatorStateInfo currentState = animator.GetCurrentAnimatorStateInfo(0);

        if (currentState.IsName("Groggy"))
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "GroggytoDeath");
        }
        else
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Death");
        }
    }

    void Die()
    {
        photonView.RPC("DieRPC", RpcTarget.All);
    }

    IEnumerator MakeDamageCollider(int idx, float maxLength, Vector3 position)
    {
        if (PhotonNetwork.IsMasterClient)
        {
            if (idx == 0) { }
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
            position.y = 1.0f;

            if (idx == 0)
            {
                currentIndicator = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackIndicator" + idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                Vector3 fillStartPosition = currentIndicator.transform.position - currentIndicator.transform.forward * (maxLength * 5f);
                currentFill = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackFill0_"), fillStartPosition, Quaternion.LookRotation(transform.forward));

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
                Destroy(currentFill);
                currentFill = null;
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
        else if (dashCoroutine != null)
        {
            StopCoroutine(dashCoroutine);
            dashCoroutine = null;
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

    IEnumerator LookAtTarget(Vector3 targetDirection, float rotationSpeed)
    {
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);

            float angleDifference = Vector3.SignedAngle(transform.forward, targetDirection, Vector3.up);

            if (angleDifference > 0)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "TurnLeft");
            }
            else
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "TurnRight");
            }

            while (Quaternion.Angle(transform.rotation, targetRotation) > 0.01f)
            {
                transform.rotation = Quaternion.RotateTowards(transform.rotation, targetRotation, rotationSpeed * Time.deltaTime);

                yield return null;
            }

            transform.rotation = targetRotation;

            if (isInvincible)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "Invincible");
            }
            else
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "Idle");
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
        photonView.RPC("SelectAggroTargetRPC", RpcTarget.All, idx);
    }

    IEnumerator PlayEffectForDuration(int idx, Vector3 position, Quaternion rotation, float duration, Vector3 scale)
    {
        GameObject spawnedEffect = PhotonNetwork.Instantiate(Path.Combine("Boss", "Vanta", "Effect" + idx.ToString()), position, rotation);
        spawnedEffect.transform.localScale = scale;

        if (idx == 2)
        {
            Renderer renderer = spawnedEffect.GetComponent<Renderer>();
            Material material = renderer.material;
            Color initialColor = material.color;

            float elapsedTime = 0f;

            while (elapsedTime < duration)
            {
                elapsedTime += Time.deltaTime;
                float alpha = Mathf.Lerp(initialColor.a, 0f, elapsedTime / duration);
                material.color = new Color(initialColor.r, initialColor.g, initialColor.b, alpha);
                yield return null;
            }
            PhotonNetwork.Destroy(spawnedEffect);
        }
        else
        {
            yield return new WaitForSeconds(duration);
            PhotonNetwork.Destroy(spawnedEffect);
        }
    }

    bool RandomBasicAttack()
    {
        if (!isExecutingAttack)
        {
            int attackType = UnityEngine.Random.Range(1, 7);
            //int attackType = 1;

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

    void ActiveDashCollider(int idx)
    {
        photonView.RPC("ActiveDashColliderRPC", RpcTarget.All, idx);
    }

    [PunRPC]
    void ActiveDashColliderRPC(int idx)
    {
        if (idx == 0)
        {
            DashCollider.tag = "DamageCollider";
        }

        else if (idx == 1)
        {
            DashCollider.tag = "Untagged";
        }
    }

    [PunRPC]
    void CameraShakeRPC()
    {
        Camera.main.DOShakePosition(1f, 0.6f, 50, 90, true);
    }

    //void LightFoots(int idx)
    //{
    //    if (currentHealth == 66 || (currentHealth <= 33 && currentHealth > 2))
    //    {
    //        if (idx == 0)
    //        {
    //            for (int i = 0; i < FootMesh.Count; i++)
    //            {
    //                photonView.RPC("LightFootsRPC", RpcTarget.All, i, true);
    //            }
    //        }
    //        else if (idx == 1)
    //        {
    //            for (int i = 0; i < FootMesh.Count; i++)
    //            {
    //                photonView.RPC("LightFootsRPC", RpcTarget.All, i, false);
    //            }
    //        }
    //    }
    //    else
    //    {
    //        for (int i = 0; i < FootMesh.Count; i++)
    //        {
    //            if (FootMesh[i].activeSelf)
    //            {
    //                photonView.RPC("LightFootsRPC", RpcTarget.All, i, false);
    //            }
    //        }
    //    }
    //}

    //[PunRPC]
    //void LightFootsRPC(int i, bool value)
    //{
    //    FootMesh[i].SetActive(value);
    //}

    IEnumerator ShortDashAndSlash()
    {
        isExecutingAttack = true;
        //LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 0.7f, transform.position + transform.forward * 7.0f, 2.0f));
        yield return new WaitForSeconds(2.0f);

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "ShortDashAndSlash");

        yield return new WaitForSeconds(1.0f);

        ActiveDashCollider(0);

        float distance = 3.0f;
        float dashTime = distance / moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * moveSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        ActiveDashCollider(1);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 10.0f, transform.position + transform.forward * 8.0f, 1.2f));
        yield return new WaitForSeconds(1.2f);
        photonView.RPC("PlayAudio", RpcTarget.All, 3);
        yield return new WaitForSeconds(0.3f);
        photonView.RPC("PlayAudio", RpcTarget.All, 3);

        //LightFoots(1);
        yield return new WaitForSeconds(cooltime);

        isExecutingAttack = false;
    }

    [PunRPC]
    void SetAggroTarget(int idx)
    {
        aggroTarget = PlayerList[idx];
    }

    IEnumerator DoubleDash()
    {
        isExecutingAttack = true;
        //LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        photonView.RPC("SetAggroTarget", RpcTarget.All, 0);
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.2f, transform.position + transform.forward * 7.0f, 3.0f));
        yield return new WaitForSeconds(1.5f);

        ActiveDashCollider(0);

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "PrepareForDash");

        yield return new WaitForSeconds(1.5f);

        float distance = 10.0f;
        float dashTime = distance / moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * moveSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "DashtoIdle");

        ActiveDashCollider(1);

        yield return new WaitForSeconds(2.0f);

        photonView.RPC("SetAggroTarget", RpcTarget.All, 0);
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.2f, transform.position + transform.forward * 7.0f, 3.0f));
        yield return new WaitForSeconds(1.5f);

        ActiveDashCollider(0);

        elapsedTime = 0.0f;

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "PrepareForDash");

        yield return new WaitForSeconds(1.5f);

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * moveSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "DashtoIdle");

        ActiveDashCollider(1);

        //LightFoots(1);
        yield return new WaitForSeconds(cooltime);

        isExecutingAttack = false;
    }

    IEnumerator JawSlamWithShockwave()
    {
        isExecutingAttack = true;
        //LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 3.0f, 3.0f));
        yield return new WaitForSeconds(1.5f);

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "JawSlamWithShockwave");
        yield return new WaitForSeconds(1.5f);

        photonView.RPC("PlayAudio", RpcTarget.All, 2);
        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 0f, transform.position + transform.forward * 3.0f, 2.0f)); // 임시완. 깨무는 이펙트
        yield return new WaitForSeconds(2.0f);

        //LightFoots(1);
        yield return new WaitForSeconds(cooltime);

        isExecutingAttack = false;
    }

    IEnumerator SpinAndTargetSmash()
    {
        isExecutingAttack = true;
        //LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 15.0f, transform.position, 3.0f));
        yield return new WaitForSeconds(0.2f);
        photonView.RPC("SetTriggerRPC", RpcTarget.All, "SpinAndTargetSmash_C");
        yield return new WaitForSeconds(5.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position, 3.0f));
        yield return new WaitForSeconds(0.3f);
        photonView.RPC("SetTriggerRPC", RpcTarget.All, "SpinAndTargetSmash");
        yield return new WaitForSeconds(5.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 25.0f, transform.position, 3.0f));
        yield return new WaitForSeconds(0.3f);
        photonView.RPC("SetTriggerRPC", RpcTarget.All, "SpinAndTargetSmash_C");
        yield return new WaitForSeconds(5.0f);

        //LightFoots(1);
        yield return new WaitForSeconds(cooltime);

        isExecutingAttack = false;
    }

    IEnumerator RoarAndSmash()
    {
        isExecutingAttack = true;
        //LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));
        yield return new WaitForSeconds(1.5f);

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Roar");
        yield return new WaitForSeconds(0.5f);
        photonView.RPC("PlayAudio", RpcTarget.All, 0);

        SlowAllPlayers(0.3f, 1.0f);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 1.0f, 1.5f));
        yield return new WaitForSeconds(0.5f);

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "ArmSmash");

        yield return new WaitForSeconds(1.0f); // 임시완
        photonView.RPC("CameraShakeRPC", RpcTarget.All);
        Vector3 tmpPosition = transform.position;
        tmpPosition.y = -0.85f;
        StartCoroutine(PlayEffectForDuration(2, tmpPosition + transform.forward * 1.0f, Quaternion.LookRotation(transform.forward), 6.0f, new Vector3(20.0f, 1.0f, 20.0f)));

        yield return new WaitForSeconds(2.0f);

        //LightFoots(1);
        yield return new WaitForSeconds(cooltime);

        isExecutingAttack = false;
    }

    IEnumerator FocusAndLinearShockwave()
    {
        isExecutingAttack = true;
        //LightFoots(0);

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));
        yield return new WaitForSeconds(1.5f);

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "FocusAndLinearShockWave");
        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, targetPosition + transform.forward * 2.0f, 3.0f));
        yield return StartCoroutine(DamageCoroutine(3.0f));

        photonView.RPC("CameraShakeRPC", RpcTarget.All);
        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 0.1f, targetPosition + transform.forward * 2.0f, 2.0f));
        Vector3 tmpPosition = transform.position;
        tmpPosition.y = -0.85f;
        StartCoroutine(PlayEffectForDuration(2, tmpPosition + transform.forward * 2.0f, Quaternion.LookRotation(transform.forward), 6.0f, new Vector3(20.0f, 1.0f, 20.0f)));
        yield return new WaitForSeconds(2.0f);

        //LightFoots(0);
        yield return new WaitForSeconds(cooltime);

        isExecutingAttack = false;
    }

    private IEnumerator DamageCoroutine(float duration)
    {
        photonView.RPC("SetIsFocus", RpcTarget.All, true);

        yield return new WaitForSeconds(duration);

        photonView.RPC("SetIsFocus", RpcTarget.All, false);
    }

    [PunRPC]
    void SetIsFocus(bool value)
    {
        isFocus = value;
    }

    void SlowAllPlayers(float slowAmount, float duration)
    {
        photonView.RPC("ApplySlowRPC", RpcTarget.All, slowAmount, duration);
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
            position.y = 1.5f;

            currentShockwave = PhotonNetwork.Instantiate(Path.Combine("Boss", "ShockWave_shock"), position, Quaternion.identity);

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
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Invincible");
        }

        photonView.RPC("MakeInvincibleRPC", RpcTarget.All);
    }

    [PunRPC]
    void MakeInvincibleRPC()
    {
        isInvincible = true;
    }

    IEnumerator SpinAndExtinguishAllTorches()
    {
        photonView.RPC("SetTriggerRPC", RpcTarget.All, "QuickSpin");

        yield return new WaitForSeconds(4.0f);

        for (int i = 0; i < Torches.Count; i++)
        {
            photonView.RPC("SetActiveTorchesRPC", RpcTarget.All, i, false);
        }
        magicCircleCount = 0; // 동기화 필요
    }

    [PunRPC]
    void SetActiveTorchesRPC(int idx, bool value)
    {
        Torches[idx].SetActive(value);
    }


    void LightMagicCircle()
    {
        for (int i = 0; i < MagicCircles.Count; i++)
        {
            photonView.RPC("SetActiveLightMagicCircleRPC", RpcTarget.All, i, true);
        }
    }

    [PunRPC]
    void SetActiveLightMagicCircleRPC(int idx, bool value)
    {
        MagicCircles[idx].SetActive(value);
    }

    bool ControlSpeed()
    {
        if (canControlSpeed)
        {
            if (magicCircleCount == 5)
            {
                cooltime += 1.0f;
                canControlSpeed = false;
            }
            else if (magicCircleCount == 6)
            {
                cooltime += 1.0f;
                canControlSpeed = false;
            }
            else if (magicCircleCount == 7)
            {
                cooltime += 1.0f;
                canControlSpeed = false;
            }

        }
        return true;
    }

    // 패턴 2
    void LightFourTorches()
    {
        cooltime -= 3.0f;

        for (int i = 0; i < 4; i++)
        {
            photonView.RPC("SetActiveTorchesRPC", RpcTarget.All, 2 * i, true);
        }
    }

    Vector3 GetRandomPosition(Vector3 center, float radius)
    {
        Vector3 randomPoint = Random.insideUnitCircle * radius;
        //DrawCircle(center, radius); // 범위 확인용
        return new Vector3(center.x + randomPoint.x, center.y, center.z + randomPoint.z);
    }


    IEnumerator ExcuteAttack(int attackType)
    {
        if (attackType == 1)
        {
            yield return StartCoroutine(ShortDashAndSlash());
        }
        else if (attackType == 2)
        {
            yield return StartCoroutine(DoubleDash());
        }
        else if (attackType == 3)
        {
            yield return StartCoroutine(JawSlamWithShockwave());
        }
        else if (attackType == 4)
        {
            yield return StartCoroutine(SpinAndTargetSmash());
        }
        else if (attackType == 5)
        {
            yield return StartCoroutine(RoarAndSmash());
        }
        else if (attackType == 6)
        {
            yield return StartCoroutine(FocusAndLinearShockwave());
        }
    }

    IEnumerator MoveAndAttack()
    {
        yield return new WaitForSeconds(3.0f);

        Vector3 center = new Vector3(0, 0, 0);
        float radius = 15.0f;

        for (int n = 0; n < 4; n++)
        {
            Vector3 targetPosition = GetRandomPosition(center, radius);
            int attackType = UnityEngine.Random.Range(1, 7);

            storedPositions.Add(targetPosition);
            storedAttacks.Add(attackType);

            yield return JumpToPosition(targetPosition);
            yield return StartCoroutine(ExcuteAttack(attackType));
            yield return new WaitForSeconds(1.0f);
        }
    }

    IEnumerator RoarAndExtinguishAllTorches()
    {
        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Roar1");
        yield return new WaitForSeconds(3.0f);
        photonView.RPC("PlayAudio", RpcTarget.All, 0);

        for (int i = 0; i < PlayerList.Count; i++)
        {
            StartCoroutine(PlayEffectForDuration(1, (transform.position + transform.up * 10.0f) + 0.5f * (PlayerList[i].transform.position - (transform.position + transform.up * 10.0f)), Quaternion.LookRotation(PlayerList[i].transform.position - transform.position), 6.0f, new Vector3(1.0f, 20.0f, 20.0f)));
        }

        Light.SetActive(false);

        for (int i = 0; i < Torches.Count; i++)
        {
            photonView.RPC("SetActiveTorchesRPC", RpcTarget.All, i, false);
        }
    }

    IEnumerator JumpToPosition(Vector3 targetPosition)
    {
        yield return StartCoroutine(LookAtTarget(targetPosition - transform.position, rotSpeed));
        yield return new WaitForSeconds(1.5f);

        Vector3 startPosition = transform.position;
        float jumpHeight = 3.0f;
        float jumpDuration = 0.7f;

        float elapsedTime = 0.0f;

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Jump");
        yield return new WaitForSeconds(2.0f);
        photonView.RPC("PlayAudio", RpcTarget.All, 1);

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
        if (bossAttackCount < storedPositions.Count)
        {
            Vector3 targetPosition = storedPositions[bossAttackCount];
            yield return StartCoroutine(JumpToPosition(targetPosition));
        }
        yield break;
    }

    IEnumerator PerformStoredAttack()
    {
        if (bossAttackCount < storedAttacks.Count)
        {
            yield return StartCoroutine(ExcuteAttack(storedAttacks[bossAttackCount]));

            bossAttackCount++;
            yield return new WaitForSeconds(1.0f);
        }
        yield break;
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
    IEnumerator Roar()
    {
        Light.SetActive(true);
        yield return new WaitForSeconds(3.0f);
        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Roar0");
        yield return new WaitForSeconds(3.0f);
        photonView.RPC("PlayAudio", RpcTarget.All, 0);
        for (int i = 0; i < PlayerList.Count; i++)
        {
            StartCoroutine(PlayEffectForDuration(1, (transform.position + transform.up * 10.0f) + 0.5f * (PlayerList[i].transform.position - (transform.position + transform.up * 10.0f)), Quaternion.LookRotation(PlayerList[i].transform.position - transform.position), 6.0f, new Vector3(1.0f, 20.0f, 20.0f)));
        }
        yield return new WaitForSeconds(1.0f);
    }
    void SpeedUp()
    {
        moveSpeed += 2.0f;
    }

    IEnumerator Dash()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        photonView.RPC("SetAggroTarget", RpcTarget.All, 0);
        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.2f, transform.position + transform.forward * 7.0f, 3.0f));
        yield return new WaitForSeconds(1.5f);

        ActiveDashCollider(0);

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "PrepareForDash");

        yield return new WaitForSeconds(1.5f);

        float distance = 10.0f;
        float dashTime = distance / moveSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < dashTime)
        {
            transform.position += transform.forward * moveSpeed * Time.deltaTime;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        photonView.RPC("SetTriggerRPC", RpcTarget.All, "DashtoIdle");

        ActiveDashCollider(1);

        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    bool DashAttack()
    {
        if (!isExecutingAttack)
        {
            dashCoroutine = StartCoroutine(Dash());
        }
        return true;
    }

    bool DisplayAttackOrder()
    {
        if (canDisplay)
        {
            playerOrder = new List<int> { 0, 0, 0, 0, 0, 0, 0, 0 };
            correctOrder = new List<int> { 1, 1, 1, 1, 2, 2, 2, 2 };
            // correctOrder = new List<int> { 1, 1, 1, 1, 1, 1, 1, 1 }; // 임시완. 실험용
            Shuffle(correctOrder);

            photonView.RPC("DisplayOrderOnUI",RpcTarget.All, correctOrder.ToArray());

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

    [PunRPC]
    void DisplayOrderOnUI(int[] orderArray)
    {
        List<int> order = new List<int>(orderArray);
        Debug.Log("Correct Order: " + string.Join(", ", order));
        UIManager_Vanta.Instance.EnableAttackNode();
        UIManager_Vanta.Instance.ResetAttackNode(order);
    }

    bool CheckPlayerAttackOrder()
    {
        if (playerOrder[attackOrderCount] != 0 && attackOrderCount < 8)
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
        if (playerOrder[attackOrderCount] != 0 && attackOrderCount < 8)
        {
            photonView.RPC("CameraShakeRPC", RpcTarget.All);
            StartCoroutine(MakeDamageCollider(1, 40f, new Vector3(0, 1, 0)));

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
    /*
    void OnTriggerEnter(Collider other)
    {
        if (currentHealth <= 2 && currentHealth > 0)
        {
            if (other.CompareTag("Projectile_Wi"))
            {
                print(33333);
                playerOrder[attackOrderCount] = 1;
            }
            else if (other.CompareTag("Projectile_Zard"))
            {
                print(44444);
                playerOrder[attackOrderCount] = 2;
            }
        }
    }
    */

    public float GetCurrentHP()
    {
        return currentHealth;
    }

    public void ChangePlayerOrder(int i)
    {
        playerOrder[attackOrderCount] = i;
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

            UIManager_Vanta.Instance.ManageHealth(currentHealth, maxHealth);
        }
    }

    [PunRPC]
    void SetTriggerRPC(string name)
    {
        animator.SetTrigger(name);
    }

    [PunRPC]
    void PlayAudio(int idx)
    {
        audioSource.PlayOneShot(AudioClip[idx]);
    }
}