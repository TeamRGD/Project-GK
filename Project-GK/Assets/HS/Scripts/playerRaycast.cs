using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class playerRaycast : MonoBehaviour
{
    public float interactionRange = 100f; // 상호작용 가능한 거리
    public LayerMask interactableLayer; // 상호작용 가능한 레이어
    public GameObject interactionUI; // 상호작용 UI
    Camera playerCamera;
    PhotonView PV;
    PlayerController playerController;

    private bool canInteract = false;
    private RaycastHit hitInfo;

    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    private void Start()
    {
        playerCamera = GetComponentInChildren<Camera>();
        playerController = GetComponentInChildren<PlayerController>();
        PV = GetComponentInChildren<PhotonView>();
    }

    private void Update()
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
                }
                if (Input.GetKeyDown(KeyCode.Y))
                {
                    playerController.CursorOff();
                    interactionUI.SetActive(false);
                }
            }
        }

        CheckForInteractable();

        if (canInteract && Input.GetKeyDown(KeyCode.T))
        {
            ToggleInteractionUI();
        }
    }

    private void CheckForInteractable()
    {
        Debug.DrawRay(transform.position, transform.forward * 10, Color.red);
        // 화면 중앙에서 Raycast 발사
        Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));

        if (Physics.Raycast(ray, out hitInfo, interactionRange, interactableLayer))
        {
            if (hitInfo.collider.CompareTag("Note"))
            {
                canInteract = true;
                return;
            }
        }
        canInteract = false;
    }

    private void ToggleInteractionUI()
    {
        if (interactionUI != null)
        {
            interactionUI.SetActive(!interactionUI.activeSelf);
        }
    }
}
