using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerGroundCheck : MonoBehaviour
{
    PlayerController playerController;

    void Awake()
    {
        playerController = GetComponentInParent<PlayerController>();
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Ground"))
        {
            playerController.SetGroundedState(true);
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Ground"))
        {
            playerController.SetGroundedState(false);   
        }
    }

    void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Ground"))
        {
            playerController.SetGroundedState(true);
        }
    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Ground"))
        {
            playerController.SetGroundedState(true);
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.CompareTag("Ground"))
        {
            playerController.SetGroundedState(false);
        }
    }

    private void OnCollisionStay(Collision collision)
    {
        if (collision.gameObject.CompareTag("Ground"))
        {
            playerController.SetGroundedState(true);
        }
    }
}
