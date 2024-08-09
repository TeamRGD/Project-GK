using UnityEngine;

public class Rope : MonoBehaviour
{
    public float moveSpeed = 5f;
    public float interactionRange = 5f; // 상호작용 가능한 거리
    public LayerMask interactableLayer; // 상호작용 가능한 레이어

    private Camera playerCamera;
    private bool isOnRope = false;
    private Vector3 ropeMoveDirection;
    private Transform ropeEndPoint;
    private Transform ropeTransform;
    private Transform originalParent;
    PlayerController playerController;

    void Start()
    {
        playerCamera = GetComponentInChildren<Camera>(); // 플레이어 카메라를 가져옴
        playerController = GetComponentInChildren<PlayerController>();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            TryInteractWithRope();
        }

        if (isOnRope)
        {
            MoveOnRope();
        }
        else
        {
            Debug.Log("움직임이 없음");
        }
    }

    void TryInteractWithRope()
    {
        Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
        if (Physics.Raycast(ray, out RaycastHit hit, interactionRange, interactableLayer))
        {
            RopeInteraction ropeInteraction = hit.collider.GetComponent<RopeInteraction>();
            if (ropeInteraction != null)
            {
                Debug.Log("1");
                ropeInteraction.InteractWithRope(this);
            }
        }
    }

    public void EnableRopeMovement(Vector3 moveDirection, Transform endPoint, Transform rope)
    {
        isOnRope = true;
        ropeMoveDirection = moveDirection;
        ropeEndPoint = endPoint;
        ropeTransform = rope;

        // 로프를 플레이어의 자식으로 설정
        originalParent = ropeTransform.parent;
        ropeTransform.parent = transform;
        playerController.CursorOn();
    }

    public void DisableRopeMovement()
    {
        Debug.Log("DisabeldRopeMovement");
        isOnRope = false;

        // 로프의 부모를 원래 부모로 복원
        if (ropeTransform != null)
        {
            ropeTransform.parent = originalParent;
            playerController.CursorOff();
        }
    }

    void MoveOnRope()
    {
        if (ropeEndPoint == null)
        {
            Debug.Log("이럴 일은 없겠지만");
            DisableRopeMovement();
            return;
        }

        Vector3 move = ropeMoveDirection * moveSpeed * Time.deltaTime;
        transform.Translate(move, Space.World);

        Debug.Log("움직이는 중");

        // 지정된 지점에 도달했는지 확인
        if (Mathf.Abs(ropeEndPoint.position.z - transform.position.z) < 0.1f)
        {
            transform.Translate(Vector3.zero);
            Debug.Log("3");
            DisableRopeMovement();
            Vector3 newPosition = transform.position;
            newPosition.z = ropeEndPoint.position.z;
            transform.position = newPosition;
        }
    }
}
