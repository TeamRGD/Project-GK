using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RopeInteraction : MonoBehaviour
{
    public GameObject Root;
    public Vector3 moveDirection = Vector3.forward; // 플레이어가 이동할 방향
    public Transform endPoint; // 이동 가능한 끝 지점

    public void InteractWithRope(Rope rope)
    {
        rope.EnableRopeMovement(moveDirection, endPoint, transform);
    }
}
