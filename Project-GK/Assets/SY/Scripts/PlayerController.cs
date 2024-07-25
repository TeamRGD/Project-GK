using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] GameObject cameraHolder; // should be edit

    [SerializeField] float mouseSensitivity, sprintSpeed, walkSpeed, jumpForce, smoothTime;
    [SerializeField] Transform playerBody;
    [SerializeField] float distanceFromPlayer;
    [SerializeField] LayerMask collisionMask;
    [SerializeField] PlayerStateManager playerStateManager;

    float verticalLookRotation;
    bool grounded;
    bool isAlive;
    Vector3 smoothMoveVelocity;
    Vector3 moveAmount;

    Rigidbody rb;

    PhotonView PV;

    void Awake()
    {
        TryGetComponent<Rigidbody>(out rb);
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerStateManager>(out playerStateManager);
    }

    private void Start()
    {
        isAlive = true;
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
        if (!PV.IsMine || !isAlive)
            return;
        Look();
        Move();
        Jump();
    }

    void Look()
    {
        // TPS (3인칭 시점)
        float horizontalRotation = Input.GetAxisRaw("Mouse X") * mouseSensitivity;
        float verticalRotation = Input.GetAxisRaw("Mouse Y") * mouseSensitivity;

        playerBody.Rotate(Vector3.up * horizontalRotation);

        verticalLookRotation -= verticalRotation;
        verticalLookRotation = Mathf.Clamp(verticalLookRotation, -90f, 90f);

        cameraHolder.transform.localEulerAngles = Vector3.right * verticalLookRotation;

        Vector3 cameraPosition = playerBody.position - cameraHolder.transform.forward * distanceFromPlayer;

        // 벽 뚫기 방지
        RaycastHit hit;
        if (Physics.Linecast(playerBody.position, cameraPosition, out hit, collisionMask))
        {
            cameraHolder.transform.position = hit.point;
        }
        else
        {
            cameraHolder.transform.position = cameraPosition;
        }
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


    void FixedUpdate()
    {
        if (!PV.IsMine)
            return;
        rb.MovePosition(rb.position + transform.TransformDirection(moveAmount) * Time.fixedDeltaTime);
    }

    public void SetIsAlive(bool value)
    {
        if (!PV.IsMine)
            return;
        PV.RPC("SetIsAliveRPC", RpcTarget.AllBuffered, value);
    }

    [PunRPC]
    void SetIsAliveRPC(bool value)
    {
        isAlive = value;
    }
}
