using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class DieCollider : MonoBehaviour
{
    [SerializeField] Transform RetryPosition; // 부활 위치

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            Transform playerTransform = other.transform.root;
            playerTransform.position = RetryPosition.position;
        }
    }
}
