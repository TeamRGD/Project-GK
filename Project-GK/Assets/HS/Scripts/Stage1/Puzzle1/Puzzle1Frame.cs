using UnityEngine;

public class Puzzle1Frame : MonoBehaviour
{
    [SerializeField] Puzzle1 puzzleManager;
    private int currentRotationAngle = 0; // float 계산이 이상해서 int 추가 상하좌우(0231)

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
                if (contactPoint.x < objectCenter.x)
                {
                    // 충돌 위치가 중앙 기준 왼쪽
                    transform.Rotate(-90, 0, 0);
                    CalculateCurrentAngle(-1);
                }
                else
                {
                    // 충돌 위치가 중앙 기준 오른쪽
                    transform.Rotate(90, 0, 0);
                    CalculateCurrentAngle(1);
                }

                // Projectile 오브젝트 삭제
                Destroy(other.gameObject);

                puzzleManager.CheckPuzzleCompletion();
            }
        }
    }

    void CalculateCurrentAngle(int angle) // mod4 연산을 위한 함수.
    {
        currentRotationAngle += angle;
        if(currentRotationAngle < 0) // 위쪽에서 좌측으로 움직이면 -1 = 3임.
        {
            currentRotationAngle = 3;
        }
        currentRotationAngle %= 4; // 좌측에서 우측으로 이동하면 0으로 바꿔줌.
    }

    public bool HasReachedTargetRotation(int targetDirection) // 현재 각도가 파라미터와 동일한지 반환함. 
    {
        return (currentRotationAngle == targetDirection);
    }
}