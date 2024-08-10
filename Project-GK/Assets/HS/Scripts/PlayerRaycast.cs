using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class PlayerRaycast : MonoBehaviour
{
    public float interactionRange = 10f; // 상호작용 가능한 거리
    public LayerMask interactableLayer; // 상호작용 가능한 레이어
    Camera playerController;
    PhotonView PV;

    [SerializeField]
    InteractionManager interactionManager; // 상호작용 스크립트 총괄

    [SerializeField] GameObject cameraHolder;

    private Outline currentOutline; // 현재 활성화된 Outline 참조
    private bool canInteract = false;
    private RaycastHit hitInfo;

    private void Start()
    {
        TryGetComponent<PhotonView>(out PV);
        interactionManager = FindObjectOfType<InteractionManager>();

        if (interactionManager != null)
            Debug.Log("찾음");
    }

    private void Update()
    {
        CheckForInteractable();
    }

    private void CheckForInteractable()
    {
        if (!PV.IsMine)
            return;

        Debug.DrawRay(transform.position, transform.forward * 10, Color.red);
        // 화면 중앙에서 Raycast 발사
        Ray ray = cameraHolder.GetComponentInChildren<Camera>().ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));

        if (Physics.Raycast(ray, out hitInfo, interactionRange, interactableLayer))
        {
            // 이전에 활성화된 Outline이 있다면 비활성화
            if (currentOutline != null && currentOutline != hitInfo.collider.GetComponent<Outline>())
            {
                currentOutline.enabled = false;
                currentOutline = null;
            }

            // 새로운 오브젝트의 Outline을 활성화
            if (hitInfo.collider.TryGetComponent(out Outline outline))
            {
                outline.enabled = true;
                currentOutline = outline; // 현재 활성화된 Outline 참조 저장
                canInteract = true;

                if (Input.GetKeyDown(KeyCode.E))
                {
                    interactionManager.CheckForTags(hitInfo);
                }
            }
        }
        else
        {
            // Raycast가 아무 오브젝트에도 닿지 않을 때
            if (currentOutline != null)
            {
                currentOutline.enabled = false;
                currentOutline = null;
            }
            canInteract = false;
        }
    }
}
