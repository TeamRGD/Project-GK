using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TarzanSwing : MonoBehaviour
{

    public Transform player;            // 플레이어 트랜스폼
    public Transform objectToAttach;    // 플레이어가 붙을 오브젝트 트랜스폼

    private Transform originalParent;   // 플레이어의 원래 부모 트랜스폼
    private bool isAttached = false;    // 플레이어가 오브젝트에 붙어있는지 여부

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

    public void MoveLampWithPlayer()
    {
        AttachPlayer(); // 플레이어를 자식 관계로 변경
        GoStage();
        DetachPlayer(); 
    }

    private void AttachPlayer()
    {
        originalParent = player.parent; // 플레이어의 현재 부모 저장
        player.parent = objectToAttach; // 플레이어를 오브젝트의 자식으로 설정
        isAttached = true;
    }

    private void DetachPlayer()
    {
        player.parent = originalParent; // 플레이어를 원래 부모로 설정 (혹은 null로 설정)
        isAttached = false;
    }


    void ComeToPlayer() // 플레이어 쪽으로 전구 오게 함.
    {
        rotateObjectByAngle.RotateX(40f);
    }

    void GoStage() // 35도를 이미 회전해서 -35 더 가야됨.
    {
        rotateObjectByAngle.RotateX(-80f);
    }

}
