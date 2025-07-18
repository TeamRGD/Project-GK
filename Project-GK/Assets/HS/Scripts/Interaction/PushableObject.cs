using UnityEngine;
using Photon.Pun;
using System.Collections.Generic;
using System.Collections;

public class PushableObject : MonoBehaviour
{
    public float interactionRange = 2f;   // 상호작용 가능한 거리
    public LayerMask playerLayer;         // 플레이어 레이어 설정
    public float moveSpeed = 0.1f;          // 오브젝트를 움직일 때 속도

    [SerializeField] private float playerSpeed = 1f;
    [SerializeField] private bool isPlayerNearby = false;
    [SerializeField] private bool isPushing = false;       // 오브젝트를 밀고 있는지 여부
    [SerializeField] private Transform playerTransform;    // 상호작용 중인 플레이어의 트랜스폼

    PhotonView photonView;
    Animator animator;

    private Dictionary<PlayerController, PhotonView> players = new Dictionary<PlayerController, PhotonView>(); // 해당 오브젝트와 상호작용하는 Player를 담아 줌.

    private void Start()
    {
        photonView = GetComponent<PhotonView>();
    }

    IEnumerator TriggerAnimTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("trigger", false);
    }

    private void Update()
    {
        // 플레이어가 가까이 있는지 확인
        if (isPlayerNearby)
        {
            // T키가 눌려 있는 동안만 isPushing을 true로 유지
            if (Input.GetKey(KeyCode.T))
            {
                animator = playerTransform.GetComponentInParent<Animator>();
                animator.SetBool("isPushing", true);
                if (!isPushing) // 처음 눌렸을 때만 StartPushing 호출
                {
                    animator.SetBool("trigger", true);
                    StartCoroutine(TriggerAnimTime(0.4f));
                    StartPushing();
                }
            }
            else
            {
                Animator animator = playerTransform.GetComponentInParent<Animator>();
                if (isPushing) // T키를 떼면 StopPushing 호출
                {
                    animator.SetBool("isPushing", false);
                    StopPushing();
                }
            }
        }

        // isPushing이 true일 때 오브젝트를 이동
        if (isPushing)
        {
            MoveObjectWithPlayer();
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            PlayerController playerController;
            PhotonView PV;
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
            if (!players.ContainsKey(playerController))
            {
                players.Add(playerController, PV);
                if (PV.IsMine) // Enter한 플레이어에게만.
                {
                    isPlayerNearby = true;
                    playerTransform = other.transform;
                }
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard"))
        {
            PlayerController playerController;
            PhotonView PV;
            playerController = other.GetComponentInParent<PlayerController>();
            PV = playerController.GetComponentInParent<PhotonView>();
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
            PlayerController playerController = playerTransform.GetComponentInParent<PlayerController>();

            if (playerController != null)
            {
                playerController.SetSpeed(playerSpeed); // 속도를 느리게 바꾼다.
            }
        }
    }

    private void StopPushing()
    {
        isPushing = false;

        if (playerTransform != null)
        {
            PlayerController playerController = playerTransform.GetComponentInParent<PlayerController>();

            if (playerController != null)
            {
                playerController.SetSpeed(-1); // 속도를 원래 상태로 변경함(플컨에 저장되어 있음)
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

            photonView.RPC("TranslationPositionRPC", RpcTarget.AllBuffered, directionToMove);
            // 오브젝트를 플레이어가 향하는 방향으로 이동시킴
        }
    }

    [PunRPC]
    void TranslationPositionRPC(Vector3 directionToMove)
    {
        transform.position += directionToMove * moveSpeed;
    }

    private void OnDrawGizmosSelected()
    {
        // 상호작용 범위 표시
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, interactionRange);
    }
}