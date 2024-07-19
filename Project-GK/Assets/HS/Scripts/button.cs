using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class button : MonoBehaviour
{
    [SerializeField]
    GameObject uiPanel;

    private void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            uiPanel.SetActive(true);
        }
    }
}