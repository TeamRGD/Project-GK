using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerGroundCheck : MonoBehaviour
{
    PlayerController playerController;
    Rigidbody rb;

    // Tag 열거형 정의
    public enum TagType
    {
        Ground,
        Others,
        Stair,
        Note,
        Note2,
        BookPage2,
        Book2,
        Note3,
        BookPage2_2,
        BookPage2_3,
        Puzzle3Cipher
    }

    void Awake()
    {
        playerController = GetComponentInParent<PlayerController>();
        TryGetComponent<Rigidbody>(out rb);
    }

    bool IsTagValid(string tag)
    {
        return Enum.TryParse(tag, out TagType validTag);
    }
    
    void OnCollisionEnter(Collision collision)
    {
        if(IsTagValid(collision.transform.tag))
        {
            playerController.SetGroundedState(true);
            Debug.Log(collision.gameObject);

            rb.velocity = Vector3.zero;
            rb.angularVelocity = Vector3.zero;
        }
    }
}