using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Drawer : MonoBehaviour
{
    [SerializeField] float moveSpeed = 2f;
    [SerializeField] bool isOpen = false;

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Projectile_Zard") ||
            other.gameObject.CompareTag("Projectile_Wi"))
        {
            Collider ownCollider;
            if (TryGetComponent<Collider>(out ownCollider))
            {
                // 충돌 지점의 월드 좌표
                Vector3 contactPoint = other.ClosestPoint(transform.position);
                // 충돌 오브젝트의 중앙 좌표
                Vector3 objectCenter = ownCollider.bounds.center;

                // 충돌 위치에 따른 회전 방향 결정
                if (isOpen)
                {
                    transform.Translate(new Vector3(1,0,0));
                }
                else
                {
                    transform.Translate(new Vector3(-1, 0, 0));
                }

                // Projectile 오브젝트 삭제
                Destroy(other.gameObject);
            }
        }
    }
}
