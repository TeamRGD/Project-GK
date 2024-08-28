using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerGroundCheck : MonoBehaviour
{
    PlayerController playerController;

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
    }

    bool IsTagValid(string tag)
    {
        return Enum.TryParse(tag, out TagType validTag);
    }

    /* 무한점프 문제 구간 추정
    void OnTriggerEnter(Collider other)
    {
        if (IsTagValid(other.tag))
        {
            playerController.SetGroundedState(true);
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (IsTagValid(other.tag))
        {
            playerController.SetGroundedState(false);
        }
    }

    void OnTriggerStay(Collider other)
    {
        if (IsTagValid(other.tag))
        {
            playerController.SetGroundedState(true);
        }
    }
    */
    private void OnCollisionEnter(Collision collision)
    {
        if (IsTagValid(collision.gameObject.tag))
        {
            playerController.SetGroundedState(true);
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        if (IsTagValid(collision.gameObject.tag))
        {
            playerController.SetGroundedState(false);
        }
    }

    private void OnCollisionStay(Collision collision)
    {
        if (IsTagValid(collision.gameObject.tag))
        {
            playerController.SetGroundedState(true);
        }
    }
}