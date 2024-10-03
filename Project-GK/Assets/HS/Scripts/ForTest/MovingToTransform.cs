using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingToTransform : MonoBehaviour
{
    [SerializeField] Transform Destination;

    private void OnTriggerEnter(Collider other)
    {
        other.transform.root.position = Destination.position;
    }
}
