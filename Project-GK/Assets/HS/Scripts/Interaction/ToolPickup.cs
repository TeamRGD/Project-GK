using Photon.Pun;
using UnityEngine;
using System.Collections.Generic;

public class ToolPickup : MonoBehaviour
{
    public GameObject toolPrefab; // 픽업할 도구 프리팹
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.
    PlayerToolManager playerToolManager;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            PlayerController playerController;
            PhotonView PV;
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
                if (PV.IsMine) // Enter한 플레이어에게만.
                {
                    playerToolManager = playerController.GetComponentInParent<PlayerToolManager>();
                    UIManager_Player.Instance.EnableInteractionNotice();
                }
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            PlayerController playerController;
            PhotonView PV;
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (players.ContainsKey(playerController))
            {
                if (PV.IsMine) // Exit한 플레이어에게만.
                {
                    UIManager_Player.Instance.DisableInteractionNotice();
                }
                players.Remove(playerController);
            }
        }
    }

    public void AddToolToPlayer()
    {
        if (playerToolManager != null)
        {
            playerToolManager.AddTool(toolPrefab);
            gameObject.SetActive(false);
        }
    }
}
