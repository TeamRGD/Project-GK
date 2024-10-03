using System.Collections;
using UnityEngine;
using Photon.Pun;

public class BlockMove : MonoBehaviourPunCallbacks
{
    [SerializeField] Puzzle0Manager puzzle0Manager;
    [SerializeField] private float moveDuration = 2f;
    [SerializeField] float moveXAmount;
    [SerializeField] float moveYAmount;
    [SerializeField] float moveZAmount;
    [SerializeField] AudioSource stoneSound;

    private PhotonView PV;

    void Start()
    {
        PV = GetComponent<PhotonView>();
    }

    // 네트워크 상에서 블록 이동을 호출할 때 사용
    public void Move()
    {
        PV.RPC("MoveBlock", RpcTarget.AllBuffered);
    }

    // 블록 이동을 모든 클라이언트에게 동기화
    [PunRPC]
    public void MoveBlock()
    {
        StartCoroutine(MoveYOverTime());
    }

    // y 좌표를 일정 시간 동안 이동시키는 코루틴
    IEnumerator MoveYOverTime()
    {
        // 소리 재생
        if (stoneSound != null)
        {
            stoneSound.Play();
        }

        // 레이어를 변경하여 충돌 처리 비활성화
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

        // 퍼즐의 진행 상태 갱신
        if (puzzle0Manager != null)
        {
            puzzle0Manager.PuzzleProgress();
        }

        // 레이어 재설정
        this.gameObject.layer = 0;
    }
}
