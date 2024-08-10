using UnityEngine;
using Photon.Pun;
using System.Collections.Generic;

public class PushableObject : MonoBehaviour
{
    public float interactionRange = 2f;   // 상호작용 가능한 거리
    public LayerMask playerLayer;         // 플레이어 레이어 설정
    public float moveSpeed = 100f;          // 오브젝트를 움직일 때 속도

    [SerializeField] private bool isPlayerNearby = false;
    [SerializeField] private bool isPushing = false;       // 오브젝트를 밀고 있는지 여부
    [SerializeField] private Transform playerTransform;    // 상호작용 중인 플레이어의 트랜스폼

    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    private void Update()
    {
        if (isPlayerNearby && Input.GetKeyDown(KeyCode.E))
        {
            if (isPushing)
            {
                StopPushing();
            }
            else
            {
                StartPushing();
            }
        }
        if (isPushing)
        {
            MoveObjectWithPlayer();
        }
    }

    void OnTriggerEnter(Collider other)
    {

        if (other.CompareTag("Player"))
        {
            PlayerController playerController;
            PhotonView PV;
            other.TryGetComponent<PlayerController>(out playerController);
            playerController.TryGetComponent<PhotonView>(out PV);
            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
                if (PV.IsMine) // Enter한 플레이어에게만.
                {
                    isPlayerNearby = true;
                    playerTransform = other.transform;
                    playerController.SetSpeed(2);
                }
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            PlayerController playerController;
            PhotonView PV;
            other.TryGetComponent<PlayerController>(out playerController);
            playerController.TryGetComponent<PhotonView>(out PV);
            if (players.ContainsKey(playerController))
            {
                if (PV.IsMine) // Exit한 플레이어에게만.
                {
                   StopPushing();

                   isPlayerNearby = false;
                   playerTransform = null;
                }
                players.Remove(playerController);
            }
        }
    }

    private void StartPushing()
    {
        isPushing = true;

        if (playerTransform != null)
        {
            PlayerController playerController = playerTransform.GetComponent<PlayerController>();

            if (playerController != null)
            {
                playerController.SetSpeed(2);
            }
        }
    }

    private void StopPushing()
    {
        isPushing = false;

        if (playerTransform != null)
        {
            PlayerController playerController = playerTransform.GetComponent<PlayerController>();

            if (playerController != null)
            {
                playerController.SetSpeed(-1);
            }
        }
    }

    private void MoveObjectWithPlayer()
    {
        if (playerTransform != null)
        {
            // 오브젝트가 플레이어를 향해 움직이도록 하는 방향 벡터
            Vector3 directionToMove = (transform.position - playerTransform.position).normalized;
            directionToMove.y = 0;
            directionToMove.Normalize();

            // 오브젝트를 플레이어가 향하는 방향으로 이동시킴
            transform.position += directionToMove * moveSpeed * Time.deltaTime;
        }
    }

    private void OnDrawGizmosSelected()
    {
        // 상호작용 범위 표시
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, interactionRange);
    }
}
