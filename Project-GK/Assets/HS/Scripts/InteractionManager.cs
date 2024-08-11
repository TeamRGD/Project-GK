using UnityEngine;
using Photon.Pun;

public class InteractionManager : MonoBehaviour
{
    PlayerController playerController;
    PhotonView PV;

    private void Start()
    {
        TryGetComponent<PhotonView>(out PV);
        playerController = GetComponentInChildren<PlayerController>();
    }

    // 오픈할 UI를 찾기 위해 Tag들을 비교하는 함수.
    public void CheckForTags(RaycastHit hitInfo)
    {
        if (!PV.IsMine)
            return;

        if (hitInfo.collider.CompareTag("Note"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Debug.Log("Note 찾음");
                Puzzle1Note.ActiveUI();
            }

            if (Input.GetKeyDown(KeyCode.Escape))
            {
                Debug.Log("Note 끔");
                Puzzle1Note.DeactiveUI();
            }
        }

        if (hitInfo.collider.CompareTag("Note3"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle3Note.ActiveUI();
            }

            if (Input.GetKeyDown(KeyCode.Escape))
            {
                
            }
        }

        if (hitInfo.collider.CompareTag("Stair"))
        {
            // 이동식 발판
        }
    }
}
