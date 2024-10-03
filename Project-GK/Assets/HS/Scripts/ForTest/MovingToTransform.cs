using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingToTransform : MonoBehaviour
{
    [SerializeField] Transform Destination;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
            other.transform.root.position = Destination.position;
    }
}