using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class Puzzle1Note : MonoBehaviour
{
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    public static void ActiveUI() // InteractionManager로부터 명령받아 UI 명령을 진행하는 함수.
    {
        Debug.Log("UI 켜짐");
        UIManagerInteraction.Instance.PopUpPaper(0);
    }

    public static void DeactiveUI()
    {
        Debug.Log("UI 꺼짐");
        UIManagerInteraction.Instance.PopDownPaper(0);
    }

    /*
    void OnTriggerStay(Collider other)
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
    */
}
