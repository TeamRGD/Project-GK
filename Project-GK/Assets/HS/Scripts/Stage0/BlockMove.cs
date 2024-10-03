using System.Collections;
using UnityEngine;

public class BlockMove : MonoBehaviour
{

    [SerializeField] Puzzle0Manager puzzle0Manager;
    [SerializeField] private float moveDuration = 2f;
    [SerializeField] float moveXAmount;
    [SerializeField] float moveYAmount;
    [SerializeField] float moveZAmount;
    [SerializeField] AudioSource stoneSound;

    public void Move()
    {
        StartCoroutine(MoveYOverTime());
    }

    // y 좌표를 일정 시간 동안 이동시키는 코루틴
    IEnumerator MoveYOverTime()
    {
        stoneSound.Play();
        this.gameObject.layer = 0;
        // 시작 위치 저장
        Vector3 startPosition = transform.position;
        // 목표 위치 설정
        Vector3 targetPosition = new Vector3(startPosition.x + moveXAmount, startPosition.y + moveYAmount, startPosition.z + moveZAmount);

        // 시간을 누적할 변수
        float elapsedTime = 0f;

        // moveDuration 동안 이동
        while (elapsedTime < moveDuration)
        {
            // 시간에 따라 부드럽게 위치를 변경
            transform.position = Vector3.Lerp(startPosition, targetPosition, elapsedTime / moveDuration);

            // 경과 시간 갱신
            elapsedTime += Time.deltaTime;

            // 다음 프레임까지 대기
            yield return null;
        }

        // 정확하게 목표 위치로 설정
        transform.position = targetPosition;

        puzzle0Manager.PuzzleProgress();
        this.gameObject.layer = 0;
        //stoneSound.Stop(); // 쓰면 중간에 끊겨서 어색해짐
    }
}
