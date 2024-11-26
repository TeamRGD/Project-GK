using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerSpeedSet : MonoBehaviour
{
    [SerializeField] float value;
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            if (TryGetComponent<PlayerController>(out PlayerController player))
            {
                player.SetSpeed(value);
            }
        }
    }
}
