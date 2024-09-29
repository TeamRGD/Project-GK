using UnityEngine;
using Photon.Pun;

public class InteractionManager : MonoBehaviour
{
    PlayerController playerController;
    PlayerToolManager playerTool;
    PhotonView PV;
    Puzzle2Book puzzle2Book;
    Puzzle3Cipher puzzle3Cipher;

    [SerializeField] CameraTrigger cameraTrigger;
    [SerializeField] int isOpen = 0;

    private void Start()
    {
        TryGetComponent<PhotonView>(out PV);
        playerController = GetComponentInChildren<PlayerController>();
        playerTool = GetComponent<PlayerToolManager>();
        cameraTrigger = FindAnyObjectByType<CameraTrigger>();
        puzzle2Book = FindAnyObjectByType<Puzzle2Book>();
        puzzle3Cipher = FindAnyObjectByType<Puzzle3Cipher>();
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
                toolPickup.AddToolToPlayer(2);
                UIManager_Player.Instance.DisableInteractionNotice();
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
        
        else if (hitInfo.collider.CompareTag("StairButton"))
        {
            if (hitInfo.collider.TryGetComponent<Puzzle4Button>(out Puzzle4Button puzzle4Button))
            {
                puzzle4Button.UseButton();
            }
        }

        else if (hitInfo.collider.CompareTag("Lever"))
        {
            if (hitInfo.collider.TryGetComponent<LeverDown>(out LeverDown leverDown))
            {
                leverDown.UseLever();
            }
        }

        else if (hitInfo.collider.CompareTag("PushableStone"))
        {
            if (hitInfo.collider.TryGetComponent<PushableStone>(out PushableStone pushableStone))
            {
                pushableStone.Push(this.transform.position);
            }
        }

        else if (hitInfo.collider.CompareTag("BlockMove"))
        {
            if (hitInfo.collider.TryGetComponent<BlockMove>(out BlockMove blockMove))
            {
                blockMove.Move();
            }
        }

        else if (hitInfo.collider.CompareTag("Zipline"))
        {
            if (hitInfo.collider.TryGetComponent<Zipline>(out Zipline zipline))
            {
                zipline.Interact(this.transform, playerController, playerTool);
            }
        }
    }

    // 암호 입력의 경우 Y키 이므로 PlayerController에서 Y키로 받아오는 함수
    public void CheckForTags2(RaycastHit hitInfo)
    {
        if (hitInfo.collider.CompareTag("Book2"))
        {
            if (hitInfo.collider.TryGetComponent<Puzzle2Book>(out Puzzle2Book puzzle2Book))
            {
                playerController.CursorOn();
                playerController.SetCanMove(false);

                StartCoroutine(puzzle2Book.ActivateCipher());  // 코루틴 실행
                isOpen = 500;
            }
        }

        if (hitInfo.collider.CompareTag("Puzzle3Cipher"))
        {
            if (hitInfo.collider.TryGetComponent<Puzzle3Cipher>(out Puzzle3Cipher puzzle3Cipher))
            {
                playerController.CursorOn();
                playerController.SetCanMove(false);

                StartCoroutine(puzzle3Cipher.ActivateCipher());  // 코루틴 실행
                isOpen = 501;
            }
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
            puzzle2Book.DeactivateCipher();
            Camera camera = playerController.GetComponentInChildren<Camera>();
            if (camera != null)
            {
                cameraTrigger.InitializeCamera(camera);
            }
        }
        else if (index == 501)
        {
            puzzle3Cipher.DeactivateCipher();
            Camera camera = playerController.GetComponentInChildren<Camera>();
            if (camera != null)
            {
                cameraTrigger.InitializeCamera(camera);
            }
        }

        playerController.CursorOff();
        playerController.SetCanMove(true);

        isOpen = 0;
    }
}
