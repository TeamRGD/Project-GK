using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using UnityEngine.Video;

public class Zipline : MonoBehaviour
{
    PhotonView PV;

    [SerializeField] private bool player1Interacted = false; // 플레이어 1 상호작용 여부
    [SerializeField] private bool player2Interacted = false; // 플레이어 2 상호작용 여부

    [SerializeField] private GameObject ZiplineItem;
    [SerializeField] private GameObject ZiplineOutline;

    [SerializeField] private Transform player1AttachPoint; // 플레이어 1이 매달릴 위치
    [SerializeField] private Transform player2AttachPoint; // 플레이어 2가 매달릴 위치

    public GameObject cutSceneTrigger;

    void Start()
    {
        PV = GetComponent<PhotonView>();
        cutSceneTrigger.SetActive(false);
    }

    public bool Interact(Transform playerTransform, PlayerController playerController, int toolIndex)
    {
        if (ZiplineOutline.activeSelf && toolIndex==2) // 아웃라인이 켜져있을 때       
        {
            AttachZipline();
            return true;
        }
        else if (ZiplineItem.activeSelf) // Zipline 아이템 부착 후, 상호작용이 가능할 때
        {
            AttachPlayer(playerTransform, playerController);
        }
        return false;
    }
    
    private void AttachZipline() // Zipline 부착 시키는 함수
    {
        PV.RPC("AttachZiplineRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void AttachZiplineRPC()
    {
        ZiplineOutline.SetActive(false);
        ZiplineItem.SetActive(true);
    }

    private void AttachPlayer(Transform playerTransform, PlayerController playerController) // 플레이어가 오브젝트와 상호작용할 때 해당 플레이어를 오브젝트의 특정 위치로 이동시키는 함수
    {
        if (!player1Interacted)
        {
            player1Interacted = true;
            // 플레이어 1을 지정된 위치로 이동
            AttachPlayerToPosition(playerTransform, player1AttachPoint.position, playerController);
            PV.RPC("AttachPlayerRPC", RpcTarget.AllBuffered, 1);
        }
        else if (!player2Interacted)
        {
            player2Interacted = true;
            // 플레이어 2를 지정된 위치로 이동
            AttachPlayerToPosition(playerTransform, player2AttachPoint.position, playerController);
            PV.RPC("AttachPlayerRPC", RpcTarget.AllBuffered, 2);
        }

        // 두 플레이어가 모두 상호작용했는지 확인
        if (player1Interacted && player2Interacted)
        {
            Move();
        }
    }

    [PunRPC]
    void AttachPlayerRPC(int playerIndex)
    {
        if (playerIndex == 1)
        {
            player1Interacted = true;
        }
        else if (playerIndex == 2)
        {
            player2Interacted = true;
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
        playerController.SetCanMove(false);
        playerController.SetCanLook(false);
        playerTransform.position = attachPosition;
    }


    // 오브젝트가 이동하는 함수
    private void Move()
    {
        cutSceneTrigger.SetActive(true);
    }
}
