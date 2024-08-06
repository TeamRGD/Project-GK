using UnityEngine;

public class Puzzle1Frame : MonoBehaviour
{
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
                if (contactPoint.z < objectCenter.z)
                {
                    // 충돌 위치가 중앙 기준 왼쪽
                    transform.Rotate(-90, 0, 0);
                }
                else
                {
                    // 충돌 위치가 중앙 기준 오른쪽
                    transform.Rotate(90, 0, 0);
                }

                // Projectile 오브젝트 삭제
                Destroy(other.gameObject);
            }
        }
    }
}
