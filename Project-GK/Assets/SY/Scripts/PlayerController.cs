using ExitGames.Client.Photon.StructWrapping;
using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] GameObject cameraHolder; // should be edit

    [SerializeField] float mouseSensitivity, aimSpeed, sprintSpeed, walkSpeed, jumpForce, smoothTime;
    [SerializeField] Transform playerBody;
    [SerializeField] float distanceFromPlayer;
    [SerializeField] LayerMask collisionMask;
    [SerializeField] Transform aim;

    float verticalLookRotation;
    bool grounded;
    bool canMove;
    Vector3 smoothMoveVelocity;
    Vector3 moveAmount;

    Rigidbody rb;

    PhotonView PV;

    void Awake()
    {
        TryGetComponent<Rigidbody>(out rb);
        TryGetComponent<PhotonView>(out PV);
    }

    private void Start()
    {
        canMove = true;
        // 자신만 제어할 수 있도록
        if (!PV.IsMine)
        {
            Destroy(GetComponentInChildren<Camera>().gameObject);
            rb.isKinematic = true;
        }
        // 마우스 커서 제거
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
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

        verticalLookRotation -= verticalRotation;
        verticalLookRotation = Mathf.Clamp(verticalLookRotation, -90f, 90f);

        // Camera Rotation
        cameraHolder.transform.localEulerAngles = Vector3.right * verticalLookRotation;
        Vector3 cameraPosition = playerBody.position - cameraHolder.transform.forward * distanceFromPlayer;

        RaycastHit hit;
        // 벽 뚫기 방지
        if (Physics.Linecast(playerBody.position, cameraPosition, out hit, collisionMask))
        {
            cameraHolder.transform.position = hit.point;
        }
        else
        {
            cameraHolder.transform.position = cameraPosition;
        }
    }

    void MoveAimObject()
    {
        // aim object의 위치를 옮겨 Upper body rotation
        Ray ray = cameraHolder.GetComponentInChildren<Camera>().ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
        Vector3 desiredPosition = ray.origin + ray.direction * 10.0f;
        aim.position = Vector3.Lerp(aim.position, desiredPosition, aimSpeed);
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
                if (hitCollider.CompareTag("Player")) // Player이면
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
