using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using Unity.Properties;
using TMPro;
using UnityEngine.Animations;
using System.IO;
using UnityEngine.UIElements;
using ExitGames.Client.Photon;
using DG.Tweening;

public class Boss1 : MonoBehaviourPunCallbacks
{
    float maxHealth = 100;
    float currentHealth;
    float rotSpeed = 75.0f;
    float sitRotSpeed = 50.0f;

    bool isFirstTimeBelow66 = true;
    bool isFirstTimeBelow33 = true;
    bool isFirstTimeBelow2 = true;

    int successCount = 0;
    int attackCount = 0;
    [HideInInspector] public int collisionCount = 0;

    int selectedBookCaseIndex = 0;
    bool hasCollidedWithBookCase = false;
    int collidedBookCaseIndex = -1;

    bool isGroggy = false;
    bool isExecutingPattern = false;
    bool isExecutingAttack = false;
    bool isExecutingAreaAttack = false;
    bool isExecutingBookAttack = false;
    bool hasExecutedInitialActions1 = false;
    bool hasExecutedInitialActions2 = false;
    bool hasExecutedInitialActions3 = false;
    bool isWrongBookCase = false;

    Coroutine randomBasicAttackCoroutine;
    Coroutine indicatorCoroutine;
    Coroutine shockwaveCoroutine;
    Coroutine chargeAttackCoroutine;
    Coroutine moveBackCoroutine;

    bool canChange1 = true;
    bool canChange2 = true;
    bool canDisplay = true;
    [HideInInspector] public bool IsCorrect = false;
    bool isInvincible = false;
    bool isAggroFixed = false;

    bool isStarted = false;

    [HideInInspector] public int Code;
    int playerIdx = 0;

    public List<GameObject> AttackIndicators;
    public List<GameObject> AttackFills;
    public List<GameObject> DamageColliders;

    List<int> bookcaseIndices = new List<int>();
    List<int> attackedAreas = new List<int>();
    List<int> numBooksOfBookCase = new List<int>();
    public List<GameObject> BookCases;
    public List<GameObject> BookCaseCollisions;
    public List<GameObject> Areas;
    public List<GameObject> FootColliders;

    public Material GreenMaterial; // 임시완
    public Material RedMaterial; // 임시완
    public Material Temporary; // 임시완
    public GameObject CipherDevice;
    private Dictionary<Transform, Material> originalMaterials = new Dictionary<Transform, Material>();
    private Dictionary<Renderer, Material> originalAreaMaterials = new Dictionary<Renderer, Material>();
    Renderer bookCaseRenderer;

    [HideInInspector] public List<GameObject> PlayerList;
    [HideInInspector] public GameObject aggroTarget;

    CipherDevice cipherDeviceScript;
    Animator animator;
    Rigidbody rb;
    public List<GameObject> Effects;
    public GameObject ShockWave;

    GameObject currentIndicator;
    GameObject currentFill;
    GameObject currentShockwave;
    GameObject currentDamageCollider;

    BTNode pattern1Tree;
    BTNode pattern2Tree;
    BTNode pattern3Tree;

    void Start()
    {
        currentHealth = maxHealth;
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
        cipherDeviceScript = CipherDevice.GetComponent<CipherDevice>();
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();
        StartCoroutine(StartTime());
    }

    IEnumerator StartTime()
    {
        while (!isStarted)
        {
            if (PhotonNetwork.IsMasterClient && PlayerList.Count == 2) // should be fixed (Count => 2)
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
#if UNITY_EDITOR
        ForDebug();
#endif
    }

    void ForDebug()
    {
        if (Input.GetKeyDown(KeyCode.F))
        {
            TakeDamage(1);
            Debug.Log("Boss Health: " + currentHealth);
        }
        if (Input.GetKeyDown(KeyCode.M))
        {
            IsCorrect = true;
        }
        if (Input.GetKeyDown(KeyCode.N))
        {
            collisionCount++;
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
                        yield return StartCoroutine(ArmSlamAndGetEnergy());
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
                        StopRandomBasicAttack();
                        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Exit");
                        MakeInvincible();
                        yield return StartCoroutine(JumpToCenter());
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
                        photonView.RPC("SetTriggerRPC", RpcTarget.All, "Exit");
                        MakeInvincible();
                        yield return StartCoroutine(Roar());
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
            new ActionNode(ChangeBooksToGreen),
            new ActionNode(FixAggroTargetAndDisplay),
            new ActionNode(ActivateCipherDevice1),
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
            new WhileNode(() => attackCount < 6,
                new ActionNode(AttackAreas)
                ),
            new ActionNode(ActivateCipherDevice2),
            new ActionNode(ChargeAttack),
            new Sequence(
                new ActionNode(IsCipherCorrect),
                new ActionNode(ReleaseInvincibilityAndGroggy)
                )
        );
    }

    BTNode CreatePattern3Tree()
    {
        return new Sequence(
            new ActionNode(DisplayBookCaseOrder),
            new WhileNode(() => collisionCount < 8,
                new Sequence(
                    new ActionNode(LightAndAttackBookCase),
                    new ActionNode(DamageAllMap)
                    )
                ),
            new ActionNode(ReleaseInvincibilityAndGroggy)
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

    [PunRPC]
    void SetGroggyRPC()
    {
        for (int i = 0; i < PlayerList.Count; i++)
        {
            PlayerList[i].GetComponent<PlayerController>().IAmAggro("PlayerNone");
        }
        UIManager_Ygg.Instance.DisableHint();
        UIManager_Ygg.Instance.DisableAreaNum();
        UIManager_Ygg.Instance.DisableAttackNode();
    }

    bool SetGroggy()
    {
        isGroggy = true;
        StartCoroutine(GroggyTime(10.0f));
        photonView.RPC("SetGroggyRPC", RpcTarget.All);
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Groggy");
        }

        return true;
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
            if (idx == 0)
            {   
                currentDamageCollider = PhotonNetwork.Instantiate(Path.Combine("Boss", "DamageCollider"+idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                float width = 0.5f;
                currentDamageCollider.transform.localScale = new Vector3(width, currentDamageCollider.transform.localScale.y, maxLength);

                yield return new WaitForSeconds(0.1f);
                
                PhotonNetwork.Destroy(currentDamageCollider);
                currentDamageCollider = null;
            }
            else
            {
                currentDamageCollider = PhotonNetwork.Instantiate(Path.Combine("Boss", "DamageCollider"+idx.ToString()), position, Quaternion.LookRotation(transform.forward));

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
                currentFill = null;

                yield return new WaitForSeconds(0.6f);
                StartCoroutine(MakeDamageCollider(idx, maxLength, position));
            }
            else
            {
                currentIndicator = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackIndicator"+idx.ToString()), position, Quaternion.identity);
                currentFill = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackFill"+idx.ToString()), position, Quaternion.identity);

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

    [PunRPC]
    void CameraShakeRPC()
    {
        Camera.main.DOShakePosition(1f, 0.6f, 50, 90, true);
    }

    void StopRandomBasicAttack()
    {
        if (randomBasicAttackCoroutine != null)
        {
            StopCoroutine(randomBasicAttackCoroutine);
            randomBasicAttackCoroutine = null;
            isExecutingAttack = false;

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
                currentDamageCollider= null;
            }
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


    IEnumerator SitAndLookAtTarget(Vector3 targetDirection, float rotationSpeed) // 동기화 필요
    {
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);

            float angleDifference = Vector3.SignedAngle(transform.forward, targetDirection, Vector3.up);

            if (angleDifference > 0)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "SitTurnLeft");
            }
            else
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "SitTurnRight");
            }

            while (Quaternion.Angle(transform.rotation, targetRotation) > 0.01f)
            {
                transform.rotation = Quaternion.RotateTowards(transform.rotation, targetRotation, rotationSpeed * Time.deltaTime);

                yield return null;
            }

            transform.rotation = targetRotation;
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

    bool RandomBasicAttack()
    {
        if (!isExecutingAttack)
        {
            int attackType = UnityEngine.Random.Range(1, 6);
            // int attackType = 1;

            switch (attackType)
            {
                case 1:
                    randomBasicAttackCoroutine = StartCoroutine(LandAttackCoroutine());
                    break;
                case 2:
                    randomBasicAttackCoroutine = StartCoroutine(TwoArmSlamCoroutine());
                    break;
                case 3:
                    randomBasicAttackCoroutine = StartCoroutine(AlternatingArmSlamCoroutine());
                    break;
                case 4:
                    randomBasicAttackCoroutine = StartCoroutine(LegStompCoroutine());
                    break;
                case 5:
                    randomBasicAttackCoroutine = StartCoroutine(PalmStrikeCoroutine());
                    break;
            }
        }
        return true;
    }

    [PunRPC]
    void PlayerListSortRPC()
    {
        StartCoroutine(WaitTime());
        PlayerList.Sort((player1, player2) => player1.name.CompareTo(player2.name));
    }

    IEnumerator WaitTime()
    {
        yield return new WaitForSeconds(1.0f);
    }

    IEnumerator PlayEffectForDuration(int idx, Vector3 position, Quaternion rotation, float duration, Vector3 scale)
    {
        GameObject spawnedEffect = PhotonNetwork.Instantiate(Path.Combine("Boss", "Effect"+idx.ToString()), position, rotation);
        spawnedEffect.transform.localScale = scale;

        yield return new WaitForSeconds(duration);

        PhotonNetwork.Destroy(spawnedEffect);
    }

    IEnumerator JumpWithDuration(float duration, Vector3 startPosition, Vector3 targetPosition)
    {
        float elapsedTime = 0.0f;

        while (elapsedTime < duration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / duration;
            float height = Mathf.Sin(Mathf.PI * t) * 5.0f;
            transform.position = Vector3.Lerp(startPosition, targetPosition, t) + Vector3.up * height;
            yield return null;
        }

        transform.position = targetPosition;
    }


    IEnumerator LandAttackCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;
        Vector3 startPosition = transform.position;

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 25.0f, targetPosition + transform.forward * 4.0f, 2.6f));
        yield return new WaitForSeconds(1.0f);

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "JumpAndLand");
        }
        yield return new WaitForSeconds(0.8f);

        yield return StartCoroutine(JumpWithDuration(0.8f, startPosition, targetPosition));

        photonView.RPC("CameraShakeRPC", RpcTarget.All);
        Vector3 tmpPosition = targetPosition;
        tmpPosition.y = -0.85f;
        StartCoroutine(PlayEffectForDuration(2, tmpPosition + transform.forward * 4.0f, Quaternion.LookRotation(transform.forward), 3.0f, new Vector3(20.0f, 1.0f, 20.0f)));
        shockwaveCoroutine = StartCoroutine(CreateShockwave(4.4f, 0.1f, targetPosition + transform.forward * 4.0f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator TwoArmSlamCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 8.0f, 2.3f));

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "BothArmSlam");
        }
        yield return new WaitForSeconds(2.5f);

        photonView.RPC("CameraShakeRPC", RpcTarget.All);
        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 2.0f, transform.position + transform.forward * 8.0f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator AlternatingArmSlamCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "IdletoSit");
        }
        yield return new WaitForSeconds(1.0f);

        for (int i = 0; i < 5; i++)
        {
            yield return StartCoroutine(SitAndLookAtTarget(aggroTarget.transform.position - transform.position, sitRotSpeed));

            if (i == 4)
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.5f, transform.position + transform.forward * 10.0f - transform.right * 1.0f, 2.5f));
                yield return new WaitForSeconds(1.0f);

                if (PhotonNetwork.IsMasterClient)
                {
                    photonView.RPC("SetTriggerRPC", RpcTarget.All, "LeftArmHardSlam");
                }
                yield return new WaitForSeconds(1.5f);
                StartCoroutine(PlayEffectForDuration(0, transform.position + transform.forward * 6.0f, Quaternion.LookRotation(transform.forward), 3.0f, new Vector3(2.0f, 1.0f, 1.3f)));
                yield return new WaitForSeconds(1.5f);
            }
            else if (i == 0 || i == 2)
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 10.0f - transform.right * 1.0f, 2.0f));
                yield return new WaitForSeconds(0.9f);

                if (PhotonNetwork.IsMasterClient)
                {
                    photonView.RPC("SetTriggerRPC", RpcTarget.All, "LeftArmSlam");
                }
                yield return new WaitForSeconds(1.1f);
                StartCoroutine(PlayEffectForDuration(0, transform.position + transform.forward * 6.0f, Quaternion.LookRotation(transform.forward), 3.0f, new Vector3(2.0f, 1.0f, 1.0f)));
                yield return new WaitForSeconds(1.9f);
            }
            else
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 10.0f + transform.right * 1.0f, 2.0f));
                yield return new WaitForSeconds(0.9f);

                if (PhotonNetwork.IsMasterClient)
                {
                    photonView.RPC("SetTriggerRPC", RpcTarget.All, "RightArmSlam");
                }
                yield return new WaitForSeconds(1.1f);
                StartCoroutine(PlayEffectForDuration(0, transform.position + transform.forward * 6.0f, Quaternion.LookRotation(transform.forward), 3.0f, new Vector3(2.0f, 1.0f, 1.0f)));
                yield return new WaitForSeconds(1.9f);
            }
        }

        isExecutingAttack = false;
    }

    IEnumerator LegStompCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 6.5f + transform.right * 2.5f, 3.0f));
        yield return new WaitForSeconds(1.4f);

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "LegStomp");
        }
        yield return new WaitForSeconds(1.7f);

        photonView.RPC("CameraShakeRPC", RpcTarget.All);
        Vector3 tmpPosition = transform.position;
        tmpPosition.y = -0.85f;
        StartCoroutine(PlayEffectForDuration(2, tmpPosition + transform.forward * 6.5f + transform.right * 2.5f, Quaternion.LookRotation(transform.forward), 3.0f, new Vector3(20.0f, 1.0f, 20.0f)));
        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 0.1f, transform.position + transform.forward * 6.5f + transform.right * 2.5f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator PalmStrikeCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        yield return StartCoroutine(LookAtTarget(aggroTarget.transform.position - transform.position, rotSpeed));

        indicatorCoroutine = StartCoroutine(ShowIndicator(2, 20.0f, transform.position + transform.forward * 5.5f + transform.right * 1.0f, 3.0f));
        yield return new WaitForSeconds(1.3f);

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "PalmStrike");
        }
        yield return new WaitForSeconds(1.7f);

        photonView.RPC("CameraShakeRPC", RpcTarget.All);
        Vector3 tmpPosition = transform.position;
        tmpPosition.y = -0.85f;
        StartCoroutine(PlayEffectForDuration(2, tmpPosition + transform.forward * 5.5f + transform.right * 1.0f, Quaternion.LookRotation(transform.forward), 3.0f, new Vector3(20.0f, 1.0f, 20.0f)));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    // Pattern 1
    void MakeInvincible()
    {
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Invincible");
        }

        photonView.RPC("MakeInvincibleRPC", RpcTarget.All);
    }
    [PunRPC] void MakeInvincibleRPC()
    {
        isInvincible = true;
    }

    IEnumerator ArmSlamAndGetEnergy() // 임시완. 에너지를 받는 이펙트가 필요할듯
    {
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "ArmSlamAndGetEnergy");
        }
        
        yield return new WaitForSeconds(8.0f);
    }

    [PunRPC]
    void ChangeBooksToGreenRPC(int[] bookIndices, int bookcaseIndex)
    {
        foreach (int bookIndex in bookIndices)
        {
            Transform book = BookCases[bookcaseIndex].transform.GetChild(bookIndex).GetChild(0);
            Renderer bookRenderer = book.GetComponent<Renderer>();
            if (bookRenderer != null)
            {
                if (!originalMaterials.ContainsKey(book))
                {
                    originalMaterials.Add(book, bookRenderer.material);
                }
                bookRenderer.material = GreenMaterial;
            }
        }
    }

    [PunRPC]
    void UpdateHintUI()
    {
        UIManager_Ygg.Instance.EnableHint();
    }
    
    bool ChangeBooksToGreen()
    {
        if (canChange1)
        {
            // Select 4 BookCase
            bookcaseIndices.Clear();
            while (bookcaseIndices.Count < 4)
            {
                int index = Random.Range(0, 7);
                if (!bookcaseIndices.Contains(index))
                {
                    bookcaseIndices.Add(index);
                }
            }

            List<int> numberOfBooks = new List<int>();

            // How many books to select in each bookcases
            for (int i = 0; i < 4; i++)
            {
                int bookcaseIndex = bookcaseIndices[i];
                int childCount = BookCases[bookcaseIndex].transform.childCount;
                numberOfBooks.Add(Random.Range(1, childCount + 1));
            }

            numBooksOfBookCase.Clear();

            for (int i = 0; i < bookcaseIndices.Count; i++)
            {
                int bookcaseIndex = bookcaseIndices[i];

                int numRange = Random.Range(1, 7);
                numBooksOfBookCase.Add(numRange);

                List<int> bookIndices = new List<int>();
                while (bookIndices.Count < numRange)
                {
                    int bookIndex = Random.Range(0, numberOfBooks[i]);
                    if (!bookIndices.Contains(bookIndex))
                    {
                        bookIndices.Add(bookIndex);
                    }
                }
                // Light ON
                int[] bookIndicesArray = bookIndices.ToArray();
                photonView.RPC("ChangeBooksToGreenRPC", RpcTarget.All, bookIndicesArray, bookcaseIndex);
            }
        }
        photonView.RPC("UpdateHintUI", RpcTarget.All);
        return true;
    }

    [PunRPC]
    void FixAggroTargetAndDisplayRPC()
    {
        isAggroFixed = true;
    }

    bool FixAggroTargetAndDisplay()
    {
        if (canChange1)
        {
            photonView.RPC("FixAggroTargetAndDisplayRPC", RpcTarget.All);
        }
        return true;
    }

    [PunRPC]
    void ActivateCipherDevice1RPC(int idx, int Code)
    {
        if (idx == 0)
        {
            if (cipherDeviceScript != null)
            {
                cipherDeviceScript.AggroTarget = aggroTarget;
            }
            CipherDevice.SetActive(true);
            UIManager_Ygg.Instance.isCorrectedPrevCode = true;
        }
        else if (idx == 1)
        {
            UIManager_Ygg.Instance.patternCode = Code;
        }
    }

    bool ActivateCipherDevice1()
    {
        if (canChange1)
        {
            SelectAggroTarget();
            photonView.RPC("ActivateCipherDevice1RPC", RpcTarget.All, 0, 0);
            
            Code = 0;
            for (int i = 0; i < 4; i++)
            {
                Code += (bookcaseIndices[i] + 1) * numBooksOfBookCase[i];
                //Debug.Log("Index: " + string.Join(", ", bookcaseIndices[i] + 1));
                //Debug.Log("Index: " + string.Join(", ", numBooksOfBookCase[i]));
            }
            photonView.RPC("ActivateCipherDevice1RPC", RpcTarget.All, 1, Code);
            canChange1 = false;
        }
        photonView.RPC("PlayerAggroUI",RpcTarget.All);
        return true;
    }

    [PunRPC]
    void PlayerAggroUI()
    {
        for (int i = 0; i < PlayerList.Count; i++)
        {
            PlayerList[i].GetComponent<PlayerController>().IAmAggro(aggroTarget.tag);
        }
    }

    bool IsCipherCorrect()
    {
        return IsCorrect;
    }

    [PunRPC]
    void ResetBookLightsAndAggroRPC()
    {
        foreach (var entry in originalMaterials)
        {
            Renderer bookRenderer = entry.Key.GetComponent<Renderer>();
            if (bookRenderer != null)
            {
                bookRenderer.material = entry.Value;
            }
        }
        originalMaterials.Clear();

        UIManager_Ygg.Instance.AggroEnd();
    }

    bool ResetBookLightsAndAggro()
    {
        canChange1 = true;
        IsCorrect = false;
        successCount++;
        photonView.RPC("ResetBookLightsAndAggroRPC", RpcTarget.All);

        return true;
    }

    [PunRPC]
    void ReleaseInvincibilityAndGroggyRPC()
    {
        isInvincible = false;

        if (CipherDevice != null && CipherDevice.activeSelf)
        {
            CipherDevice.GetComponent<CipherDevice>().InActive();
            CipherDevice.SetActive(false);
        }
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        if (randomBasicAttackCoroutine != null)
        {
            StopRandomBasicAttack();
        }
        if (chargeAttackCoroutine != null)
        {
            StopCoroutine(chargeAttackCoroutine);
        }
        if (moveBackCoroutine != null)
        {
            StopCoroutine(moveBackCoroutine);
        }
        photonView.RPC("ReleaseInvincibilityAndGroggyRPC", RpcTarget.All);

        return SetGroggy();
    }

    // Pattern 2
    IEnumerator JumpToCenter()
    {
        Vector3 startPosition = transform.position;
        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;

        yield return new WaitForSeconds(2.0f);

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "JumpAndLand");
        }
        yield return new WaitForSeconds(0.8f);

        yield return StartCoroutine(JumpWithDuration(0.8f, startPosition, targetPosition));

        yield return new WaitForSeconds(3.0f);
    }

    bool AttackAreas()
    {
        if (isExecutingAreaAttack) return false;
        int untouchedArea = Random.Range(0, 8);
        StartCoroutine(AttackAreasCoroutine(untouchedArea));
        return true;
    }

    IEnumerator AttackAreasCoroutine(int untouchedArea)
    {
        isExecutingAreaAttack = true;

        attackedAreas.Add(untouchedArea);

        yield return new WaitForSeconds(1.0f);

        Vector3 targetPosition = BookCaseCollisions[untouchedArea].transform.position; // Area position (0,0,0) 이기 때문에 BookCaseCollisions로 대체
        Vector3 targetDirection = transform.position - targetPosition;

        yield return StartCoroutine(LookAtTarget(targetDirection, rotSpeed));

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.All, 0, untouchedArea); // 코루틴 전 Area 동기화

        yield return new WaitForSeconds(3.0f);

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "BothArmSlam");
        }

        yield return new WaitForSeconds(2.0f);

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.All, 1, untouchedArea); // 코루틴 후 Area 동기화

        yield return new WaitForSeconds(0.1f);

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.All, 2, untouchedArea); // 코루틴 후 Area 동기화
        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.All, 3, untouchedArea); // 코루틴 후 Area 동기화
    }

    [PunRPC]
    void AttackAreasCoroutineRPC(int idx, int untouchedArea)
    {
        if (idx == 0)
        {
            for (int i = 0; i < Areas.Count; i++)
            {
                if (i != untouchedArea)
                {
                    Transform childTransform = Areas[i].transform;
                    Renderer childRenderer = childTransform.GetComponent<Renderer>();
                    if (childRenderer != null)
                    {
                        if (!originalAreaMaterials.ContainsKey(childRenderer))
                        {
                            originalAreaMaterials.Add(childRenderer, childRenderer.material);
                        }

                        childRenderer.material = RedMaterial;
                    }
                }
            }
        }

        else if (idx == 1)
        {
            for (int i = 0; i < Areas.Count; i++)
            {
                Collider areaCollider = Areas[i].GetComponent<Collider>();
                if (i != untouchedArea)
                {
                    areaCollider.isTrigger = true;
                    Areas[i].transform.parent.tag = "DamageCollider";
                    Areas[i].tag = "DamageCollider";
                }
            }
        }

        else if (idx == 2)
        {
            for (int i = 0; i < Areas.Count; i++)
            {
                if (i != untouchedArea)
                {
                    Areas[i].GetComponent<Collider>().isTrigger = false;
                    Areas[i].transform.parent.tag = "Ground";
                    Areas[i].tag = "Ground";
                }
            }
        }

        else if (idx == 3)
        {
            foreach (var entry in originalAreaMaterials)
            {
                entry.Key.material = entry.Value;
            }
            originalAreaMaterials.Clear();

            attackCount++;

            isExecutingAreaAttack = false;
        }
    }

    [PunRPC]
    void ActivateCipherDevice2RPC(int Code)
    {
        CipherDevice.SetActive(true);
        UIManager_Ygg.Instance.patternCode = Code;
    }

    bool ActivateCipherDevice2()
    {
        if (canChange2)
        {
            Code = ConvertListToInt(attackedAreas);
            photonView.RPC("ActivateCipherDevice2RPC",RpcTarget.All, Code);
        }
        return true;
    }

    int ConvertListToInt(List<int> list)
    {
        StringBuilder sb = new StringBuilder();
        foreach (int value in list)
        {
            sb.Append(value);
        }
        return int.Parse(sb.ToString());
    }

    bool ChargeAttack()
    {
        if (canChange2)
        {
            canChange2 = false;
            chargeAttackCoroutine = StartCoroutine(ChargeAttackCoroutine());
        }
        return true;
    }

    IEnumerator ChargeAttackCoroutine()
    {
        yield return new WaitForSeconds(2.0f);

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "ChargeAndShockWave");
        }

        yield return new WaitForSeconds(9.0f);

        StartCoroutine(CreateShockwave(4.5f, 0.1f, transform.position, 10.0f));

        yield return new WaitForSeconds(5.0f);

        attackedAreas.Clear();
        attackCount = 0;
        canChange2 = true;
        photonView.RPC("ChargeAttackCoroutineRPC", RpcTarget.All);
    }
    
    [PunRPC]
    void ChargeAttackCoroutineRPC()
    {
        CipherDevice.SetActive(true);
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

    // Pattern 3
    IEnumerator Roar()
    {
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Roar");
            yield return new WaitForSeconds(3.0f);

            for (int i = 0; i < PlayerList.Count; i++)
            {
                StartCoroutine(PlayEffectForDuration(1, (transform.position + transform.up * 10.0f) + 0.5f *(PlayerList[i].transform.position - (transform.position + transform.up * 10.0f)), Quaternion.LookRotation(PlayerList[i].transform.position - transform.position), 3.0f, new Vector3(1.0f, 20.0f, 20.0f)));
            }
        }
        yield return new WaitForSeconds(1.0f);
    }

    [PunRPC]
    void DisplayBookCaseOrderRPC()
    {
        UIManager_Ygg.Instance.EnableAttackNode();
    }
    
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            photonView.RPC("DisplayBookCaseOrderRPC", RpcTarget.All);
            canDisplay = false;
        }
        return true;
    }
    bool LightAndAttackBookCase()
    {
        if (!isExecutingBookAttack)
        {
            StartCoroutine(LightAndAttackBookCaseCoroutine());
        }
        return isWrongBookCase; // Default false
    }

    IEnumerator LightAndAttackBookCaseCoroutine()
    {
        isExecutingBookAttack = true;

        selectedBookCaseIndex = Random.Range(0, 7);

        photonView.RPC("UpdateUI", RpcTarget.All, 0, selectedBookCaseIndex);

        yield return new WaitForSeconds(5.0f);

        photonView.RPC("UpdateUI", RpcTarget.All, 1, selectedBookCaseIndex);

        Vector3 targetPosition;

        if (playerIdx == 0)
        {
            targetPosition = PlayerList[playerIdx++].transform.position;
        }
        else
        {
            targetPosition = PlayerList[playerIdx--].transform.position;
        }

        Vector3 targetDirection = targetPosition - transform.position;
        yield return StartCoroutine(LookAtTarget(targetDirection, rotSpeed));

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "InvincibletoDash");
        }

        hasCollidedWithBookCase = false;
        collidedBookCaseIndex = -1;

        photonView.RPC("LightAndAttackBookCaseCoroutine", RpcTarget.All, 0);
        yield return new WaitForSeconds(0.8f);

        while (!hasCollidedWithBookCase)
        {
            transform.position += targetDirection * Time.deltaTime * 0.4f;
            yield return null;
        }

        if (collidedBookCaseIndex == selectedBookCaseIndex)
        {
            if (PhotonNetwork.IsMasterClient)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "CrashAtBookCase");
                photonView.RPC("CameraShakeRPC", RpcTarget.All);
                photonView.RPC("LightAndAttackBookCaseCoroutine", RpcTarget.All, 1);
            }
            yield return new WaitForSeconds(1.0f);
            photonView.RPC("UpdateUI", RpcTarget.All, 2, selectedBookCaseIndex);
            collisionCount++;
        }
        else
        {
            photonView.RPC("UpdateUI", RpcTarget.All, 3, selectedBookCaseIndex);
            if (PhotonNetwork.IsMasterClient)
            {
                photonView.RPC("SetTriggerRPC", RpcTarget.All, "CrashAtBookCase");
                photonView.RPC("CameraShakeRPC", RpcTarget.All);
                photonView.RPC("LightAndAttackBookCaseCoroutine", RpcTarget.All, 1);
            }
            yield return new WaitForSeconds(1.0f);
            isWrongBookCase = true;
        }

        yield return moveBackCoroutine = StartCoroutine(MoveBackToCenter());

        yield return new WaitForSeconds(3.0f);
    }

    [PunRPC]
    void LightAndAttackBookCaseCoroutine(int idx)
    {
        if (idx == 0)
        {
            for (int i = 0; i < FootColliders.Count; i++)
            {
                FootColliders[i].tag = "DamageCollider";
            }
        }

        else if (idx == 1)
        {
            for (int i = 0; i < FootColliders.Count; i++)
            {
                FootColliders[i].tag = "Untagged";
            }
        }
    }

    [PunRPC]
    void UpdateUI(int idx, int selectedBookCaseIndex)
    {
        if (idx==0)
        {
            // Light ON
            bookCaseRenderer = BookCaseCollisions[selectedBookCaseIndex].GetComponent<Renderer>();

            if (bookCaseRenderer != null)
            {
                bookCaseRenderer.material = GreenMaterial;
            }
        }
        else if (idx==1)
        {
            if (bookCaseRenderer != null)
            {
                // bookCaseRenderer.material = null;
                bookCaseRenderer.material = Temporary; // 임시완
            }
        }
        else if (idx==2)
        {
            UIManager_Ygg.Instance.NodeDeduction();
        }
        else if (idx==3)
        {
            UIManager_Ygg.Instance.ResetAttackNode();
        }
    }

    IEnumerator MoveBackToCenter()
    {
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "StaggeringBack");
        }

        Vector3 startPosition = transform.position;
        Vector3 centerPosition = new Vector3(0.0f, 0.0f, 0.0f);
        float moveDuration = 5.0f;
        float elapsedTime = 0.0f;

        while (elapsedTime < moveDuration)
        {
            transform.position = Vector3.Lerp(startPosition, centerPosition, elapsedTime / moveDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = centerPosition;

        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("SetTriggerRPC", RpcTarget.All, "Invincible");
        }

        isExecutingBookAttack = false;
    }

    bool DamageAllMap()
    {
        StartCoroutine(MakeDamageCollider(1, 40f, new Vector3 (0,0,0)));

        canDisplay = true;
        collisionCount = 0;
        isWrongBookCase = false;

        return true;
    }

    // Else Function
    int GetCollidedBookCaseIndex(GameObject collisionObject)
    {
        for (int i = 0; i < BookCaseCollisions.Count; i++)
        {
            if (BookCaseCollisions[i] == collisionObject)
            {
                return i;
            }
        }
        return -1;
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("BookCase"))
        {
            hasCollidedWithBookCase = true;
            collidedBookCaseIndex = GetCollidedBookCaseIndex(other.gameObject);

            rb.velocity = Vector3.zero;
            rb.angularVelocity = Vector3.zero;
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
            currentHealth -= amount;

            if (isFirstTimeBelow66 && currentHealth <= 66 && currentHealth > 33)
            {
                currentHealth = 66;
                isFirstTimeBelow66 = false;
            }
            else if (isFirstTimeBelow33 && currentHealth <= 33 && currentHealth > 2)
            {
                currentHealth = 33;
                isFirstTimeBelow33 = false;
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
            UIManager_Ygg.Instance.ManageHealth(currentHealth, maxHealth);
        }
    }

    [PunRPC]
    void SetTriggerRPC(string name)
    {
        animator.SetTrigger(name);
    }
}