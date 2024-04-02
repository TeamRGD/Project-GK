using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Switch : MonoBehaviour
{
    public GameObject wall;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
            wall.gameObject.SetActive(false);
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
            wall.gameObject.SetActive(true);
    }

    void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
            wall.gameObject.SetActive(false);
    }
}
