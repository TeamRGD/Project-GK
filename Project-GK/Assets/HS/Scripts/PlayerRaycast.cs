using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class PlayerRaycast : MonoBehaviour
{
    public float interactionRange = 10f; // 상호작용 가능한 거리
    public LayerMask interactableLayer; // 상호작용 가능한 레이어
    Camera playerController;

    [SerializeField]
    InteractionManager interactionManager; // 상호작용 스크립트 총괄

    [SerializeField] GameObject cameraHolder;

    private bool canInteract = false;
    private RaycastHit hitInfo;

    private void Start()
    {

    }

    private void Update()
    {
        CheckForInteractable();
    }

    private void CheckForInteractable()
    {
        Debug.DrawRay(transform.position, transform.forward * 10, Color.red);
        // 화면 중앙에서 Raycast 발사
        Ray ray = cameraHolder.GetComponentInChildren<Camera>().ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));

        if (Physics.Raycast(ray, out hitInfo, interactionRange, interactableLayer))
        {
            if (Input.GetKeyDown(KeyCode.E))
                interactionManager.CheckForTags(hitInfo);
        }
        canInteract = false;
    }
}
