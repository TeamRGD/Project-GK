using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetJump : MonoBehaviour
{
    [SerializeField] float jumpForce;
    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            other.transform.root.TryGetComponent<PlayerController>(out PlayerController playerController);
            if (playerController != null)
            {
                playerController.SetJumpForce(jumpForce);
            }
        }
    }
}
