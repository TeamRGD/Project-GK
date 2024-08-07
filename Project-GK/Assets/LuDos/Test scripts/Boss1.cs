using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;

public class Boss1 : MonoBehaviour
{
    public int maxHealth = 100;
    int currentHealth;

    int successCount = 0;
    int attackCount = 0;
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

    Coroutine chargeAttackCoroutine;
    Coroutine moveBackCoroutine;

    bool canChange1 = true;
    bool canChange2 = true;
    bool canDisplay = true;
    public bool IsCorrect = false;

    bool isInvincible = false;
    bool isAggroFixed = false;

    public int Code;
    int playerIdx = 0;

    public List<GameObject> AttackIndicators;
    public List<GameObject> AttackFills;

    List<int> bookcaseIndices = new List<int>();
    List<int> numberOfBooks = new List<int>();
    List<int> attackedAreas = new List<int>();
    public List<GameObject> BookCases; // 7개의 책장의 위치를 담아둔 리스트
    public List<GameObject> Areas;

    // Animator animator;

    public List<GameObject> PlayerList;
    GameObject aggroTarget;
    public GameObject ChangedStaff;
    Rigidbody rb;
    public GameObject Pattern3ShockWave;

    BTNode pattern1Tree;
    BTNode pattern2Tree;
    BTNode pattern3Tree;

    void Start()
    {
        currentHealth = maxHealth;

        // animator = GetComponent<Animator>();
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
        if (Input.GetKeyDown(KeyCode.O))
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
            if (currentHealth > 66)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions1)
                    {
                        MakeInvincible();
                        yield return StartCoroutine(LeftArmSlam());
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
                        }

                        MakeInvincible();
                        yield return StartCoroutine(JumpToCenter());
                        hasExecutedInitialActions2 = true;
                    }

                    StartCoroutine(ExecutePattern(pattern2Tree));
                }
            }
            else if (currentHealth > 0)
            {
                if (!isExecutingPattern)
                {
                    if (!hasExecutedInitialActions3)
                    {
                        if (isGroggy)
                        {
                            StopCoroutine(ExecutePattern(pattern2Tree));
                            isGroggy = false;
                        }

                        MakeInvincible();
                        Scream();
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
            new ActionNode(ChangeBooksToGreen),
            new ActionNode(SelectAggroTarget),
            new ActionNode(ChangeStaffToRed),
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

    public void TakeDamage(int amount)
    {
        if (!isInvincible)
        {
            currentHealth -= amount;
            if (currentHealth < 0)
            {
                currentHealth = 0;
            }
        }
    }

    bool SetGroggy()
    {
        isGroggy = true;

        // animator.SetTrigger("Groggy");

        return true;
    }

    void Die()
    {
        Debug.Log("Die");

        isInvincible = true;

        //animator.SetTrigger("Die");
    }

    IEnumerator ShowIndicator(int idx, float maxLength, Vector3 position, float duration)
    {
        if (idx == 0)
        {
            GameObject indicator = Instantiate(AttackIndicators[idx], position, Quaternion.identity);
            GameObject fill = Instantiate(AttackFills[idx], position, Quaternion.identity);

            float width = 0.3f;
            indicator.transform.localScale = new Vector3(width, indicator.transform.localScale.y, maxLength);
            fill.transform.localScale = new Vector3(width, fill.transform.localScale.y, 0);

            float elapsedTime = 0f;
            while (elapsedTime < duration)
            {
                elapsedTime += Time.deltaTime;
                float t = elapsedTime / duration;

                float currentLength = Mathf.Lerp(0, maxLength, t);
                fill.transform.localScale = new Vector3(width, fill.transform.localScale.y, currentLength);

                yield return null;
            }

            Destroy(indicator);
            Destroy(fill);
        }
        else
        {
            GameObject indicator = Instantiate(AttackIndicators[idx], position, Quaternion.identity);
            GameObject fill = Instantiate(AttackFills[idx], position, Quaternion.identity);

            indicator.transform.localScale = new Vector3(maxLength, indicator.transform.localScale.y, maxLength);
            fill.transform.localScale = Vector3.zero;

            float elapsedTime = 0f;
            while (elapsedTime < duration)
            {
                elapsedTime += Time.deltaTime;
                float t = elapsedTime / duration;

                float currentScale = Mathf.Lerp(0, maxLength, t);
                fill.transform.localScale = new Vector3(currentScale, fill.transform.localScale.y, currentScale);

                yield return null;
            }

            Destroy(indicator);
            Destroy(fill);
        }
    }

    bool RandomBasicAttack()
    {
        // 어그로 대상 지정 필요
        if (!isExecutingAttack)
        {
            Debug.Log("RandomBasicAttack");

            if (isAggroFixed)
            {
                // 한놈만 팬다
                aggroTarget = PlayerList[0];
            }
            else
            {
                // 랜덤하게 둘 중 선택
                int idx = Random.Range(0, PlayerList.Count);
                aggroTarget = PlayerList[idx];
            }

            int attackType = UnityEngine.Random.Range(1, 6);
            // int attackType = 1;

            switch (attackType)
            {
                case 1:
                    StartCoroutine(LandAttackCoroutine());
                    break;
                case 2:
                    StartCoroutine(TwoArmSlamCoroutine());
                    break;
                case 3:
                    StartCoroutine(AlternatingArmSlamCoroutine());
                    break;
                case 4:
                    StartCoroutine(LegStompCoroutine());
                    break;
                case 5:
                    StartCoroutine(PalmStrikeCoroutine());
                    break;
            }
        }
        return true;
    }

    IEnumerator LandAttackCoroutine()
    {
        isExecutingAttack = true;

        transform.LookAt(aggroTarget.transform.position);

        Vector3 targetPosition = aggroTarget.transform.position;
        float jumpSpeed = 5.0f;

        Vector3 startPosition = transform.position;
        float distance = Vector3.Distance(startPosition, targetPosition);
        float totalTime = distance / jumpSpeed;
        float elapsedTime = 0.0f;

        StartCoroutine(ShowIndicator(1, 27.0f, targetPosition, totalTime)); // 위치, 크기 조정 필요 [임시완]

        while (elapsedTime < totalTime)
        {
            float t = elapsedTime / totalTime;
            float height = Mathf.Sin(Mathf.PI * t) * 10.0f;
            transform.position = Vector3.Lerp(startPosition, targetPosition, t) + Vector3.up * height;
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        // yield return new WaitForSeconds(totalTime);

        // 최종 위치 설정
        transform.position = targetPosition;

        StartCoroutine(CreateShockwave(5.0f, 0.1f, targetPosition, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator TwoArmSlamCoroutine()
    {
        isExecutingAttack = true;

        transform.LookAt(aggroTarget.transform.position);

        // animator.SetTrigger("Shockwave"); // 두팔로 내려치기
        StartCoroutine(ShowIndicator(1, 27.0f, transform.position + transform.forward * 2.0f, 3.0f)); // 위치, 크기 조정 필요 [임시완]
        yield return new WaitForSeconds(3.0f);

        // 충격파
        StartCoroutine(CreateShockwave(5.0f, 3.0f, transform.position + transform.forward * 2.0f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator AlternatingArmSlamCoroutine()
    {
        isExecutingAttack = true;

        // 각 팔을 번갈아 들어 내리치며 타격 (총 5번) [임시완]
        for (int i = 0; i < 5; i++)
        {
            transform.LookAt(aggroTarget.transform.position);

            if (i == 4)
            {
                // animator.SetTrigger("StrongArmSlam");
                StartCoroutine(ShowIndicator(0, 1.0f, transform.position + transform.forward * 5.0f - transform.right * 2.0f, 2.0f)); // 크기, 위치 조정 필요 [임시완]
                yield return new WaitForSeconds(2.0f);
            }
            else if (i == 0 || i == 2)
            {
                // animator.SetTrigger("LeftArmSlam");
                StartCoroutine(ShowIndicator(0, 0.6f, transform.position + transform.forward * 4.0f - transform.right * 2.0f, 2.0f)); // 크기, 위치 조정 필요 [임시완]
                yield return new WaitForSeconds(2.0f);
            }
            else
            {
                // animator.SetTrigger("RightArmSlam");
                StartCoroutine(ShowIndicator(0, 0.6f, transform.position + transform.forward * 4.0f + transform.right * 2.0f, 2.0f)); // 크기, 위치 조정 필요 [임시완]
                yield return new WaitForSeconds(2.0f);
            }

            yield return new WaitForSeconds(1.0f);
        }

        isExecutingAttack = false;
    }

    IEnumerator LegStompCoroutine()
    {
        isExecutingAttack = true;

        transform.LookAt(aggroTarget.transform.position);

        // animator.SetTrigger("LegStomp");

        // 범위 타격 + 충격파
        StartCoroutine(ShowIndicator(1, 27.0f, transform.position + transform.forward * 2.0f, 3.0f)); // 위치, 크기 조정 필요 [임시완]
        yield return new WaitForSeconds(3.0f);

        // 충격파
        StartCoroutine(CreateShockwave(5.0f, 0.1f, transform.position + transform.forward * 2.0f, 2.0f));
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    IEnumerator PalmStrikeCoroutine()
    {
        isExecutingAttack = true;

        transform.LookAt(aggroTarget.transform.position);

        // animator.SetTrigger("PalmStrike");

        yield return new WaitForSeconds(2.0f);

        // 손바닥으로 내려치기 (피격 플레이어 2초 기절) [임시완] 기절 콜라이더 태그 만들어서 하면 될듯
        StartCoroutine(ShowIndicator(1, 20.0f, transform.position + transform.forward * 1.0f, 3.0f)); // 위치, 크기 조정 필요 [임시완]
        yield return new WaitForSeconds(3.0f);

        isExecutingAttack = false;
    }

    // 패턴 1
    void MakeInvincible()
    {
        Debug.Log("MakeInvincible");

        isInvincible = true;
    }

    IEnumerator LeftArmSlam()
    {
        isExecutingPattern = true;

        Debug.Log("LeftArmSlam");

        // animator.SetTrigger("LeftArmSlam");

        yield return new WaitForSeconds(3.0f);

        isExecutingPattern = true;
    }

    bool ChangeBooksToGreen()
    {
        if (canChange1)
        {
            Debug.Log("ChangeBooksToGreen");

            // 7개의 책장 중에서 랜덤하게 4개의 책장 선택
            while (bookcaseIndices.Count < 4)
            {
                int index = Random.Range(0, 7);
                if (!bookcaseIndices.Contains(index))
                {
                    bookcaseIndices.Add(index);
                }
            }
            Debug.Log("Selected Bookcase Indices: " + string.Join(", ", bookcaseIndices));

            // 각 책장에서 몇 개의 책을 선택할건지 정함
            for (int i = 0; i < 4; i++)
            {
                int numBooks = Random.Range(1, 11);
                numberOfBooks.Add(numBooks);
            }
            Debug.Log("Number of Books to Select: " + string.Join(", ", numberOfBooks));

            for (int i = 0; i < bookcaseIndices.Count; i++)
            {
                int bookcaseIndex = bookcaseIndices[i];
                int numBooks = numberOfBooks[i];
                Debug.Log("Bookcase " + bookcaseIndex + ": Selecting " + numBooks + " books");

                // 각 책장에서 책 선택
                List<int> bookIndices = new List<int>();
                while (bookIndices.Count < numBooks)
                {
                    int bookIndex = Random.Range(0, 10);
                    if (!bookIndices.Contains(bookIndex))
                    {
                        bookIndices.Add(bookIndex);
                    }
                }
                Debug.Log("Bookcase " + bookcaseIndex + ": Selected Book Indices: " + string.Join(", ", bookIndices));

                // 책을 초록색으로 바꿈 [임시완]
                //foreach (int bookIndex in bookIndices)
                //{
                //    Transform book = BookCases[bookcaseIndex].transform.GetChild(bookIndex);
                //    book.gameObject.SetActive(true);
                //    // Debug.Log("Bookcase " + bookcaseIndex + ": Book " + bookIndex + " light turned on.");
                //}
            }
        }
        return true;
    }

    bool SelectAggroTarget()
    {
        if (canChange1)
        {
            Debug.Log("SelectAggroTarget");

            isAggroFixed = true;
        }
        return true;
    }

    bool ChangeStaffToRed()
    {
        // 어그로 아닌 플레이어 지팡이 붉은색으로 변경
        if (canChange1)
        {
            Debug.Log("ChangeStaffToRed");

            // ChangedStaff.SetActive(true); [임시완] 이거 하나 끄고 하나 켜는 방식으로 할까
        }
        return true;
    }

    bool ActivateCipherDevice1()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange1)
        {
            Debug.Log("ActivateCipherDevice1");

            for(int i = 0; i < 4; i++)
            {
                Code += (bookcaseIndices[i] + 1) * numberOfBooks[i];
            }
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
        Debug.Log("ResetBookLightsAndAggro");

        // 책 불빛 끄기 [임시완]
        //foreach (GameObject bookCase in BookCases)
        //{
        //    foreach (Transform book in bookCase.transform)
        //    {
        //        if (book.gameObject.activeSelf)
        //        {
        //            book.gameObject.SetActive(false);
        //            // Debug.Log("Book " + book.name + " light turned off.");
        //        }
        //    }
        //}

        canChange1 = true;
        IsCorrect = false;
        successCount++;

        return true;
    }

    bool ReleaseInvincibilityAndGroggy()
    {
        // 무적 상태 해제 및 그로기

        Debug.Log("ReleaseInvincibilityAndGroggy");

        isInvincible = false;

        if (!canChange2)
        {
            Debug.Log("StopCoroutine");
            StopCoroutine(chargeAttackCoroutine);
            canChange2 = true;
        }
        if (!canDisplay)
        {
            Debug.Log("StopCoroutine");
            StopCoroutine(moveBackCoroutine);
            canDisplay = true;
        }

        return SetGroggy();
    }

    // 패턴 2
    IEnumerator JumpToCenter()
    {
        isExecutingPattern = true;

        Vector3 targetPosition = new Vector3(0.0f, 0.0f, 9.0f); // [임시완]
        float jumpSpeed = 15f;

        Vector3 startPosition = transform.position;
        float distance = Vector3.Distance(startPosition, targetPosition);
        float totalTime = distance / jumpSpeed;
        float elapsedTime = 0.0f;

        while (elapsedTime < totalTime)
        {
            float t = elapsedTime / totalTime;
            float height = Mathf.Sin(Mathf.PI * t) * 10.0f; // 점프 높이
            transform.position = Vector3.Lerp(startPosition, targetPosition, t) + Vector3.up * height;
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // 최종 위치 설정
        transform.position = targetPosition;

        isExecutingPattern = false;
    }

    bool AttackAreas()
    {
        if (isExecutingAreaAttack) return false;

        Debug.Log("AttackAreas");
        Debug.Log("attackCount: " + attackCount);

        StartCoroutine(AttackAreasCoroutine());
        return true;
    }

    IEnumerator AttackAreasCoroutine()
    {
        isExecutingAreaAttack = true;

        // animator.SetTrigger("RaiseArms");
        Debug.Log("RaiseArms...");

        int untouchedArea = Random.Range(0, 8);

        attackedAreas.Add(untouchedArea); // ActivateCipherDevice 에서 암호 입력 장치로 전달
        // Debug.Log("Untouched Area: " + untouchedArea);

        for (int i = 0; i < Areas.Count; i++) // [임시완]
        {
            if (i != untouchedArea)
            {
                Areas[i].SetActive(true);
            }
        }

        yield return new WaitForSeconds(4.0f);

        // animator.SetTrigger("AttackAreas");

        for (int i = 0; i < Areas.Count; i++)
        {
            Areas[i].SetActive(false);
        }

        attackCount++;

        isExecutingAreaAttack = false;
    }
    bool ActivateCipherDevice2()
    {
        // 중앙에 암호 입력 장치 활성화
        if (canChange2)
        {
            Code = ConvertListToInt(attackedAreas);
            Debug.Log("Code: " + Code);
            Debug.Log("Attacked Areas: " + string.Join(", ", attackedAreas));
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
        // 10초간 기 모으기
        // animator.SetTrigger("Charge");
        Debug.Log("Charge...");

        yield return new WaitForSeconds(10.0f);

        // 기 발사
        // animator.SetTrigger("ReleaseCharge");
        Debug.Log("ReleaseCharge");

        StartCoroutine(CreateShockwave(10.0f, 0.1f, transform.position, 5.0f));

        attackedAreas.Clear();
        attackCount = 0;
        canChange2 = true;
    }

    IEnumerator CreateShockwave(float maxRadius, float startScale, Vector3 position, float speed) // 최대 반지름, 초기 크기, 확장 속도
    {
        GameObject shockwave = Instantiate(Pattern3ShockWave, position, Quaternion.identity);

        float currentScale = startScale;

        while (currentScale < maxRadius)
        {
            currentScale += speed * Time.deltaTime;
            shockwave.transform.localScale = new Vector3(currentScale, shockwave.transform.localScale.y, currentScale);

            yield return null;
        }

        Destroy(shockwave);
    }


    // 패턴 3
    void Scream()
    {
        Debug.Log("Scream");
        // animator.SetTrigger("Scream");
    }
    bool DisplayBookCaseOrder()
    {
        if (canDisplay)
        {
            // UI에 책장의 개수만큼 원 띄우기

            Debug.Log("DisplayBookCaseOrder");

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
        Debug.Log("Book Case Index: " + selectedBookCaseIndex);

        // BookCase의 Light ON [임시완]
        // BookCases[selectedBookCaseIndex].SetActive(true);

        yield return new WaitForSeconds(5.0f); // 불 켜는 시간

        // Player 방향으로 돌진
        Debug.Log("Attack BookCase");
        // animator.SetTrigger("AttackBookCase");

        Vector3 targetPosition;

        if (playerIdx == 0)
        {
            targetPosition = PlayerList[playerIdx++].transform.position;
        }
        else
        {
            targetPosition = PlayerList[playerIdx--].transform.position;
        }

        Vector3 direction = (targetPosition - transform.position).normalized;
        transform.LookAt(targetPosition);

        hasCollidedWithBookCase = false;
        collidedBookCaseIndex = -1;

        while (!hasCollidedWithBookCase)
        {
            transform.position += direction * Time.deltaTime * 10.0f;
            yield return null;
        }

        if (collidedBookCaseIndex == selectedBookCaseIndex)
        {
            Debug.Log("Correct Collision");
            collisionCount++;
        }
        else
        {
            isWrongBookCase = true;
        }

        yield return moveBackCoroutine = StartCoroutine(MoveBackToCenter());

        isExecutingBookAttack = false;
    }

    IEnumerator MoveBackToCenter()
    {
        Debug.Log("MoveBackToCenter");

        Vector3 startPosition = transform.position;
        Vector3 centerPosition = new Vector3(0.0f, 0.0f, 9.0f); // [임시완]
        float moveDuration = 5.0f;
        float elapsedTime = 0.0f;

        while (elapsedTime < moveDuration)
        {
            transform.position = Vector3.Lerp(startPosition, centerPosition, elapsedTime / moveDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = centerPosition;
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
        for (int i = 0; i < BookCases.Count; i++)
        {
            if (BookCases[i] == collisionObject)
            {
                return i;
            }
        }
        return -1;
    }
    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("BookCase"))
        {
            hasCollidedWithBookCase = true;
            collidedBookCaseIndex = GetCollidedBookCaseIndex(collision.gameObject);

            rb.velocity = Vector3.zero;
            rb.angularVelocity = Vector3.zero;
        }
    }
}