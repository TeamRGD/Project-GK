using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CipherDevice : MonoBehaviour
{
    public float interactionRange = 5f; // 감지 범위
    public GameObject interactionUI;
    private GameObject player;
    private Button interactButton;

    void Start()
    {
        // 상호 작용 버튼 -> 띄워야할거로 바꾸삼
        //interactButton = GameObject.Find("InteractButton").GetComponent<Button>();
        //interactButton.gameObject.SetActive(false);
        //interactButton.onClick.AddListener(OnInteractButtonClick);

        interactionUI.SetActive(false);
    }

    void Update()
    {
        if (player != null)
        {
            float distance = Vector3.Distance(player.transform.position, transform.position);
            if (distance <= interactionRange)
            {
                interactButton.gameObject.SetActive(true);
                if (Input.GetKeyDown(KeyCode.T))
                {
                    interactionUI.SetActive(true);
                }
            }
            else
            {
                interactButton.gameObject.SetActive(false);
                player = null;
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Wi") || other.CompareTag("Zard"))
        {
            player = other.gameObject;
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Wi") || other.CompareTag("Zard"))
        {
            player = null;
            interactButton.gameObject.SetActive(false);
        }
    }
}