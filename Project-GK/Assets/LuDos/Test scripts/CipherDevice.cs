using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CipherDevice : MonoBehaviour
{
    public float interactionRange = 5f; // 감지 범위
    private GameObject player;


    void Start()
    {

    }

    void Update()
    {
        if (player != null)
        {
            //float distance = Vector3.Distance(player.transform.position, transform.position);
            //if (distance <= interactionRange)
            //{
            if (Input.GetKeyDown(KeyCode.T))
            {
                player.GetComponent<PlayerController>().CursorOn();
                UIManager_Ygg.Instance.ActivateCipher();
            }
            if (Input.GetKeyDown(KeyCode.Y))
            {
                player.GetComponent<PlayerController>().CursorOff();
                UIManager_Ygg.Instance.DeactivateCipher();
            }
            //}
            //else
            //{
            //    player = null;
            //}
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            UIManager_Ygg.Instance.EnableInteractionNotice();
            player = other.gameObject;
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            UIManager_Ygg.Instance.DisableInteractionNotice();
            player = null;
        }
    }
}