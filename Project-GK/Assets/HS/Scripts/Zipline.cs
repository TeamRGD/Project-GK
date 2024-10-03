using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Zipline : MonoBehaviour
{
    PhotonView PV;

    private bool player1Interacted = false; // 플레이어 1 상호작용 여부
    private bool player2Interacted = false; // 플레이어 2 상호작용 여부

    [SerializeField] private GameObject ZiplineItem;
    [SerializeField] private GameObject ZiplineOutline;

    [SerializeField] private Transform player1AttachPoint; // 플레이어 1이 매달릴 위치
    [SerializeField] private Transform player2AttachPoint; // 플레이어 2가 매달릴 위치
    
    void Start()
    {
        PV = GetComponent<PhotonView>();
    }

    public void Interact(Transform playerTransform, PlayerController playerController, PlayerToolManager playerTool)
    {
        if (ZiplineOutline.activeSelf && playerTool.GetCurrentToolIndex()==2) // 아웃라인이 켜져있을 때       
        {
            AttachZipline();
            playerTool.UseTool(2);
        }
        else if (ZiplineItem.activeSelf)
        {
            AttachPlayer(playerTransform, playerController);
        }
    }

    private void AttachZipline()
    {
        PV.RPC("AttachZiplineRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void AttachZiplineRPC()
    {
        ZiplineOutline.SetActive(false);
        ZiplineItem.SetActive(true);
    }

    // 플레이어가 오브젝트와 상호작용할 때 해당 플레이어를 오브젝트의 특정 위치로 이동시키는 함수
    private void AttachPlayer(Transform playerTransform, PlayerController playerController)
    {
        if (playerController.gameObject.CompareTag("PlayerWi") && !player1Interacted)
        {
            player1Interacted = true;
            // 플레이어 1을 지정된 위치로 이동
            AttachPlayerToPosition(playerTransform, player1AttachPoint.position, playerController);
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

    [PunRPC]
    void AttachPlayerToPoistionRPC(Transform playerTransform, Vector3 attachPosition, PlayerController playerController)
    {
        playerTransform.position = attachPosition;
        playerController.SetCanMove(false);
        playerController.SetCanLook(false);
    }

    // 플레이어를 매달릴 위치로 이동시키는 함수
    private void AttachPlayerToPosition(Transform playerTransform, Vector3 attachPosition, PlayerController playerController)
    {
        PV.RPC("AttachPlayerToPositionRPC", RpcTarget.AllBuffered, playerTransform, attachPosition, playerController);
    }



    // 컷씬 작동 및 보스전 이동 코드(동기화 필요하면 해야 됨)
    public void Move()
    {
    }
}
