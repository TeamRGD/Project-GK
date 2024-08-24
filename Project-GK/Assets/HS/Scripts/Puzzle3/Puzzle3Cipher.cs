using Photon.Pun;
using System.Collections.Generic;
using System.Collections;
using UnityEngine;

public class Puzzle3Cipher : MonoBehaviour
{
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    [SerializeField] CameraTrigger cameraTrigger;
    [SerializeField] Puzzle3 puzzle3Manager;

    public IEnumerator ActivateCipher() // 정답 입력 페이지 열기
    {
        Debug.Log("ActivateCipher 실행");
        cameraTrigger.ActivateCameraMoving();
        yield return new WaitForSeconds(cameraTrigger.transitionSpeed + cameraTrigger.waitTime);
        UIManagerInteraction.Instance.ActivateCipher(2);
        yield return null;
    }

    public static void DeactivateCipher()  // 정답 입력 페이지 닫기
    {
        UIManagerInteraction.Instance.DeactivateCipher();
    }

    public void DisableAndEnable() // 암호 정답 이후
    {
        if(puzzle3Manager.isClear)
        {
            puzzle3Manager.StartCoroutine("OnPuzzleComplete");
            gameObject.SetActive(false);
            // 이후 보스 전 이동 ㄱㄴ 한 코드
        }
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
                    UIManager_Player.Instance.EnableInteractionNoticeForCipher(false);
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
