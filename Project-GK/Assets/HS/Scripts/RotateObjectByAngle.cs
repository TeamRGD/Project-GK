using UnityEngine;
using System.Collections;

public class RotateObjectByAngle : MonoBehaviour
{
    // 회전 속도 (도/초)
    public float rotationSpeed = 30f;

    // 코루틴 함수로 일정 시간 동안 회전
    public void RotateX(float targetAngle)
    {
        StartCoroutine(RotateXOverTime(targetAngle));
    }

    // 특정 각도에 도달할 때까지 회전하는 코루틴
    private IEnumerator RotateXOverTime(float targetAngle)
    {
        Vector3 currentRotation = transform.rotation.eulerAngles;
        float initialAngle = currentRotation.x;
        float desiredAngle = initialAngle + targetAngle;

        while (Mathf.Abs(desiredAngle - currentRotation.x) > 0.01f)
        {
            // 현재 회전 각도를 회전 속도에 따라 업데이트
            float angleToRotate = rotationSpeed * Time.deltaTime;
            currentRotation.x = Mathf.MoveTowards(currentRotation.x, desiredAngle, angleToRotate);

            // 회전 적용
            transform.rotation = Quaternion.Euler(currentRotation);

            yield return null; // 다음 프레임까지 대기
        }

        // 회전이 끝났을 때 정확한 각도로 보정
        currentRotation.x = desiredAngle;
        transform.rotation = Quaternion.Euler(currentRotation);
    }
}
