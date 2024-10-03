using Photon.Pun;
using UnityEngine;
using System.Collections.Generic;

public class ToolPickup : MonoBehaviour
{
    public GameObject toolPrefab; // 픽업할 도구 프리팹
    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.
    PlayerToolManager playerToolManager;
    PlayerController playerController;
    PhotonView PV;
    PhotonView photonView;

    private bool isFall = false;
    AudioSource fallSound;

    private void Start()
    {
        photonView = GetComponent<PhotonView>();
        fallSound = GetComponent<AudioSource>();
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.collider.CompareTag("Ground") && !isFall)
        {
            fallSound.Play();
            isFall = true;
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
                if (PV.IsMine) // Enter한 플레이어에게만.
                {
                    playerToolManager = playerController.GetComponentInParent<PlayerToolManager>();
                    UIManager_Player.Instance.EnableInteractionNotice();
                }
            }
        }
    }

    void OnTriggerExit(Collider other)
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

    public void AddToolToPlayer(int idx)
    {
        if (playerToolManager != null)
        {
            playerToolManager.AddTool(2); // 짚라인 idx: 2, 그 후 추가되는 것 idx: 3.
            // 신동준 UI 추가 코드
            photonView.RPC("AddToolToPlayerRPC", RpcTarget.AllBuffered);
        }
    }

    [PunRPC]
    void AddToolToPlayerRPC()
    {
        gameObject.SetActive(false);
    }
}
