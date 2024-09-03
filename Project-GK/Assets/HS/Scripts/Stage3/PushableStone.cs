using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PushableStone : MonoBehaviour
{
    [SerializeField] private float pushSpeed = 2f; // 오브젝트가 밀릴 때의 속도
    Rigidbody rb;
    bool isPlayerNearby = false;
    bool isBeingPushed = false;
    Vector3 pushDirection;

    void Start()
    {
        TryGetComponent<Rigidbody>(out rb);
    }

    void Update()
    {
        if (isBeingPushed)
        {
            // 오브젝트가 플레이어의 반대 방향으로 이동
            rb.velocity = pushDirection * pushSpeed;
        }
        else
        {
            // 오브젝트가 멈추도록 설정
            rb.velocity = Vector3.zero;
        }
    }

    // 플레이어가 오브젝트를 밀 때 호출되는 함수
    public void Push(Vector3 playerPosition)
    {
        // 플레이어의 위치를 기준으로 반대 방향으로 밀기
        pushDirection = (transform.position - playerPosition).normalized;
        pushDirection.y = 0;
        isBeingPushed = true;
    }

    void OnCollisionEnter(Collision collision)
    {
        // 다른 오브젝트와 충돌하면 멈춤
        if (collision.gameObject.CompareTag("Stone"))
        {
            isBeingPushed = false;
        }
    }

    void OnCollisionExit(Collision collision)
    {
        // 충돌이 끝나면 다시 밀릴 수 있도록 설정 (필요한 경우)
        if (collision.gameObject.CompareTag("Stone"))
        {
            isBeingPushed = false; // 필요한 경우 true로 설정하여 계속 밀리도록 변경 가능
        }
    }
}
