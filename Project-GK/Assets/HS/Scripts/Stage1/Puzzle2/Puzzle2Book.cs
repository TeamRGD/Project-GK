using Photon.Pun;
using System.Collections.Generic;
using System.Collections;
using UnityEngine;

public class Puzzle2Book : MonoBehaviour
{
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    PlayerController playerController;
    PhotonView PV;
    InteractionManager interactionManager;

    [SerializeField] GameObject openBook;
    [SerializeField] CameraTrigger cameraTrigger;
    [SerializeField] Puzzle2 puzzle2Manager;

    public static void ActiveUI() // 힌트페이지 열기
    {
        UIManagerInteraction.Instance.PopUpPaper(4);
    }

    public static void DeactiveUI() // 힌트페이지 닫기
    {
        UIManagerInteraction.Instance.PopDownPaper(4);
    }

    public IEnumerator ActivateCipher() // 정답 입력 페이지 열기
    {
        cameraTrigger.ActivateCameraMoving();
        playerController.SetCanLook(false);
        yield return new WaitForSeconds(cameraTrigger.transitionSpeed + cameraTrigger.waitTime);

        UIManagerInteraction.Instance.ActivateCipher(1);
        UIManager_Player.Instance.DisableInteractionNotice();
        UIManager_Player.Instance.DisableInteractionNoticeForCipher();

        yield return null;
    }

    public void DeactivateCipher()  // 정답 입력 페이지 닫기
    {
        UIManagerInteraction.Instance.DeactivateCipher();
        playerController.SetCanLook(true);
    }

    public void DisableAndEnableNew() // 암호 정답 이후
    {
        openBook.SetActive(true);
        gameObject.SetActive(false);
        puzzle2Manager.OnPuzzleComplete();
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi"))
        {
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            interactionManager = other.GetComponentInParent<InteractionManager>();

            if (interactionManager != null)
            {
                interactionManager.cameraTrigger = cameraTrigger;
            }

            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (players.ContainsKey(playerController))
            {
                players.Remove(playerController);
            }
        }
    }
}
