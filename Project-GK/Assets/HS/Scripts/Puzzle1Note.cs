using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class Puzzle1Note : MonoBehaviour
{

    public static Puzzle1Note Instance;

    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    /*
    void Update()
    {
        List<PlayerController> players_ = new List<PlayerController>(players.Keys);
        foreach (PlayerController playerController in players_) // 상호작용 하고 있는 모든 플레이어의 입력을 각각 처리할 수 있도록 함.
        {
            PhotonView PV = players[playerController];
            if (PV != null && PV.IsMine)
            {
                // CipherDevice에서 가져온거 
                if (Input.GetKeyDown(KeyCode.T))
                {
                    playerController.CursorOn();
                    UIManager_Ygg.Instance.ActivateCipher();
                }
                if (Input.GetKeyDown(KeyCode.Y))
                {
                    playerController.CursorOff();
                    UIManager_Ygg.Instance.DeactivateCipher();
                }
                
            }
        }
    } */


    public void ActiveUI() // InteractionManager로부터 명령받아 UI 명령을 진행하는 함수.
    {
        // 포톤을 여기서 검사할까
        // UIManager_Ygg.Instance 처럼 사용하면 될 듯.
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
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
        if (other.CompareTag("Player"))
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
