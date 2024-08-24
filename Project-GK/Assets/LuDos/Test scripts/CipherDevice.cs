using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;
using UnityEngine.UI;

public class CipherDevice : MonoBehaviour
{
    public float interactionRange = 5f; // 상호작용 범위
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.
    [HideInInspector] public GameObject AggroTarget;

    void Update()
    {
        List<PlayerController> players_ = new List<PlayerController>(players.Keys);
        foreach (PlayerController playerController in players_) // 상호작용 하고 있는 모든 플레이어의 입력을 각각 처리할 수 있도록 함.
        {
            PhotonView PV = players[playerController];
            if (PV != null && PV.IsMine)
            {
                if (Input.GetKeyDown(KeyCode.Y))
                {
                    playerController.CursorOn();
                    UIManager_Ygg.Instance.ActivateCipher();
                }
                if (Input.GetKeyDown(KeyCode.Escape))
                {
                    playerController.CursorOff();
                    UIManager_Ygg.Instance.DeactivateCipher();
                }
            }
        }
    }

    public void InActive()
    {
        List<PlayerController> players_ = new List<PlayerController>(players.Keys);
        foreach (PlayerController playerController in players_) // 상호작용 하고 있는 모든 플레이어의 입력을 각각 처리할 수 있도록 함.
        {
            PhotonView PV = players[playerController];
            if (PV != null && PV.IsMine)
            {
                playerController.CursorOff();
                UIManager_Ygg.Instance.DeactivateCipher();
                UIManager_Player.Instance.DisableInteractionNoticeForCipher();
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard") && other.gameObject == AggroTarget)
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
                    UIManager_Player.Instance.EnableInteractionNoticeForCipher(false);
                }
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard") && other.gameObject == AggroTarget)
        {
            PlayerController playerController;
            PhotonView PV;
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (players.ContainsKey(playerController))
            {
                if (PV.IsMine) // Exit한 플레이어에게만.
                {
                    UIManager_Player.Instance.DisableInteractionNoticeForCipher();
                }
                players.Remove(playerController);
            }
        }
    }
}