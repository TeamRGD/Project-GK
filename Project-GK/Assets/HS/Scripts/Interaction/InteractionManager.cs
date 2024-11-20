using UnityEngine;
using Photon.Pun;

public class InteractionManager : MonoBehaviour
{
    [SerializeField] PlayerController playerController;
    [SerializeField] PlayerToolManager playerTool;
    [SerializeField] PhotonView PV;
    Puzzle2Book puzzle2Book;
    Puzzle3Cipher puzzle3Cipher;

    [SerializeField] CameraTrigger cameraTrigger;
    [SerializeField] int isOpen = 0;

    private void Start()
    {
        playerController = GetComponent<PlayerController>();
        PV = GetComponent<PhotonView>();
        playerTool = GetComponent<PlayerToolManager>();
        cameraTrigger = FindAnyObjectByType<CameraTrigger>();
        puzzle2Book = FindAnyObjectByType<Puzzle2Book>();
        puzzle3Cipher = FindAnyObjectByType<Puzzle3Cipher>();
    }

    private void Update()
    {
        if (PV.IsMine)
            Debug.Log(playerController);
        if (isOpen != 0 && Input.GetKeyDown(KeyCode.Escape))
        {
            DeactiveUI(isOpen);
        }
    }

    // 오픈할 UI를 찾기 위해 Tag들을 비교하는 함수.
    public void CheckForTags(RaycastHit hitInfo)
    {
        if (hitInfo.collider.CompareTag("Note")) // 퍼즐1번 쪽지 힌트
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle1Note.ActiveUI();
                isOpen = 1;
                playerController.CursorOn();
            }
        }
         
        else if (hitInfo.collider.CompareTag("ZiplineItem")) // 퍼즐1번 이후 짚라인 아이템
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<ToolPickup>(out ToolPickup toolPickup))
                {
                    toolPickup.AddToolToPlayer(2);
                    UIManager_Player.Instance.DisableInteractionNotice();
                }
            }
        }

        else if (hitInfo.collider.CompareTag("Stair")) // S2에서 미는 계단
        {
            ShowHoldKeyInteractionUI();
        }

        else if (hitInfo.collider.CompareTag("BookPage2"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage1.ActiveUI();
                isOpen = 2;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("BookPage2_2"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage2.ActiveUI();
                isOpen = 3;
                playerController.CursorOn();
            }
        }
        
        else if (hitInfo.collider.CompareTag("BookPage2_3"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2BookPage3.ActiveUI();
                isOpen = 4;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Note2"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2Note.ActiveUI();
                isOpen = 6;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Note3"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle3Note.ActiveUI();
                isOpen = 7;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Rope"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<TarzanSwing>(out TarzanSwing tarzanSwing))
                {
                    tarzanSwing.StartCoroutine("MoveLampWithPlayer");
                }
            }
        }

        else if (hitInfo.collider.CompareTag("Rope2"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<TarzanSwing2>(out TarzanSwing2 tarzanSwing2))
                {
                    tarzanSwing2.StartCoroutine("MoveLampWithPlayer");
                }
            }
        }
        
        else if (hitInfo.collider.CompareTag("StairButton"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<Puzzle4Button>(out Puzzle4Button puzzle4Button))
                {
                    puzzle4Button.UseButton();
                }
            }
        }

        else if (hitInfo.collider.CompareTag("Lever"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<LeverDown>(out LeverDown leverDown))
                {
                    leverDown.UseLever();
                }
            }
        }

        else if (hitInfo.collider.CompareTag("PushableStone"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<PushableStone>(out PushableStone pushableStone))
                {
                    pushableStone.Push(this.transform.position);
                }
            }
        }

        else if (hitInfo.collider.CompareTag("BlockMove"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<BlockMove>(out BlockMove blockMove))
                {
                    blockMove.Move();
                }
            }
        }

        else if (hitInfo.collider.CompareTag("Zipline"))
        {
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.T))
            {
                if (hitInfo.collider.TryGetComponent<Zipline>(out Zipline zipline))
                {
                    if (zipline.Interact(this.transform, playerController, playerTool.GetCurrentToolIndex()))
                    {
                        playerTool.UseTool(2);
                    }
                }
            }
        }

        else if (hitInfo.collider.CompareTag("Book2")) // S2 - Puzzle2 암호 입력 책
        {
            ShowPressChipherUI(true);
            ShowPressKeyInteractionUI();
            if (Input.GetKeyDown(KeyCode.Y))
            {
                if (hitInfo.collider.TryGetComponent<Puzzle2Book>(out Puzzle2Book puzzle2Book))
                {
                    Debug.Log(playerController);
                    playerController.CursorOn();
                    playerController.SetCanMove(false);

                    StartCoroutine(puzzle2Book.ActivateCipher());  // 코루틴 실행
                    isOpen = 500;
                }
            }
            if (Input.GetKeyDown(KeyCode.T))
            {
                Puzzle2Book.ActiveUI();
                isOpen = 5;
                playerController.CursorOn();
            }
        }

        else if (hitInfo.collider.CompareTag("Puzzle3Cipher"))
        {
            ShowPressChipherUI(false);
            if (Input.GetKeyDown(KeyCode.Y))
            {
                if (hitInfo.collider.TryGetComponent<Puzzle3Cipher>(out Puzzle3Cipher puzzle3Cipher))
                {
                    playerController.CursorOn();
                    playerController.SetCanMove(false);

                    if (playerController != null)
                        StartCoroutine(puzzle3Cipher.ActivateCipher(playerController));  // 코루틴 실행
                    isOpen = 501;
                }
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


    void ShowPressKeyInteractionUI()
    {
        UIManager_Player.Instance.EnableInteractionNotice();
    }


    void ShowHoldKeyInteractionUI()
    {
        UIManager_Player.Instance.EnableInteractionNoticeForHold();
    }

    void ShowPressChipherUI(bool _bool)
    {
        UIManager_Player.Instance.EnableInteractionNoticeForCipher(_bool);
    }


    public void HideAllUI()
    {
        UIManager_Player.Instance.DisableInteractionNotice();
        UIManager_Player.Instance.DisableInteractionNoticeForHold();
        UIManager_Player.Instance.DisableInteractionNoticeForCipher();
    }
}
