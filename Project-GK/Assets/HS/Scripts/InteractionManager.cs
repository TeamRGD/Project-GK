using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class InteractionManager : MonoBehaviour
{
    public float interactionRange = 5f; // 상호작용 범위
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.
    public GameObject[] ObjectManagerList;

    void Update()
    {
        List<PlayerController> players_ = new List<PlayerController>(players.Keys);
        foreach (PlayerController playerController in players_) // 상호작용 하고 있는 모든 플레이어의 입력을 각각 처리할 수 있도록 함.
        {
            PhotonView PV = players[playerController];
            if (PV != null && PV.IsMine)
            {
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
    }

    // 오픈할 UI를 찾기 위해 Tag들을 비교하는 함수.
    public void CheckForTags(RaycastHit hitInfo)
    {
        if (hitInfo.collider.CompareTag("Note"))
        {
            // UIManager.SetActive(true); -> 싱글톤 쓰면 다르게 쓰겠죠?
        }
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
