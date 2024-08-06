using ExitGames.Client.Photon.StructWrapping;
using Photon.Pun;
using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] GameObject cameraHolder; // should be edit

    [SerializeField] float mouseSensitivity, sprintSpeed, walkSpeed, jumpForce, smoothTime;
    [SerializeField] Transform playerBody;
    [SerializeField] float distanceFromPlayer, minDistanceFromPlayer;
    [SerializeField] LayerMask collisionMask;
    [SerializeField] Transform aim;

    float verticalLookRotation;
    bool grounded;
    bool canMove;
    Vector3 smoothMoveVelocity;
    Vector3 moveAmount;

    Rigidbody rb;

    PhotonView PV;
    PlayerAttack playerAttack;
    PlayerToolManager playerToolManager;

    void Awake()
    {
        TryGetComponent<Rigidbody>(out rb);
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerAttack>(out playerAttack);
        TryGetComponent<PlayerToolManager>(out playerToolManager);
        GameObject boss1 = GameObject.Find("Boss1_Ygg_V1");
        UnityEngine.Debug.Log(boss1);
        boss1.GetComponent<Boss1>().playerList.Add(this.gameObject);
    }

    private void Start()
    {
        //UnityEngine.Debug.Log(this.gameObject);
        canMove = true;
        // 자신만 제어할 수 있도록
        if (!PV.IsMine)
        {
            Destroy(GetComponentInChildren<Camera>().gameObject);
            rb.isKinematic = true;
        }
        // 마우스 커서 제거
        CursorOff();
    }

    public void CursorOn()
    {
        if (!PV.IsMine)
            return;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        PV.RPC("CursorOnRPC", RpcTarget.AllBuffered);
        rb.velocity = Vector3.zero;
        rb.angularVelocity = Vector3.zero;
    }

    [PunRPC]
    void CursorOnRPC()
    {
        moveAmount = Vector3.zero;
        playerAttack.SetCanAttack(false);
        playerToolManager.SetCanChange(false);
        SetCanMove(false);
    }

    public void CursorOff()
    {
        if (!PV.IsMine)
            return;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        PV.RPC("CursorOffRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void CursorOffRPC()
    {
        playerAttack.SetCanAttack(true);
        playerToolManager.SetCanChange(true);
        SetCanMove(true);
    }

    private void Update()
    {
        // 자신만 제어할 수 있도록, 기절 상태가 아닌 경우에
        if (!PV.IsMine || !canMove)
            return;
        Look();
        Move();
        Jump();
        SavePlayer();
    }
    
    private void FixedUpdate()
    {
        if (!PV.IsMine)
            return;
        rb.MovePosition(rb.position + transform.TransformDirection(moveAmount) * Time.fixedDeltaTime);
    }

    void Look()
    {
        MoveCamera();
        MoveAimObject();
    }

    void MoveCamera()
    {
        // TPS (3인칭 시점)
        float horizontalRotation = Input.GetAxisRaw("Mouse X") * mouseSensitivity;
        float verticalRotation = Input.GetAxisRaw("Mouse Y") * mouseSensitivity;

        // Player Body Rotation
        playerBody.Rotate(Vector3.up * horizontalRotation);

        // Camera Rotation
        verticalLookRotation -= verticalRotation;
        verticalLookRotation = Mathf.Clamp(verticalLookRotation, -60f, 60f);
        cameraHolder.transform.localEulerAngles = Vector3.right * verticalLookRotation;
        Vector3 cameraPosition = playerBody.position - cameraHolder.transform.forward * distanceFromPlayer;

        RaycastHit hit;
        // 벽 뚫기 방지
        if (Physics.Linecast(playerBody.position, cameraPosition, out hit, collisionMask))
        {
            float hitDistance = Vector3.Distance(playerBody.position, hit.point);
            if (hitDistance < minDistanceFromPlayer && hit.collider.CompareTag("Wall")) // 벽과 충돌했을 경우
            {
                cameraHolder.transform.position = hit.point + cameraHolder.transform.forward * 0.1f;
            }
            else // Player와 일정 거리 두기
            {
                float clampedDistance = Mathf.Clamp(hitDistance, minDistanceFromPlayer, distanceFromPlayer);
                cameraHolder.transform.position = Vector3.Lerp(cameraHolder.transform.position, playerBody.position - cameraHolder.transform.forward * clampedDistance, 0.03f); // 부드러운 움직임
            }
        }
        else
        {
            cameraHolder.transform.position = Vector3.Lerp(cameraHolder.transform.position, cameraPosition, 0.03f); // 부드러운 움직임
        }
    }

    void MoveAimObject()
    {
        // aim object의 위치를 옮겨 Upper body rotation
        Ray ray = cameraHolder.GetComponentInChildren<Camera>().ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
        Vector3 desiredPosition = ray.origin + ray.direction * 10.0f;
        aim.position = Vector3.Lerp(aim.position, desiredPosition, smoothTime);
    }

    void Move()
    {
        Vector3 moveDir = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical")).normalized;
        moveAmount = Vector3.SmoothDamp(moveAmount, moveDir * (Input.GetKey(KeyCode.LeftShift) ? sprintSpeed : walkSpeed), ref smoothMoveVelocity, smoothTime);
    }

    void Jump()
    {
        if (Input.GetKeyDown(KeyCode.Space) && grounded)
        {
            rb.AddForce(transform.up * jumpForce);
        }
    }

    public void SetGroundedState(bool _grounded)
    {
        grounded = _grounded;
    }

    public void SetCanMove(bool value)
    {
        if (!PV.IsMine)
            return;
        PV.RPC("SetCanMoveRPC", RpcTarget.AllBuffered, value);
    }

    [PunRPC]
    void SetCanMoveRPC(bool value)
    {
        canMove = value;
    }

    void SavePlayer()
    {
        if (Input.GetKeyDown(KeyCode.F))
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
                            Save(targetPlayerState);
                            break;
                        }
                    }
                }
            }
        }
    }

    [PunRPC]
    void Save(PlayerStateManager targetPlayerState)
    {
        targetPlayerState.Revive();
    }
}
