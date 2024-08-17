using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class InventoryItem : MonoBehaviour
{
    [SerializeField] GameObject droppedItem; // 플레이어 인벤토리에 지급될 아이템
    // gameObject로 써도 되고 아니면 플레이어 쪽에 미리 저장해둔 거 쓸 예정

    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    void OnTriggerEnter(Collider other)
    {

        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            PlayerController playerController;
            PhotonView PV;
            PlayerToolManager playerToolManager;
            playerController = GetComponentInParent<PlayerController>();
            PV = GetComponentInParent<PhotonView>();
            playerToolManager = GetComponentInParent<PlayerToolManager>();
            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
                if (PV.IsMine) // Enter한 플레이어에게만.
                {
                    // UI 추가 구문
                    // 플레이어 컨트롤러 추가 구문.
                }
            }
        }
    }
}
