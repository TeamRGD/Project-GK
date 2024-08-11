using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using Unity.Properties;

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

    Animator animator;

    [HideInInspector]
    public List<GameObject> PlayerList;
    GameObject aggroTarget;
    Rigidbody rb;
    public GameObject ShockWave;

    GameObject currentIndicator;
    GameObject currentFill;
    GameObject currentShockwave;

    BTNode pattern1Tree;
    BTNode pattern2Tree;
    BTNode pattern3Tree;

    PhotonView PV;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
    }

    void Start()
    {
        currentHealth = maxHealth;
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
        pattern1Tree = CreatePattern1Tree();
        pattern2Tree = CreatePattern2Tree();
        pattern3Tree = CreatePattern3Tree();
        StartCoroutine(ExecuteBehaviorTree());
    }

    void Update()
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
        if (Input.GetKeyDown(KeyCode.C))
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
                        animator.SetTrigger("Exit");
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
                        animator.SetTrigger("Exit");
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
                        animator.SetTrigger("Exit");
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
            new ActionNode(SelectAggroTarget),
            new ActionNode(DisplayAggroTarget),
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

    bool SetGroggy()
    {
        isGroggy = true;

        animator.SetTrigger("Groggy");

        StartCoroutine(GroggyTime(10.0f));

        UIManager_Ygg.Instance.AggroEnd();
        UIManager_Ygg.Instance.DisableHint();
        UIManager_Ygg.Instance.DisableAreaNum();
        UIManager_Ygg.Instance.DisableAttackNode();

        return true;
    }

    IEnumerator GroggyTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetTrigger("Idle");
        if (!isInvincible)
        {
            currentHealth--;
        }
        isGroggy = false;
    }

    void Die()
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

    IEnumerator ShowIndicator(int idx, float maxLength, Vector3 position, float duration)
    {
        position.y = 0.15f; // 임시완

        if (idx == 0)
        {
            currentIndicator = Instantiate(AttackIndicators[idx], position, Quaternion.LookRotation(transform.forward));
            currentFill = Instantiate(AttackFills[idx], position, Quaternion.LookRotation(transform.forward));

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

            Destroy(currentIndicator);
            Destroy(currentFill);
            currentIndicator = null;
            currentFill = null;
        }
        else
        {
            currentIndicator = Instantiate(AttackIndicators[idx], position, Quaternion.identity);
            currentFill = Instantiate(AttackFills[idx], position, Quaternion.identity);

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

            Destroy(currentIndicator);
            Destroy(currentFill);
            currentIndicator = null;
            currentFill = null;
        }
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
                Destroy(currentIndicator);
                currentIndicator = null;
            }
            if (currentFill != null)
            {
                Destroy(currentFill);
                currentFill = null;
            }
            if (currentShockwave != null)
            {
                StopCoroutine(shockwaveCoroutine);
                Destroy(currentShockwave);
                currentShockwave = null;
            }
        }
    }

    bool RandomBasicAttack()
    {
        if (!isExecutingAttack)
        {
            int attackType = UnityEngine.Random.Range(1, 6);
            // int attackType = 3;

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

        animator.SetTrigger("JumpAndLand"); // 2.9초
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

        if (isAggroFixed)
        {
            aggroTarget = PlayerList[0];
        }
        else
        {
            int idx = Random.Range(0, PlayerList.Count);
            aggroTarget = PlayerList[idx];
        }

        // 플레이어 방향으로 회전
        Vector3 targetDirection = aggroTarget.transform.position - transform.position;
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
            transform.rotation = targetRotation;
        }

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 8.0f, 3.0f));
        yield return new WaitForSeconds(2.2f);
        animator.SetTrigger("BothArmSlam"); // 1.08초
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

        if (isAggroFixed)
        {
            aggroTarget = PlayerList[0];
        }
        else
        {
            int idx = Random.Range(0, PlayerList.Count);
            aggroTarget = PlayerList[idx];
        }

        animator.SetTrigger("IdletoSit"); // 0.32초
        yield return new WaitForSeconds(1.0f);

        for (int i = 0; i < 5; i++)
        {
            // 플레이어 방향으로 회전
            Vector3 targetDirection = aggroTarget.transform.position - transform.position;
            targetDirection.y = 0;

            if (targetDirection != Vector3.zero)
            {
                Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
                transform.rotation = targetRotation;
            }

            if (i == 4)
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.5f, transform.position + transform.forward * 8.0f - transform.right * 4.0f, 2.0f));
                yield return new WaitForSeconds(1.3f);
                animator.SetTrigger("LeftArmHardSlam"); // 1.03초
                yield return new WaitForSeconds(3.0f);
            }
            else if (i == 0 || i == 2)
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 6.0f - transform.right * 4.0f, 2.0f));
                yield return new WaitForSeconds(1.3f);
                animator.SetTrigger("LeftArmSlam"); // 1.03초
                yield return new WaitForSeconds(3.0f);
            }
            else
            {
                indicatorCoroutine = StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 6.0f + transform.right * 4.0f, 2.0f));
                yield return new WaitForSeconds(1.3f);
                animator.SetTrigger("RightArmSlam"); // 1.03초
                yield return new WaitForSeconds(3.0f);
            }
        }

        isExecutingAttack = false;
    }

    IEnumerator LegStompCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        if (isAggroFixed)
        {
            aggroTarget = PlayerList[0];
        }
        else
        {
            int idx = Random.Range(0, PlayerList.Count);
            aggroTarget = PlayerList[idx];
        }

        // 플레이어 방향으로 회전
        Vector3 targetDirection = aggroTarget.transform.position - transform.position;
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
            transform.rotation = targetRotation;
        }

        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 6.5f + transform.right * 2.5f, 3.0f));
        yield return new WaitForSeconds(2.3f);
        animator.SetTrigger("LegStomp"); // 1.87초
        yield return new WaitForSeconds(0.7f);

        shockwaveCoroutine = StartCoroutine(CreateShockwave(3.5f, 0.1f, transform.position + transform.forward * 6.5f + transform.right * 2.5f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator PalmStrikeCoroutine()
    {
        isExecutingAttack = true;

        yield return new WaitForSeconds(1.0f);

        if (isAggroFixed)
        {
            aggroTarget = PlayerList[0];
        }
        else
        {
            int idx = Random.Range(0, PlayerList.Count);
            aggroTarget = PlayerList[idx];
        }

        // 플레이어 방향으로 회전
        Vector3 targetDirection = aggroTarget.transform.position - transform.position;
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
            transform.rotation = targetRotation;
        }

        // 손바닥으로 내려치기 (피격 플레이어 2초 기절) [임시완] 기절 콜라이더 태그 만들어서 하면 될듯
        indicatorCoroutine = StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 10.0f + transform.right * 2.0f, 3.0f));
        yield return new WaitForSeconds(2.3f);
        animator.SetTrigger("PalmStrike"); // 1.97초
        yield return new WaitForSeconds(0.7f);

        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    // 패턴 1
    void MakeInvincible()
    {
        animator.SetTrigger("Invincible");

        isInvincible = true;
    }

    IEnumerator ArmSlamAndGetEnergy()
    {
        animator.SetTrigger("ArmSlamAndGetEnergy"); // 1.65초

        yield return new WaitForSeconds(8.0f);
    }

    bool ChangeBooksToGreen()
    {
        if (canChange1)
        {
            // 7개의 책장 중에서 랜덤하게 4개의 책장 선택
            while (bookcaseIndices.Count < 4)
            {
                int index = Random.Range(0, 7);
                if (!bookcaseIndices.Contains(index))
                {
                    bookcaseIndices.Add(index);
                }
            }

            List<int> numberOfBooks = new List<int>();

            // 각 책장에서 몇 개의 책을 선택할건지 정함
            for (int i = 0; i < 4; i++)
            {
                int bookcaseIndex = bookcaseIndices[i];
                int childCount = BookCases[bookcaseIndex].transform.childCount;
                numberOfBooks.Add(Random.Range(1, childCount + 1));
            }

            for (int i = 0; i < bookcaseIndices.Count; i++)
            {
                int bookcaseIndex = bookcaseIndices[i];

                // 각 책장에서 책 선택
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

                // 책을 초록색으로 바꿈
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
        }
        UIManager_Ygg.Instance.EnableHint();
        return true;
    }

    bool SelectAggroTarget()
    {
        if (canChange1)
        {
            isAggroFixed = true;
        }
        return true;
    }

    bool DisplayAggroTarget()
    {
        // 어그로 아닌 플레이어 UI에 띄우기
        if (canChange1)
        {
            UIManager_Ygg.Instance.WhosAggro();
        }
        return true;
    }

    bool ActivateCipherDevice1()
    {
        if (canChange1)
        {
            CipherDevice.SetActive(true);
            UIManager_Ygg.Instance.isCorrectedPrevCode = true;

            for (int i = 0; i < 4; i++)
            {
                Code += (bookcaseIndices[i] + 1) * numBooksOfBookCase[i];
                Debug.Log("Index: " + string.Join(", ", bookcaseIndices[i] + 1));
                Debug.Log("Index: " + string.Join(", ", numBooksOfBookCase[i]));
            }
            Debug.Log(Code);
            UIManager_Ygg.Instance.patternCode = Code;

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

    bool ResetBookLightsAndAggro()
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

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
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
            CipherDevice.SetActive(false);
        }

        return SetGroggy();
    }

    // 패턴 2
    IEnumerator JumpToCenter()
    {
        Vector3 targetPosition = transform.position;
        targetPosition.y = 0.0f;
        Vector3 startPosition = transform.position;

        float jumpDuration = 0.8f;
        float elapsedTime = 0.0f;

        yield return new WaitForSeconds(2.0f);

        animator.SetTrigger("JumpAndLand"); // 2.9초
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

        StartCoroutine(AttackAreasCoroutine());
        return true;
    }

    IEnumerator AttackAreasCoroutine()
    {
        isExecutingAreaAttack = true;

        int untouchedArea = Random.Range(0, 8);
        attackedAreas.Add(untouchedArea);

        for (int i = 0; i < Areas.Count; i++)
        {
            if (i != untouchedArea)
            {
                Transform childTransform = Areas[i].transform.GetChild(0);
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

        yield return new WaitForSeconds(3.0f);

        animator.SetTrigger("BothArmSlam"); // 1.08초
        yield return new WaitForSeconds(2.0f);

        foreach (var entry in originalAreaMaterials)
        {
            entry.Key.material = entry.Value;
        }
        originalAreaMaterials.Clear();

        attackCount++;

        isExecutingAreaAttack = false;
    }
    bool ActivateCipherDevice2()
    {
        if (canChange2)
        {
            CipherDevice.SetActive(true);
            Code = ConvertListToInt(attackedAreas);
            Debug.Log("Code: " + Code);
            UIManager_Ygg.Instance.patternCode = Code;
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

        animator.SetTrigger("ChargeAndShockWave"); // 10초

        yield return new WaitForSeconds(9.0f);

        StartCoroutine(CreateShockwave(10.0f, 0.1f, transform.position, 10.0f));

        attackedAreas.Clear();
        attackCount = 0;
        canChange2 = true;
        CipherDevice.SetActive(true);
    }

    IEnumerator CreateShockwave(float maxRadius, float startScale, Vector3 position, float speed) // 최대 반지름, 초기 크기, 생성 위치, 확장 속도
    {
        position.y = 0.15f;

        currentShockwave = Instantiate(ShockWave, position, Quaternion.identity);

        float currentScale = startScale;

        while (currentScale < maxRadius)
        {
            currentScale += speed * Time.deltaTime;
            currentShockwave.transform.localScale = new Vector3(currentScale, currentShockwave.transform.localScale.y, currentScale);

            yield return null;
        }

        Destroy(currentShockwave);
        currentShockwave = null;
    }

    // 패턴 3
    IEnumerator Roar()
    {
        animator.SetTrigger("Roar");
        yield return new WaitForSeconds(4.0f);
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            UIManager_Ygg.Instance.EnableAttackNode();

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

        // 랜덤하게 책장 선택
        selectedBookCaseIndex = Random.Range(0, 7);

        // BookCase의 Light ON
        Renderer bookCaseRenderer = BookCaseCollisions[selectedBookCaseIndex].GetComponent<Renderer>();

        if (bookCaseRenderer != null)
        {
            bookCaseRenderer.material = GreenMaterial;
        }

        yield return new WaitForSeconds(5.0f); // 불 켜는 시간 & 돌진 전 대기 시간

        if (bookCaseRenderer != null)
        {
            // bookCaseRenderer.material = null;
            bookCaseRenderer.material = Temporary; // 임시완
        }

        animator.SetTrigger("InvincibletoDash");

        Vector3 targetPosition;

        if (playerIdx == 0)
        {
            targetPosition = PlayerList[playerIdx++].transform.position;
        }
        else
        {
            targetPosition = PlayerList[playerIdx--].transform.position;
        }

        // 플레이어 방향으로 회전
        Vector3 targetDirection = targetPosition - transform.position;
        targetDirection.y = 0;

        if (targetDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
            transform.rotation = targetRotation;
        }

        hasCollidedWithBookCase = false;
        collidedBookCaseIndex = -1;

        while (!hasCollidedWithBookCase)
        {
            transform.position += targetDirection * Time.deltaTime * 0.4f;
            yield return null;
        }

        // yield return new WaitForSeconds(0.1f);

        if (collidedBookCaseIndex == selectedBookCaseIndex)
        {
            Debug.Log("Correct Collision");
            animator.SetTrigger("CrashAtBookCase");
            UIManager_Ygg.Instance.NodeDeduction();
            collisionCount++;
        }
        else
        {
            UIManager_Ygg.Instance.ResetAttackNode();
            animator.SetTrigger("CrashAtBookCase");
            isWrongBookCase = true;
        }

        yield return moveBackCoroutine = StartCoroutine(MoveBackToCenter());

        yield return new WaitForSeconds(3.0f);

        // isExecutingBookAttack = false;
    }

    IEnumerator MoveBackToCenter()
    {
        animator.SetTrigger("StaggeringBack");

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

        animator.SetTrigger("Invincible");

        isExecutingBookAttack = false;
    }

    bool DamageAllMap()
    {
        // 맵 전역 데미지 [임시완]
        Debug.Log("DamageAllMap");

        canDisplay = true;
        collisionCount = 0;
        isWrongBookCase = false;

        return true;
    }

    // 그 외
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

    // Photon Code (아커만 김수연의 영역 전개)
    public bool GetIsInvincible()
    {
        return isInvincible;
    }

    public void TakeDamage(float amount)
    {
        PV.RPC("TakeDamageRPC", RpcTarget.All, amount);
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

}