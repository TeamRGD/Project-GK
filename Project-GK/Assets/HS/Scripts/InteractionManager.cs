using UnityEngine;
using Photon.Pun;

public class InteractionManager : MonoBehaviour
{
    PlayerController playerController;
    PhotonView PV;
    int isOpen = 0;

    private void Start()
    {
        TryGetComponent<PhotonView>(out PV);
        playerController = GetComponentInChildren<PlayerController>();
    }

    private void Update()
    {
        if (isOpen != 0 && Input.GetKeyDown(KeyCode.Escape))
        {
            DeactiveUI(isOpen);
        }
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
                isOpen = 1;
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

    void DeactiveUI(int index)
    {
        if (index == 1)
        {
            Puzzle1Note.DeactiveUI();
        }
        Debug.Log("UI 끔");
        isOpen = 0;
    }
}
