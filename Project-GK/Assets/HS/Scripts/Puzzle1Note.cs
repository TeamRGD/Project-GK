using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle1Note : MonoBehaviour
{
    public float interactionRange = 5f; // 상호작용 가능한 거리
    public LayerMask interactableLayer; // 상호작용 가능한 레이어
    public GameObject interactionUI; // 상호작용 UI

    private bool canInteract = false;

    private void Update()
    {
        CheckForInteractable();

        if (canInteract && Input.GetKeyDown(KeyCode.T))
        {
            ToggleInteractionUI();
        }
    }

    private void CheckForInteractable()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, interactionRange, interactableLayer))
        {
            if (hit.collider.CompareTag("Player"))
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
