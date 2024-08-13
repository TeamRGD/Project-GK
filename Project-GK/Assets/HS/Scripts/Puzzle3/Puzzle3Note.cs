using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle3Note : MonoBehaviour
{
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    public static void ActiveUI() // InteractionManager로부터 명령받아 UI 명령을 진행하는 함수.
    {
        UIManagerInteraction.Instance.PopUpPaper(6);
    }

    public static void DeactiveUI()
    {
        UIManagerInteraction.Instance.PopDownPaper(6);
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            PlayerController playerController;
            PhotonView PV;
            other.TryGetComponent<PlayerController>(out playerController);
            playerController.TryGetComponent<PhotonView>(out PV);
            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
                if (PV.IsMine) // Enter한 플레이어에게만.
                {
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
            other.TryGetComponent<PlayerController>(out playerController);
            playerController.TryGetComponent<PhotonView>(out PV);
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
}
