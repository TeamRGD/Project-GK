using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetCollider : MonoBehaviour
{
    [SerializeField] GameObject wall;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            wall.SetActive(true);
        }

    }
    private void OnTriggerExit(Collider other)
        {
            if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
            {
                wall.SetActive(false);
            }
        }
    }
