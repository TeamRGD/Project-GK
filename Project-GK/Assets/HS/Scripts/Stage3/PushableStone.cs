using System.Collections;
using UnityEngine;

public class PushableStone : MonoBehaviour
{
    [SerializeField] private float pushSpeed = 2f; // 오브젝트가 밀릴 때의 속도
    [SerializeField] float addAlpha = 0.5f; // ray 검출
    [SerializeField] float divideCastSize = 0.5f;
    private Rigidbody rb;
    private Vector3 pushDirection;
    [SerializeField] bool isBeingPushed = false;
    [SerializeField] bool isHit = false;
    private Coroutine moveCoroutine;
    private Vector3 boxCastHalfExtents; // BoxCast의 절반 크기

    void Start()
    {
        TryGetComponent<Rigidbody>(out rb);

        BoxCollider boxCollider = GetComponent<BoxCollider>();
        boxCastHalfExtents = transform.lossyScale * divideCastSize;
    }

    // 플레이어가 오브젝트를 밀 때 호출되는 함수
    public void Push(Vector3 playerPosition)
    {
        // 이동 중이라면 새로운 코루틴 실행을 방지
        if (isBeingPushed) return;

        // 플레이어의 위치를 기준으로 반대 방향으로 밀기
        Vector3 direction = (transform.position - playerPosition).normalized;

        // 4방향으로 제한
        if (Mathf.Abs(direction.x) > Mathf.Abs(direction.z))
        {
            pushDirection = direction.x > 0 ? Vector3.right : Vector3.left;
        }
        else
        {
            pushDirection = direction.z > 0 ? Vector3.forward : Vector3.back;
        }

        // Y축 이동을 막기 위해 y값을 0으로 설정
        pushDirection.y = 0;

        // 이동 중이 아니고, 이동할 수 있다면 이동 시작
        if (!CheckCollisionInDirection(pushDirection))
        {
            isBeingPushed = true;
            moveCoroutine = StartCoroutine(MoveObject());
        }
    }

    private IEnumerator MoveObject()
    {
        while (isBeingPushed)
        {
            // 이동 중에는 Raycast를 무시하도록 설정
            rb.velocity = pushDirection * pushSpeed;
            Debug.Log("MoveObject");

            // 이동할 위치를 예측하여 BoxCast를 사용하여 충돌 감지
            if (CheckCollisionInDirection(pushDirection) && !isHit)
            {
                rb.velocity = Vector3.zero;
                isBeingPushed = false;
                break;
            }

            yield return null;
        }

        // 이동이 멈추면 오브젝트의 속도를 0으로 설정하고 Raycast 상호작용 가능 상태로 변경
        rb.velocity = Vector3.zero;
        isBeingPushed = false;
    }

    // 특정 방향으로 BoxCast를 사용하여 충돌을 확인하는 함수
    private bool CheckCollisionInDirection(Vector3 direction)
    {
        float rayDistance = boxCastHalfExtents.magnitude + addAlpha; // BoxCast의 거리
        RaycastHit hit;

        // LayerMask 설정
        int layerMask = LayerMask.GetMask("Default") | LayerMask.GetMask("Interactable");

        // 방향에 따라 BoxCast 크기 설정 (left, right는 x축 기준, forward, back은 z축 기준)
        Vector3 adjustedBoxCastHalfExtents = boxCastHalfExtents;

        if (Mathf.Abs(direction.x) > Mathf.Abs(direction.z))
        {
            // 좌우로 움직일 때는 x축 크기 조정
            adjustedBoxCastHalfExtents = new Vector3(boxCastHalfExtents.x, boxCastHalfExtents.y, boxCastHalfExtents.z * 0.5f);
        }
        else
        {
            // 앞뒤로 움직일 때는 z축 크기 조정
            adjustedBoxCastHalfExtents = new Vector3(boxCastHalfExtents.x * 0.5f, boxCastHalfExtents.y, boxCastHalfExtents.z);
        }

        // BoxCast 사용 (조정된 크기를 적용)
        if (Physics.BoxCast(transform.position, adjustedBoxCastHalfExtents, direction, out hit, Quaternion.identity, rayDistance, layerMask))
        {
            Debug.Log("충돌로 인해 이동이 불가능합니다");
            isHit = true;
            return true; // 충돌이 발생함

        }
        isHit = false;
        return false; // 충돌이 발생하지 않음
    }


    void OnCollisionEnter(Collision collision)
    {
        // 다른 오브젝트와 충돌하면 멈춤
        if (isBeingPushed)
        {
            StopCoroutine(moveCoroutine);
            rb.velocity = Vector3.zero;
            isHit = true;
            isBeingPushed = false;
            Debug.Log("이동 중 다른 오브젝트와 충돌하여 움직임을 멈춥니다.");
        }
    }

    // Gizmos를 사용하여 BoxCast의 충돌 영역을 시각적으로 표시
    private void OnDrawGizmos()
    {
        if (isBeingPushed)
        {
            // BoxCast의 중심점과 회전 없이 방향을 나타내는 변수 설정
            Vector3 castCenter = transform.position + pushDirection.normalized * (boxCastHalfExtents.magnitude + 0.1f);

            // 충돌 영역 표시를 위한 색상 지정 (예: 빨간색)
            Gizmos.color = Color.red;
            RaycastHit hit;
            float rayDistance = boxCastHalfExtents.magnitude + addAlpha; // BoxCast의 거리
            int layerMask = LayerMask.GetMask("Default") | LayerMask.GetMask("Interactable"); // 복합 레이어 설정

            bool isHit = Physics.BoxCast(transform.position, boxCastHalfExtents, pushDirection, out hit, Quaternion.identity, rayDistance, layerMask);

            if (isHit)
            {
                Gizmos.DrawWireCube(castCenter, boxCastHalfExtents); // 실제 박스의 크기
                Gizmos.DrawRay(transform.position, pushDirection * rayDistance);
            }
            else
            {
                Gizmos.DrawRay(transform.position, pushDirection * 100f);
            }
        }
    }
}
