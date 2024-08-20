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

        if (hitInfo.collider.CompareTag("Note")) // 퍼즐1번 쪽지 힌트
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle1Note.ActiveUI();
                isOpen = 1;
                playerController.CursorOn();
            }
        }
         
        else if (hitInfo.collider.CompareTag("ZiplineItem")) // 퍼즐1번 이후 짚라인 아이템
        {
            if (hitInfo.collider.TryGetComponent<ToolPickup>(out ToolPickup toolPickup))
            {
                toolPickup.AddToolToPlayer();
            }
        }

        else if (hitInfo.collider.CompareTag("BookPage2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage1.ActiveUI();
                isOpen = 2;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("BookPage2_2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage2.ActiveUI();
                isOpen = 3;
                playerController.CursorOn();
            }
        }
        
        else if (hitInfo.collider.CompareTag("BookPage2_3"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage3.ActiveUI();
                isOpen = 4;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Book2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2Book.ActiveUI();
                isOpen = 5;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Note2"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2Note.ActiveUI();
                isOpen = 6;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Note3"))
        {
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle3Note.ActiveUI();
                isOpen = 7;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Rope"))
        {
            if(hitInfo.collider.TryGetComponent<TarzanSwing>(out TarzanSwing tarzanSwing))
            {
                tarzanSwing.StartCoroutine("MoveLampWithPlayer");
            }
        }

        else if (hitInfo.collider.CompareTag("Rope2"))
        {
            if (hitInfo.collider.TryGetComponent<TarzanSwing2>(out TarzanSwing2 tarzanSwing2))
            {
                tarzanSwing2.StartCoroutine("MoveLampWithPlayer");
            }
        }
    }

    public void CheckForTags2(RaycastHit hitInfo)
    {
        if (hitInfo.collider.CompareTag("Book2"))
        {
            Puzzle2Book.ActivateCipher();
            isOpen = 500;
            playerController.CursorOn();
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
        else if (index == 500)
        {
            Puzzle2Book.DeactivateCipher();
        }
        playerController.CursorOff();
        isOpen = 0;
    }
}
