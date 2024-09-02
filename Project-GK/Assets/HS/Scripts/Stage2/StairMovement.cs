using System.Collections;
using UnityEngine;

public class StairMovement : MonoBehaviour
{
    bool isAppear;
    [SerializeField] private float moveDuration = 1f; // 이동 시간
    [SerializeField] Transform destination;
    [SerializeField] Transform originTransform;

    private Coroutine currentMoveCoroutine;

    public void Move()
    {
        // 현재 이동 중인 코루틴이 있으면 중단
        if (currentMoveCoroutine != null)
        {
            transform.position = isAppear ? originTransform.position : destination.position;
            StopCoroutine(currentMoveCoroutine);
        }


        // 새로운 코루틴 시작
        isAppear = !isAppear;
        currentMoveCoroutine = StartCoroutine(MoveStair());
    }

    private IEnumerator MoveStair()
    {
        Vector3 startPosition = transform.position;
        float elapsedTime = 0f;

        if (isAppear)
        {
            while (elapsedTime < moveDuration)
            {
                transform.position = Vector3.Lerp(startPosition, destination.position, elapsedTime / moveDuration);
                elapsedTime += Time.deltaTime;
                yield return null;
            }

            transform.position = destination.position; // 이동 보정

        }
        else
        {
            while (elapsedTime < moveDuration)
            {
                transform.position = Vector3.Lerp(startPosition, originTransform.position, elapsedTime / moveDuration);
                elapsedTime += Time.deltaTime;
                yield return null;
            }
            transform.position = originTransform.position; // 이동 보정
        }

        currentMoveCoroutine = null; // 코루틴이 끝났음을 표시
    }
}
