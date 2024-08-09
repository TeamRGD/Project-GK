using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TarzanSwing : MonoBehaviour
{
    public GameObject rotationPoint;
    RotateObjectByAngle rotateObjectByAngle;

    private void Start()
    {
        rotateObjectByAngle = GetComponentInParent<RotateObjectByAngle>();
    }

    
    private void Update() // 아래 ComeToPlayer, GoStage 발동 조건만 잘 해주면 될 듯.
    {
        if(Input.GetKeyDown(KeyCode.E))
        {
            ComeToPlayer();
        }

        if (Input.GetKeyDown(KeyCode.Q))
        {
            GoStage();
        }
    }

    void ComeToPlayer() // 플레이어 쪽으로 전구 오게 함.
    {
        rotateObjectByAngle.RotateX(35f);
    }

    void GoStage() // 35도를 이미 회전해서 -35 더 가야됨.
    {
        rotateObjectByAngle.RotateX(-70f);
    }
}
