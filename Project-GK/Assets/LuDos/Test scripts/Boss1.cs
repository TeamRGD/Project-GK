using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using Unity.Properties;
using TMPro;
using UnityEngine.Animations;
using System.IO; // Finding Path in Unity Editor
using UnityEngine.UIElements;

public class Boss1 : MonoBehaviourPunCallbacks
{
    float maxHealth = 100;
    float currentHealth;

    bool isFirstTimeBelow66 = true;
    bool isFirstTimeBelow33 = true;
    bool isFirstTimeBelow2 = true;

    int successCount = 0;
    int attackCount = 0;
    [HideInInspector]
    public int collisionCount = 0;

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
    [HideInInspector]
    public bool IsCorrect = false;

    bool isInvincible = false;
    bool isAggroFixed = false;

    [HideInInspector]
    public int Code;
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

    public Material GreenMaterial;
    public Material RedMaterial;
    public Material Temporary; // 임시완
    public GameObject CipherDevice;
    private Dictionary<Transform, Material> originalMaterials = new Dictionary<Transform, Material>();
    private Dictionary<Renderer, Material> originalAreaMaterials = new Dictionary<Renderer, Material>();
    Renderer bookCaseRenderer;

    Animator animator;

    [HideInInspector]
    public List<GameObject> PlayerList;
    GameObject aggroTarget;
    Rigidbody rb;
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
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();

        // Master(Wi) PC에서만 해당 코루틴이 동작하도록. Master에서 동기화해줌.
        if (PhotonNetwork.IsMasterClient)
        {
            StartCoroutine(ExecuteBehaviorTree());
        }
    }

    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.F))
        //{
        //    TakeDamage(1);
        //    Debug.Log("Boss Health: " + currentHealth);
        //}
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
                        if (randomBasicAttackCoroutine != null)
                        {
                            StopRandomBasicAttack();
                        }
                        //animator.SetTrigger("Exit");
                        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Exit");
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
                        if (randomBasicAttackCoroutine != null)
                        {
                            StopRandomBasicAttack();
                        }
                        //animator.SetTrigger("Exit");
                        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Exit");
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
                        if (randomBasicAttackCoroutine != null)
                        {
                            StopRandomBasicAttack();
                        }
                        //animator.SetTrigger("Exit");
                        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Exit");
                        MakeInvincible();
                        yield return StartCoroutine(Roar());
                        hasExecutedInitialActions3 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern3Tree));
                }
            }
            else if (currentHealth == 0)
            {
                if (randomBasicAttackCoroutine != null)
                {
                    StopRandomBasicAttack();
                }
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
    void SetGroggyRPC() // Groggy 동기화를 위한 함수
    {
        isGroggy = true;

        animator.SetTrigger("Groggy");

        StartCoroutine(GroggyTime(10.0f));

        UIManager_Ygg.Instance.AggroEnd();
        UIManager_Ygg.Instance.DisableHint();
        UIManager_Ygg.Instance.DisableAreaNum();
        UIManager_Ygg.Instance.DisableAttackNode();
    }

    bool SetGroggy() // 동기화를 위한 수정
    {
        photonView.RPC("SetGroggyRPC", RpcTarget.AllBuffered);

        return true;
    }

    IEnumerator GroggyTime(float time)
    {
        yield return new WaitForSeconds(time);
        //animator.SetTrigger("Idle");
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Idle");
        if (!isInvincible)
        {
            currentHealth--;
        }
        isGroggy = false;
    }

    [PunRPC]
    void DieRPC() // [임시완] 죽는 거 보고 싶어서 이렇게 함.ㅎ
    {
        isInvincible = true;

        AnimatorStateInfo currentState = animator.GetCurrentAnimatorStateInfo(0);

        if (currentState.IsName("Groggy"))
        {
            animator.SetTrigger("GroggytoDeath");
        }
        else
        {
            animator.SetTrigger("Death");
        }
    }

    void Die()
    {
        photonView.RPC("DieRPC", RpcTarget.AllBuffered);
    }

    IEnumerator MakeDamageCollider(int idx, float maxLength, Vector3 position)
    {
        if (PhotonNetwork.IsMasterClient) // Master PC에서만 실행 (생성 및 Transformation은 PhotonTransformView를 통해서 동기화 됨.)
        {
            if (idx == 0)
            {   
                // PhotonNetwork를 통해 생성
                currentDamageCollider = PhotonNetwork.Instantiate(Path.Combine("Boss", "DamageCollider"+idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                float width = 0.5f;
                currentDamageCollider.transform.localScale = new Vector3(width, currentDamageCollider.transform.localScale.y, maxLength);

                yield return new WaitForSeconds(0.1f);
                
                // PhotonNetwork를 통해 삭제
                PhotonNetwork.Destroy(currentDamageCollider);
                currentDamageCollider = null;
            }
            else
            {
                // PhotonNetwork를 통해 생성
                currentDamageCollider = PhotonNetwork.Instantiate(Path.Combine("Boss", "DamageCollider"+idx.ToString()), position, Quaternion.LookRotation(transform.forward));

                currentDamageCollider.transform.localScale = new Vector3(maxLength, currentDamageCollider.transform.localScale.y, maxLength);

                yield return new WaitForSeconds(0.1f);

                // PhotonNetwork를 통해 삭제
                PhotonNetwork.Destroy(currentDamageCollider);
                currentDamageCollider = null;
            }
        }
    }

    IEnumerator ShowIndicator(int idx, float maxLength, Vector3 position, float duration)
    {
        if (PhotonNetwork.IsMasterClient) // Master PC에서만 실행 (생성 및 Transformation은 PhotonTransformView를 통해서 동기화 됨.)
        {
            position.y = 0.15f; // 임시완

            if (idx == 0)
            {
                currentIndicator = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackIndicator"+idx.ToString()), position, Quaternion.LookRotation(transform.forward));
                currentFill = PhotonNetwork.Instantiate(Path.Combine("Boss", "AttackFill"+idx.ToString()), position, Quaternion.LookRotation(transform.forward));

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
                PhotonNetwork.Destroy(currentFill);
                currentIndicator = null;
                currentFill = null;

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
                PhotonNetwork.Destroy(currentFill);
                currentIndicator = null;
                currentFill = null;

                StartCoroutine(MakeDamageCollider(idx, maxLength, position));
            }
        }
    }

    void StopRandomBasicAttack() // StopRandomBasicAttack 동기화
    {
        if (PhotonNetwork.IsMasterClient)
        {
            photonView.RPC("StopRandomBasicAttackRPC", RpcTarget.AllBuffered);
        }
    }

    [PunRPC] // 동기화를 위해 RPC 함수로 작성
    void StopRandomBasicAttackRPC()
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

    void LookAtTarget(Vector3 targetDirection)
    {
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
            transform.rotation = targetRotation;
        }
    }

    void SelectAggroTarget()
    {
        if (isAggroFixed)
        {
            aggroTarget = PlayerList[0];
        }
        else
        {
            int idx = Random.Range(0, PlayerList.Count);
            aggroTarget = PlayerList[idx];
        }
    }

    bool RandomBasicAttack() // RandomBasicAttack 동기화
    {
        if (PhotonNetwork.IsMasterClient && !isExecutingAttack)
        {
            int attackType = UnityEngine.Random.Range(1, 6);
            photonView.RPC("RandomBasicAttackRPC", RpcTarget.All, attackType);
        }
        return true;
    }

    [PunRPC] // 동기화를 위해 RPC 함수내에 로직 작성
    public void RandomBasicAttackRPC(int attackType)
    {
        if (!isExecutingAttack)
        {
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
    }

    IEnumerator LandAttackCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;
        Vector3 startPosition = transform.position;

        float jumpDuration = 0.8f;
        float elapsedTime = 0.0f;

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 25.0f, targetPosition, 2.6f));
        yield return new WaitForSeconds(1.0f);

        //animator.SetTrigger("JumpAndLand"); // 2.9s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "JumpAndLand");
        yield return new WaitForSeconds(0.8f);

        while (elapsedTime < jumpDuration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / jumpDuration;
            float height = Mathf.Sin(Mathf.PI * t) * 5.0f;
            transform.position = Vector3.Lerp(startPosition, targetPosition, t) + Vector3.up * height;
            yield return null;
        }

        transform.position = targetPosition;

        shockwaveCoroutine = StartCoroutine(CreateShockwave(4.5f, 0.1f, targetPosition, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator TwoArmSlamCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        LookAtTarget(aggroTarget.transform.position - transform.position);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 8.0f, 3.0f));
        yield return new WaitForSeconds(2.2f);
        //animator.SetTrigger("BothArmSlam"); // 1.08s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "BothArmSlam");
        yield return new WaitForSeconds(0.8f);

        yield return new WaitForSeconds(0.5f);
        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 2.0f, transform.position + transform.forward * 8.0f, 2.0f));
        yield return new WaitForSeconds(2.0f);

        isExecutingAttack = false;
    }

    IEnumerator AlternatingArmSlamCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        //animator.SetTrigger("IdletoSit"); // 0.32s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "IdletoSit");
        yield return new WaitForSeconds(1.0f);

        for (int i = 0; i < 5; i++)
        {
            LookAtTarget(aggroTarget.transform.position - transform.position);

            if (i == 4)
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.5f, transform.position + transform.forward * 8.0f - transform.right * 4.0f, 2.0f));
                yield return new WaitForSeconds(1.3f);
                //animator.SetTrigger("LeftArmHardSlam"); // 1.03s
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "LeftArmHardSlam");
                yield return new WaitForSeconds(3.0f);
            }
            else if (i == 0 || i == 2)
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 6.0f - transform.right * 4.0f, 2.0f));
                yield return new WaitForSeconds(1.3f);
                //animator.SetTrigger("LeftArmSlam"); // 1.03s
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "LeftArmSlam");
                yield return new WaitForSeconds(3.0f);
            }
            else
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 6.0f + transform.right * 4.0f, 2.0f));
                yield return new WaitForSeconds(1.3f);
                //animator.SetTrigger("RightArmSlam"); // 1.03s
                photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "RightArmSlam");
                yield return new WaitForSeconds(3.0f);
            }
        }

        isExecutingAttack = false;
    }

    IEnumerator LegStompCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        LookAtTarget(aggroTarget.transform.position - transform.position);

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 6.5f + transform.right * 2.5f, 3.0f));
        yield return new WaitForSeconds(2.3f);
        //animator.SetTrigger("LegStomp"); // 1.87s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "LegStomp");
        yield return new WaitForSeconds(0.7f);

        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 0.1f, transform.position + transform.forward * 6.5f + transform.right * 2.5f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator PalmStrikeCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        SelectAggroTarget();

        LookAtTarget(aggroTarget.transform.position - transform.position);

        indicatorCoroutine = StartCoroutine(ShowIndicator(2, 20.0f, transform.position + transform.forward * 10.0f + transform.right * 2.0f, 3.0f));
        yield return new WaitForSeconds(2.3f);
        //animator.SetTrigger("PalmStrike"); // 1.97s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "PalmStrike");
        yield return new WaitForSeconds(0.7f);

        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    // Pattern 1
    void MakeInvincible() // MakeInvincible 동기화
    {
        //animator.SetTrigger("Invincible");
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Invincible");

        photonView.RPC("MakeInvincibleRPC", RpcTarget.AllBuffered);
    }
    [PunRPC] void MakeInvincibleRPC() // 동기화를 위한 RPC 함수
    {
        isInvincible = true;
    }

    IEnumerator ArmSlamAndGetEnergy()
    {
        //animator.SetTrigger("ArmSlamAndGetEnergy"); // 1.65s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "ArmSlamAndGetEnergy");
        
        yield return new WaitForSeconds(8.0f);
    }

    [PunRPC]
    void ChangeBooksToGreenRPC(int[] bookIndices, int bookcaseIndex) // 동기화를 위한 RPC 함수
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
    void UpdateHintUI() // UI 동기화를 위한 RPC 함수
    {
        UIManager_Ygg.Instance.EnableHint();
    }
    
    bool ChangeBooksToGreen()
    {
        if (canChange1)
        {
            // Select 4 BookCase
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
                int[] bookIndicesArray = bookIndices.ToArray(); // RPC 함수에서 List 타입을 지원하지 않으므로 array로 변경해줌.
                photonView.RPC("ChangeBooksToGreenRPC", RpcTarget.AllBuffered, bookIndicesArray, bookcaseIndex); // 윗 부분은 Master PC에서 결정, 결정한 내용을 동기화
            }
        }
        photonView.RPC("UpdateHintUI", RpcTarget.AllBuffered); // UI 동기화
        return true;
    }

    [PunRPC]
    void FixAggroTargetAndDisplayRPC()
    {
        isAggroFixed = true;
        UIManager_Ygg.Instance.WhosAggro();
    }

    bool FixAggroTargetAndDisplay()
    {
        if (canChange1)
        {
            photonView.RPC("FixAggroTargetAndDisplayRPC", RpcTarget.AllBuffered);
        }
        return true;
    }

    [PunRPC]
    void ActivateCipherDevice1RPC(int idx, int Code)
    {
        if (idx == 0)
        {
            CipherDevice.SetActive(true);
            UIManager_Ygg.Instance.isCorrectedPrevCode = true;
        }
        else if (idx == 1)
        {
            UIManager_Ygg.Instance.patternCode = Code;
            Debug.Log(Code);
        }
    }

    bool ActivateCipherDevice1()
    {
        if (canChange1)
        {
            photonView.RPC("ActivateCipherDevice1RPC", RpcTarget.AllBuffered, 0, 0);

            for (int i = 0; i < 4; i++)
            {
                Code += (bookcaseIndices[i] + 1) * numBooksOfBookCase[i];
                Debug.Log("Index: " + string.Join(", ", bookcaseIndices[i] + 1));
                Debug.Log("Index: " + string.Join(", ", numBooksOfBookCase[i]));
            }
            photonView.RPC("ActivateCipherDevice1RPC", RpcTarget.AllBuffered, 1, Code);
            canChange1 = false;
        }
        return true;
    }

    bool IsCipherCorrect()
    {
        if (IsCorrect)
        {
            return true;
        }
        else
        {
            return false;
        }
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

        canChange1 = true;
        IsCorrect = false;
        successCount++;
        UIManager_Ygg.Instance.AggroEnd();
    }

    bool ResetBookLightsAndAggro()
    {
        photonView.RPC("ResetBookLightsAndAggroRPC", RpcTarget.AllBuffered);

        return true;
    }

    [PunRPC]
    void ReleaseInvincibilityAndGroggyRPC()
    {
        isInvincible = false;

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

        if (CipherDevice != null && CipherDevice.activeSelf)
        {
            CipherDevice.GetComponent<CipherDevice>().InActive();
            CipherDevice.SetActive(false);
        }
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        photonView.RPC("ReleaseInvincibilityAndGroggyRPC", RpcTarget.AllBuffered);

        return SetGroggy();
    }

    // Pattern 2
    IEnumerator JumpToCenter()
    {
        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;
        Vector3 startPosition = transform.position;

        float jumpDuration = 0.8f;
        float elapsedTime = 0.0f;

        yield return new WaitForSeconds(2.0f);

        //animator.SetTrigger("JumpAndLand"); // 2.9s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "JumpAndLand");
        yield return new WaitForSeconds(0.8f);

        while (elapsedTime < jumpDuration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / jumpDuration;
            float height = Mathf.Sin(Mathf.PI * t) * 5.0f;
            transform.position = Vector3.Lerp(startPosition, targetPosition, t) + Vector3.up * height;
            yield return null;
        }

        transform.position = targetPosition;

        yield return new WaitForSeconds(3.0f);
    }

    bool AttackAreas()
    {
        if (isExecutingAreaAttack) return false;
        int untouchedArea = Random.Range(0, 8); // Master가 정해주고 이를 상대에게 동기화 해주기 위해 동기화 함수 밖으로 빼냄. 
        StartCoroutine(AttackAreasCoroutine(untouchedArea));
        return true;
    }

    IEnumerator AttackAreasCoroutine(int untouchedArea)
    {
        isExecutingAreaAttack = true;

        attackedAreas.Add(untouchedArea);

        Vector3 targetPosition = BookCaseCollisions[untouchedArea].transform.position; // Area position (0,0,0)
        Vector3 targetDirection = transform.position - targetPosition;
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
            transform.rotation = targetRotation;
        }

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.AllBuffered, 0, untouchedArea); // 코루틴 전 Area 동기화

        yield return new WaitForSeconds(3.0f);

        //animator.SetTrigger("BothArmSlam"); // 1.08s
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "BothArmSlam");

        yield return new WaitForSeconds(1.0f);

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.AllBuffered, 2, untouchedArea); // 코루틴 후 Area 동기화

        yield return new WaitForSeconds(0.1f);

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.AllBuffered, 3, untouchedArea); // 코루틴 후 Area 동기화

        yield return new WaitForSeconds(3.0f);

        photonView.RPC("AttackAreasCoroutineRPC", RpcTarget.AllBuffered, 1, untouchedArea); // 코루틴 후 Area 동기화
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
            foreach (var entry in originalAreaMaterials)
            {
                entry.Key.material = entry.Value;
            }
            originalAreaMaterials.Clear();

            attackCount++;

            isExecutingAreaAttack = false;
        }
        else if (idx == 2)
        {
            for (int i = 0; i < Areas.Count; i++)
            {
                if (i != untouchedArea)
                {
                    Areas[i].transform.parent.tag = "DamageCollider";
                    Areas[i].tag = "DamageCollider";
                }
            }
        }

        else if (idx == 3)
        {
            for (int i = 0; i < Areas.Count; i++)
            {
                if (i != untouchedArea)
                {
                    Areas[i].transform.parent.tag = "Ground";
                    Areas[i].tag = "Ground";
                }
            }
        }
    }



    [PunRPC]
    void ActivateCipherDevice2RPC(int Code)
    {
        CipherDevice.SetActive(true);
        Debug.Log("Code: " + Code);
        UIManager_Ygg.Instance.patternCode = Code;
    }
    bool ActivateCipherDevice2()
    {
        if (canChange2)
        {
            Code = ConvertListToInt(attackedAreas);
            photonView.RPC("ActivateCipherDevice2RPC",RpcTarget.AllBuffered, Code);
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

        animator.SetTrigger("ChargeAndShockWave"); // 10s
        //photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "ChargeAndShockWave");

        yield return new WaitForSeconds(9.0f);

        StartCoroutine(CreateShockwave(10.0f, 0.1f, transform.position, 10.0f));

        photonView.RPC("ChargeAttackCoroutineRPC", RpcTarget.AllBuffered);
    }
    
    [PunRPC]
    void ChargeAttackCoroutineRPC()
    {
        attackedAreas.Clear();
        attackCount = 0;
        canChange2 = true;
        CipherDevice.SetActive(true);
    }

    IEnumerator CreateShockwave(float maxRadius, float startScale, Vector3 position, float speed)
    {
        if (PhotonNetwork.IsMasterClient) // Master PC에서만 실행
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

    // Pattern 3
    IEnumerator Roar()
    {
        //animator.SetTrigger("Roar");
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Roar");
        yield return new WaitForSeconds(4.0f);
    }
    [PunRPC]
    void DisplayBookCaseOrderRPC()
    {
        canDisplay = false;
        UIManager_Ygg.Instance.EnableAttackNode();
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            photonView.RPC("DisplayBookCaseOrderRPC", RpcTarget.AllBuffered);
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

        photonView.RPC("UpdateUI", RpcTarget.AllBuffered, 0, selectedBookCaseIndex);

        yield return new WaitForSeconds(5.0f);

        photonView.RPC("UpdateUI", RpcTarget.AllBuffered, 1, selectedBookCaseIndex);

        //animator.SetTrigger("InvincibletoDash");
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "InvincibletoDash");

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
        LookAtTarget(targetDirection);

        hasCollidedWithBookCase = false;
        collidedBookCaseIndex = -1;

        while (!hasCollidedWithBookCase)
        {
            transform.position += targetDirection * Time.deltaTime * 0.4f;
            yield return null;
        }

        if (collidedBookCaseIndex == selectedBookCaseIndex)
        {
            Debug.Log("Correct Collision");
            //animator.SetTrigger("CrashAtBookCase");
            photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "CrashAtBookCase");
            yield return new WaitForSeconds(1.0f);
            photonView.RPC("UpdateUI", RpcTarget.AllBuffered, 2, selectedBookCaseIndex);
            collisionCount++;
        }
        else
        {
            photonView.RPC("UpdateUI", RpcTarget.AllBuffered, 3, selectedBookCaseIndex);
            //animator.SetTrigger("CrashAtBookCase");
            photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "CrashAtBookCase");
            yield return new WaitForSeconds(1.0f);
            isWrongBookCase = true;
        }

        yield return moveBackCoroutine = StartCoroutine(MoveBackToCenter());

        yield return new WaitForSeconds(3.0f);
    }

    [PunRPC]
    void UpdateUI(int idx, int selectedBookCaseIndex) // UI 동기화를 위한 RPC 함수
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
        //animator.SetTrigger("StaggeringBack");
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "StaggeringBack");

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

        //animator.SetTrigger("Invincible");
        photonView.RPC("SetTriggerRPC", RpcTarget.AllBuffered, "Invincible");

        isExecutingBookAttack = false;
    }

    bool DamageAllMap()
    {
        Debug.Log("DamageAllMap"); // 임시완
        StartCoroutine(MakeDamageCollider(1, 40f, transform.position));

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