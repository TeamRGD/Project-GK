using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerGroundCheck : MonoBehaviour
{
    PlayerController playerController;
    Rigidbody rb;

    [SerializeField] float jumpVelocityValue = 0.05f; // 너무 높으면 공중에서도 점프하고 너무 낮으면 땅에서 점프가 안 됨

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

    private void Update()
    {
        // Rigidbody의 Y축 속도를 통해 플레이어가 착지 상태인지 추가로 확인
        if (rb.velocity.y > jumpVelocityValue || rb.velocity.y < -jumpVelocityValue)
        {
            playerController.SetJumpState(true);
        }
        else
        {
            playerController.SetJumpState(false);
        }
    }

    bool IsTagValid(string tag)
    {
        return Enum.TryParse(tag, out TagType validTag);
    }
    
    private void OnCollisionEnter(Collision collision)
    {
        playerController.SetGroundedState(true);
        Debug.Log(collision.gameObject);
    }
}