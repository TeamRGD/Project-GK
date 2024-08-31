using System.Collections;
using UnityEngine;

public class StairMovement : MonoBehaviour
{
    bool isAppear;
    [SerializeField] private float moveDistance = 3f; // 이동할 거리
    [SerializeField] private float moveDuration = 1f; // 이동 시간

    public void Move()
    {
        Vector3 targetPosition = isAppear ? transform.position - new Vector3(moveDistance, 0, 0) : transform.position + new Vector3(moveDistance, 0, 0);
        StartCoroutine(MoveStair(targetPosition));
        isAppear = !isAppear;
    }

    private IEnumerator MoveStair(Vector3 targetPosition)
    {
        Vector3 startPosition = transform.position;
        float elapsedTime = 0f;

        while (elapsedTime < moveDuration)
        {
            transform.position = Vector3.Lerp(startPosition, targetPosition, elapsedTime / moveDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = targetPosition; // 이동 보정
    }
}
