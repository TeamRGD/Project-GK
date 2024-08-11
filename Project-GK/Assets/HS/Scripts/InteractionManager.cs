using UnityEngine;
using Photon.Pun;

public class InteractionManager : MonoBehaviour
{
    PlayerController playerController;
    PhotonView PV;
    [SerializeField] int isOpen = 0;

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
                Puzzle1Note.ActiveUI();
                isOpen = 1;
            }
        }

        else if (hitInfo.collider.CompareTag("BookPage2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage1.ActiveUI();
                isOpen = 2;
            }
        }

        else if (hitInfo.collider.CompareTag("BookPage2_2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage2.ActiveUI();
                isOpen = 3;
            }
        }
        
        else if (hitInfo.collider.CompareTag("BookPage2_3"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage3.ActiveUI();
                isOpen = 4;
            }
        }

        else if (hitInfo.collider.CompareTag("Book2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2Book.ActiveUI();
                isOpen = 5;
            }
        }

        else if (hitInfo.collider.CompareTag("Note2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2Note.ActiveUI();
                isOpen = 6;
            }
        }

        else if (hitInfo.collider.CompareTag("Note3"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle3Note.ActiveUI();
                isOpen = 7;
            }
        }

        else if (hitInfo.collider.CompareTag("Stair"))
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
        else if (index == 2)
        {
            Puzzle2BookPage1.DeactiveUI();
        }
        else if (index == 3)
        {
            Puzzle2BookPage2.DeactiveUI();
        }
        else if (index==4)
        {
            Puzzle2BookPage3.DeactiveUI();
        }
        else if (index==5)
        {
            Puzzle2Book.DeactiveUI();
        }
        else if (index==6)
        {
            Puzzle2Note.DeactiveUI();
        }
        else if (index ==7)
        {
            Puzzle3Note.DeactiveUI();
        }

        isOpen = 0;
    }
}
