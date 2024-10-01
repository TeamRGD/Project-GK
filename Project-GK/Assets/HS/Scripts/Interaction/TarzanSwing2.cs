using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class TarzanSwing2 : MonoBehaviour
{
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.
    PhotonView PV;
    PlayerController playerController;

    [SerializeField] Transform player;            // 플레이어 트랜스폼
    [SerializeField] Transform objectToAttach;    // 플레이어가 붙을 오브젝트 트랜스폼
    [SerializeField] AudioSource ropeSound;

    private Transform originalParent;   // 플레이어의 원래 부모 트랜스폼 (부모가 없을 경우 null일 수 있음)
    RotateObjectByAngle rotateObjectByAngle;

    private void Start()
    {
        rotateObjectByAngle = GetComponentInParent<RotateObjectByAngle>();
    }

    public IEnumerator MoveLampWithPlayer()
    {
        ropeSound.Play();
        AttachPlayer();  // 플레이어를 자식 관계로 변경
        GoStage();
        yield return new WaitForSeconds(3.0f);
        DetachPlayer();  // 플레이어를 다시 원래 위치로 해제
        ropeSound.Stop();
    }


    private void AttachPlayer()
    {
        // 플레이어의 현재 부모가 있는지 확인하고 저장
        if (player.parent != null)
        {
            originalParent = player.parent; // 부모가 있을 경우 저장
        }
        else
        {
            originalParent = null; // 부모가 없으면 null로 설정
        }
        // 플레이어를 오브젝트의 자식으로 설정
        playerController.SetCanMove(false);
        player.parent = objectToAttach;
        player.localPosition = new Vector3(0f, -4f, 0f);
        player.localRotation = Quaternion.Euler(15f, 0f, 0f);
    }

    private void DetachPlayer()
    {
        // 원래 부모가 null이 아닌 경우에만 원래 부모로 되돌림
        if (originalParent != null)
        {
            player.parent = originalParent; // 원래 부모로 설정
        }
        else
        {
            player.parent = null; // 부모가 없었으면 null로 설정 (최상위 객체로 돌아감)
        }
        playerController.SetCanMove(true);
        player.position = new Vector3(133f, 25f, -17f);
        player.rotation = Quaternion.Euler(0f, 90f, 0f);
    }

    public void ComeToPlayer()
    {
        rotateObjectByAngle.RotateX(45f);
    }

    public void GoStage()
    {
        rotateObjectByAngle.RotateX(-105f);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi"))
        {
            player = other.transform.root;
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (players.ContainsKey(playerController))
            {
                if (PV.IsMine) // Exit한 플레이어에게만.
                {
                    UIManager_Player.Instance.EnableInteractionNotice();
                }
                players.Remove(playerController);
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (players.ContainsKey(playerController))
            {
                if (PV.IsMine) // Exit한 플레이어에게만.
                {
                    UIManager_Player.Instance.DisableInteractionNotice();
                }
                players.Remove(playerController);
            }
        }
    }
}
