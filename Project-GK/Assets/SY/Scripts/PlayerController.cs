using DG.Tweening.Plugins.Options;
using ExitGames.Client.Photon.StructWrapping;
using Photon.Pun;
using Photon.Pun.UtilityScripts;
using Photon.Realtime;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.SceneManagement;
using System.IO;
using UnityEngine.Video;

public class PlayerController : MonoBehaviour
{
    [SerializeField] GameObject cameraHolder;

    [SerializeField] float mouseSensitivity, sprintSpeed, walkSpeed, jumpForce, smoothTime;
    [SerializeField] Transform playerBody, playerHead;
    [SerializeField] float distanceFromPlayer, minDistanceFromPlayer;
    [SerializeField] LayerMask collisionMask;
    [SerializeField] Transform aim;

    float originalWalkSpeed;
    float originalSprintSpeed;

    // Component
    Rigidbody rb;
    Animator animator;
    PhotonView PV;
    PlayerAttack playerAttack;
    PlayerToolManager playerToolManager;
    PlayerStateManager playerState;

    // Bool variable    
    public bool grounded;
    bool canControl = false;
    bool canLook = false;
    bool canMove = false;
    bool isWalking = false;
    bool isSaving = true;
    bool isFreeLooking = false;
    bool isStarted = false;

    // Other variable
    Vector3 smoothMoveVelocity;
    Vector3 moveAmount;
    float verticalLookRotation;
    public float currentSaveTime = 0.0f;
    Quaternion originalCameraRotation;

    // Raycast variable
    [SerializeField] LayerMask interactableLayer;
    InteractionManager interactionManager; // 상호작용 스크립트 총괄
    Outline currentOutline; // 현재 활성화된 Outline 참조
    [SerializeField] float interactionRange = 8f; // 상호작용 가능한 거리
    bool canInteract = false;
    RaycastHit hitInfo;

    // For CutScenes
    VideoPlayer cutScenePlayer;
    private bool triggered;

    void Awake()
    {
        TryGetComponent<Rigidbody>(out rb);
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerAttack>(out playerAttack);
        TryGetComponent<PlayerToolManager>(out playerToolManager);
        TryGetComponent<Animator>(out animator);
        TryGetComponent<PlayerStateManager>(out playerState);
    }

    void Start()
    {
        // 플레이어 초기 방향 설정
        this.transform.rotation = Quaternion.Euler(0, 270, 0);

        // 자신만 제어할 수 있도록
        if (!PV.IsMine)
        {
            Destroy(GetComponentInChildren<Camera>().gameObject);
            rb.isKinematic = true;
        }
        // 마우스 커서 제거
        CursorOff();

        // Interaction
        interactionManager = FindObjectOfType<InteractionManager>();

        // Boss에 Player 배정
        if(SceneManager.GetActiveScene().name == "Yggdrasil")
        {
            GameObject boss1 = GameObject.Find("Yggdrasil"); // [임시완]
            boss1.GetComponent<Boss1>().PlayerList.Add(this.gameObject);
        }
        else if (SceneManager.GetActiveScene().name == "Vanta")
        {
            GameObject boss2 = GameObject.Find("Vanta"); // [임시완]
            boss2.GetComponent<Boss2>().PlayerList.Add(this.gameObject);
        }

        // CutScenes
        cutScenePlayer = FindObjectOfType<VideoPlayer>();
        cutScenePlayer.loopPointReached += CheckOver;

        originalWalkSpeed = walkSpeed;
        originalSprintSpeed = sprintSpeed;
        
        if (PV.IsMine)
        {
            StartCoroutine(StartTime());
        }
    }

    IEnumerator StartTime()
    {
        while (!isStarted)
        {
            PlayerManager[] playerManagers = FindObjectsOfType<PlayerManager>();
            if (playerManagers.Length == 1)
            {
                UIManager_Player.Instance.LoadingUI(false);
                playerToolManager.SetCanChange(true);
                playerAttack.SetCanAttack(true);
                canControl = true;
                canLook = true;
                canMove = true;
                isStarted = true;
                yield break;
            }
            yield return null;
        }
    }

    void Update()
    {
        if (!PV.IsMine)
            return;
        if (!playerState.GetIsAlive())
            aim.position = new Vector3(aim.position.x, -13f, aim.position.z);
        Look();

        if (canControl)
        {
            Move();
            Save();
        }
            
        //ForDebug();
    }

    public void NextScene()
    {
        PV.RPC("UI", RpcTarget.All);
        int currentSceneIndex = SceneManager.GetActiveScene().buildIndex;
        PV.RPC("LoadLevelRPC", RpcTarget.All, currentSceneIndex);
    }

    [PunRPC]
    void UI()
    {
        UIManager_Player.Instance.LoadingUI(true);
    }

    [PunRPC]
    void LoadLevelRPC(int currentSceneIndex)
    {
        PhotonNetwork.LoadLevel(currentSceneIndex + 1);
    }

    void Move()
    {
        if (canMove)
        {
            Movement();
            Jump();
        }
    }

    void Movement()
    {
        Vector3 moveDir = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical")).normalized;
        // Run
        if (Input.GetKey(KeyCode.LeftShift))
        {
            Sprint(moveDir);
        }
        // Walk
        else
        {
            Walk(moveDir);
        }
        isWalking = moveDir != Vector3.zero;
        animator.SetBool("isWalking", isWalking);
    }

    void Walk(Vector3 moveDir)
    {
        moveAmount = Vector3.SmoothDamp(moveAmount, moveDir * walkSpeed, ref smoothMoveVelocity, smoothTime);
        animator.SetBool("isRunning", false); 
    }

    void Sprint(Vector3 moveDir)
    {
        moveAmount = Vector3.SmoothDamp(moveAmount, moveDir * sprintSpeed, ref smoothMoveVelocity, smoothTime);
        animator.SetBool("isRunning", true);
    }

    void Jump()
    {
        if (Input.GetKeyDown(KeyCode.Space) && grounded)
        {
            animator.SetBool("isJumping", true);
            rb.AddForce(transform.up * jumpForce);
            SetGroundedState(false);
        }
    }

    public void SetGroundedState(bool _grounded)
    {
        if (_grounded && grounded != _grounded)
        {
            animator.SetBool("isJumping", false);
        }
        grounded = _grounded;
    }

    public void CursorOn()
    {
        if (!PV.IsMine)
            return;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        ResetRigidBody();
        animator.SetBool("isWalking", false);
        playerAttack.SetCanAttack(false);
        playerToolManager.SetCanChange(false);
        canLook = false;
        SetCanControl(false);
    }

    public void CursorOff()
    {
        if (!PV.IsMine)
            return;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        playerAttack.SetCanAttack(true);
        playerToolManager.SetCanChange(true);
        canLook = true;
        SetCanControl(true);
    }

    void ResetRigidBody()
    {
        rb.velocity = Vector3.zero;
        rb.angularVelocity = Vector3.zero;
        moveAmount = Vector3.zero;
    }
    
    private void FixedUpdate()
    {
        if (!PV.IsMine)
            return;
        rb.MovePosition(rb.position + transform.TransformDirection(moveAmount) * Time.fixedDeltaTime);
    }

    void Look()
    {
        if (Input.GetKeyDown(KeyCode.LeftAlt))
        {
            isFreeLooking = true;
            originalCameraRotation = cameraHolder.transform.localRotation;
        }
        if (Input.GetKeyUp(KeyCode.LeftAlt))
        {
            isFreeLooking = false;
            cameraHolder.transform.localRotation = originalCameraRotation;
        }
        if (canLook)
        {
            MoveCamera();
            if (!isFreeLooking)
            {
                MoveAimObject();
            }
        }
    }

    void MoveCamera() // Refactoring!!
    {
        // TPS (3인칭 시점)
        float horizontalRotation = Input.GetAxisRaw("Mouse X") * mouseSensitivity;
        float verticalRotation = Input.GetAxisRaw("Mouse Y") * mouseSensitivity;

        // Player Body Rotation
        if (!isFreeLooking && playerState.GetIsAlive())
        {
            playerBody.Rotate(Vector3.up * horizontalRotation);

            // Camera Rotation
            verticalLookRotation -= verticalRotation;
            verticalLookRotation = Mathf.Clamp(verticalLookRotation, -60f, 60f);
        }

        if (!isFreeLooking)
        {
            // Alt 키가 눌리지 않았을 때는 기본 카메라 회전
            cameraHolder.transform.localEulerAngles = Vector3.right * verticalLookRotation;
        }
        else
        {
            // Alt 키가 눌린 상태에서 카메라만 회전 (플레이어는 고정)
            cameraHolder.transform.Rotate(Vector3.up * horizontalRotation);
            cameraHolder.transform.localEulerAngles = new Vector3(verticalLookRotation, cameraHolder.transform.localEulerAngles.y, 0);
        }
        
        Vector3 playerPosition = playerHead.TransformPoint(new Vector3(-0.5f, 0, 0));
        Vector3 cameraPosition = playerPosition - cameraHolder.transform.forward * distanceFromPlayer;

        RaycastHit hit;
        // 벽 뚫기 방지
        if (Physics.Linecast(playerPosition, cameraPosition, out hit, collisionMask))
        {
            float hitDistance = Vector3.Distance(playerPosition, hit.point);
            UnityEngine.Debug.DrawLine(playerPosition, hit.point);
            if (hit.collider.CompareTag("Wall")||hit.collider.CompareTag("BookCase")||hit.collider.CompareTag("Ground")) // 벽과 충돌했을 경우
            {
                if (!isFreeLooking)
                {
                    cameraHolder.transform.position = Vector3.Lerp(cameraHolder.transform.position, hit.point + Vector3.up, 0.15f);
                }
                else
                {
                    cameraHolder.transform.position = hit.point + Vector3.up;
                }
            }
            else // 벽외의 다른 것들과 충돌했을 경우 Player와 일정 거리 두기 <- 수정이 필요한가? 고민
            {
                float clampedDistance = Mathf.Clamp(hitDistance, minDistanceFromPlayer, distanceFromPlayer);
                if (!isFreeLooking)
                {
                    cameraHolder.transform.position = Vector3.Lerp(cameraHolder.transform.position, playerPosition - cameraHolder.transform.forward * clampedDistance + Vector3.up, 0.03f); // 부드러운 움직임
                }
                else
                {
                    cameraHolder.transform.position = playerPosition - cameraHolder.transform.forward * clampedDistance + Vector3.up; // 부드러운 움직임
                }
            }
        }
        else
        {
            if (!isFreeLooking)
            {
                cameraHolder.transform.position = Vector3.Lerp(cameraHolder.transform.position, cameraPosition + Vector3.up, 0.03f); // 부드러운 움직임
            }
            else
            {
                cameraHolder.transform.position = cameraPosition + Vector3.up; // 부드러운 움직임
            }
        }
    }

    void MoveAimObject()
    {
        // aim object의 위치를 옮겨 Upper body rotation
        Ray ray = cameraHolder.GetComponentInChildren<Camera>().ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
        Vector3 desiredPosition = ray.origin + ray.direction * 10.0f;
        aim.position = Vector3.Lerp(aim.position, desiredPosition, smoothTime);

        // Interaction
        if (SceneManager.GetActiveScene().name == "S1" || SceneManager.GetActiveScene().name == "S2_Library_03" || SceneManager.GetActiveScene().name == "S3" || SceneManager.GetActiveScene().name == "S4")
            CheckForInteractable(ray);

        // Ping
        /*
        if (Input.GetKeyDown(KeyCode.Z))
        {
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                GameObject pingMarker = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "TestPing"), hit.point, Quaternion.identity);
                StartCoroutine(DestroyPing(pingMarker));
            }
        }
        */
    }

    IEnumerator DestroyPing(GameObject ping)
    {
        yield return new WaitForSeconds(3f);
        PhotonNetwork.Destroy(ping);
    }

    void CheckForInteractable(Ray ray)
    {
        Physics.queriesHitTriggers = false;
        if (Physics.Raycast(ray, out hitInfo, interactionRange, interactableLayer))
        {
            // 이전에 활성화된 Outline이 있다면 비활성화
            if (currentOutline != null && currentOutline != hitInfo.collider.GetComponent<Outline>())
            {
                currentOutline.enabled = false;
                currentOutline = null;
            }

            // 새로운 오브젝트의 Outline을 활성화
            if (hitInfo.collider.TryGetComponent(out Outline outline))
            {
                outline.enabled = true;
                currentOutline = outline; // 현재 활성화된 Outline 참조 저장
                canInteract = true;

                if (Input.GetKeyDown(KeyCode.T))
                {
                    interactionManager.CheckForTags(hitInfo);
                }

                else if (Input.GetKeyDown(KeyCode.Y))
                {
                    interactionManager.CheckForTags2(hitInfo);
                }
            }
        }
        else
        {
            // Raycast가 아무 오브젝트에도 닿지 않을 때
            if (currentOutline != null)
            {
                currentOutline.enabled = false;
                currentOutline = null;
            }
            canInteract = false;
        }
    }

    public void SetCanControl(bool value)
    {
        if (!PV.IsMine)
            return;
        canControl = value;
        if (!canControl)
        {
            ResetRigidBody();
        }
    }

    public void SetCanMove(bool value)
    {
        if (!PV.IsMine)
            return;
        canMove = value;
        if (!canMove)
        {
            ResetRigidBody();
        }
    }

    void Save()
    {
        if (Input.GetKey(KeyCode.F) && grounded)
        {
            if (!isSaving)
            {
                Collider[] hitColliders = Physics.OverlapSphere(transform.position, 2.0f); // 반경 2.0f 플레이어 주위에 있는 콜라이더 검색
                foreach (var hitCollider in hitColliders)
                {
                    if (hitCollider.CompareTag("PlayerWi")||hitCollider.CompareTag("PlayerZard")) // Player이면
                    {
                        PhotonView targetPV;
                        hitCollider.TryGetComponent<PhotonView>(out targetPV);
                        if (targetPV != null && !targetPV.IsMine)
                        {
                            PlayerStateManager targetPlayerState;
                            hitCollider.TryGetComponent<PlayerStateManager>(out targetPlayerState);
                            if (targetPlayerState != null && !targetPlayerState.GetIsAlive()) // isAlive가 false이면
                            {
                                SetSavingState(true);
                                StartCoroutine(SaveTime(0.3f));
                                StartCoroutine(SaveProcess(targetPlayerState));
                                break;
                            }
                        }
                    }
                }
            }
        }
        else
        {
            if (isSaving)
            {
                UIManager_Player.Instance.SaveUI(0);
                SetSavingState(false);
                currentSaveTime = 0.0f;
            }
        }
    }

    public void SetSavingState(bool value)
    {
        isSaving = value;
        animator.SetBool("isRescuing", value);
        animator.SetBool("trigger", value);
        SetCanMove(!value);
        playerAttack.SetCanAttack(!value);
        playerToolManager.SetCanChange(!value);
    }

    IEnumerator SaveTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("trigger", false);
    }

    IEnumerator SaveProcess(PlayerStateManager targetPlayerState)
    {
        SetIsFreeLooking(false);
        while (isSaving)
        {
            currentSaveTime += Time.deltaTime;

            if (currentSaveTime >= 6.0f)
            {
                SetSavingState(false);
                targetPlayerState.Revive();
                currentSaveTime = 0.0f;
                UIManager_Player.Instance.SaveUI(0);
                yield break;
            }
            UIManager_Player.Instance.SaveUI(currentSaveTime);
            yield return null;
        }
        SetSavingState(false);
        currentSaveTime = 0.0f;
    }

    public void SetIsSaving(bool value)
    {
        isSaving = false;
    }

    public void IAmAggro(string aggroing)
    {
        if(!PV.IsMine)
            return;
        PV.RPC("IAmAggroRPC", RpcTarget.AllBuffered, aggroing);
    }

    [PunRPC]
    void IAmAggroRPC(string aggroing)
    {
        UIManager_Player.Instance.AggroAim(aggroing);
    }

    public bool GetIsGrounded()
    {
        return grounded;
    }

    public void SetIsFreeLooking(bool value)
    {
        isFreeLooking = value;
    }

    public void SetCanLook(bool value)
    {
        canLook = value;
    }

    // 최현승 추가 코드(PushableObject.cs에 사용됨) 문제시 파괴 예정
    public void SetSpeed(float value)
    {
        if (value == -1) // 초기화 코드
        {
            walkSpeed = 3;
            sprintSpeed = 5;
        }

        else
        {
            walkSpeed = value;
            sprintSpeed = value;
        }
    }

    public void ApplySlow(float slowAmount, float duration)
    {
        StartCoroutine(SlowCoroutine(slowAmount, duration));
    }

    private IEnumerator SlowCoroutine(float slowAmount, float duration)
    {
        walkSpeed *= slowAmount;
        sprintSpeed *= slowAmount;

        yield return new WaitForSeconds(duration);

        walkSpeed = originalWalkSpeed;
        sprintSpeed = originalSprintSpeed;
    }
    void CheckOver(VideoPlayer vp)
    {
        NextScene();
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.name == "CutSceneTrigger")
        {
            rb.useGravity = false;
            playerToolManager.SetCanChange(false);
            playerAttack.SetCanAttack(false);
            canControl = false;
            canLook = false;
            canMove = false;
            isStarted = false;

            cutScenePlayer.Play();
        }
    }
}
