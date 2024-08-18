using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle2Book : MonoBehaviour
{
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    [SerializeField] GameObject openBook;
    public static bool isClear = false;

    public static void ActiveUI() // 힌트페이지 열기
    {
        UIManagerInteraction.Instance.PopUpPaper(4);
    }

    public static void DeactiveUI() // 힌트페이지 닫기
    {
        UIManagerInteraction.Instance.PopDownPaper(4);
    }

    public static void ActivateCipher() // 정답 입력 페이지 열기
    {
        UIManagerInteraction.Instance.ActivateCipher(1);
    }

    public static void DeactivateCipher()  // 정답 입력 페이지 닫기
    {
        UIManagerInteraction.Instance.DeactivateCipher();
    }

    public void DisableAndEnableNew() // 암호 정답 이후
    {
        openBook.SetActive(true);
        gameObject.SetActive(false);
    }

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
}
