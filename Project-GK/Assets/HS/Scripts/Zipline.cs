using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zipline : MonoBehaviour
{
    private bool player1Interacted = false; // 플레이어 1 상호작용 여부
    private bool player2Interacted = false; // 플레이어 2 상호작용 여부

    [SerializeField] private Transform player1AttachPoint; // 플레이어 1이 매달릴 위치
    [SerializeField] private Transform player2AttachPoint; // 플레이어 2가 매달릴 위치

    // 플레이어가 오브젝트와 상호작용할 때 해당 플레이어를 오브젝트의 특정 위치로 이동시키는 함수
    public void AttachPlayer(Transform playerTransform, PlayerController playerController)
    {
        if (playerController.gameObject.CompareTag("PlayerWi") && !player1Interacted)
        {
            player1Interacted = true;
            // 플레이어 1을 지정된 위치로 이동
            AttachPlayerToPosition(playerTransform, player1AttachPoint.position, playerController);
            Debug.Log("집라인 스크립트 실행");
        }
        else if (playerController.gameObject.CompareTag("PlayerZard") && !player2Interacted)
        {
            player2Interacted = true;
            // 플레이어 2를 지정된 위치로 이동
            AttachPlayerToPosition(playerTransform, player2AttachPoint.position, playerController);
        }

        // 두 플레이어가 모두 상호작용했는지 확인
        if (player1Interacted && player2Interacted)
        {
            Move();
        }
    }

    // 플레이어를 매달릴 위치로 이동시키는 함수
    private void AttachPlayerToPosition(Transform playerTransform, Vector3 attachPosition, PlayerController playerController)
    {
        // 플레이어의 위치를 지정된 attachPosition으로 이동
        playerTransform.position = attachPosition;
        playerTransform.parent = this.gameObject.transform;
        playerController.SetCanMove(false);
        // 만약 매달리는 애니메이션이 필요하다면, 애니메이션 트리거 추가 가능
        Debug.Log("아래도 실행함");
    }

    // 오브젝트가 이동하는 함수
    private void Move()
    {
        // 오브젝트 이동 로직
        Debug.Log("Both players interacted. Moving object!");
    }
}
