using System.Collections;
using UnityEngine;

public class GuardManager : MonoBehaviour
{
    public Transform[] patrolPoints; // 경비병이 순찰할 포인트들
    public float speed = 2f; // 경비병 이동 속도
    private int currentPointIndex = 0; // 현재 경비병이 목표로 하는 포인트
    private Transform targetPoint; // 다음 순찰 포인트

    public float detectionTime = 2f; // 플레이어가 시야에 노출된 시간을 관리하는 변수
    private float playerDetectionCounter = 0f; // 플레이어가 시야에 있는 시간
    public float viewAngle = 45f; // 경비병의 시야각
    public float immediateDistance = 2f; // 즉시 게임 종료 범위
    public float gradualDistance = 5f; // 일정 시간 후 게임 종료 범위

    private GameObject playerWi; // PlayerWi 태그를 가진 플레이어
    private GameObject playerZard; // PlayerZard 태그를 가진 플레이어
    public Transform resetLocationWi; // 게임 종료 시 플레이어가 이동할 위치
    public Transform resetLocationZard; // 게임 종료 시 플레이어가 이동할 위치
    private bool playerInSight = false; // 플레이어가 시야에 있는지 여부

    void Start()
    {
        targetPoint = patrolPoints[currentPointIndex]; // 첫 번째 순찰 포인트 설정

        // 각각의 플레이어 오브젝트 찾기
        playerWi = GameObject.FindGameObjectWithTag("PlayerWi");
        playerZard = GameObject.FindGameObjectWithTag("PlayerZard");
    }

    void Update()
    {
        DetectPlayers();

        // 플레이어가 시야 내에 없다면 순찰을 계속함
        if (!playerInSight)
        {
            Patrol();
        }
    }

    void Patrol()
    {
        if (Vector3.Distance(transform.position, targetPoint.position) < 0.2f)
        {
            currentPointIndex = (currentPointIndex + 1) % patrolPoints.Length; // 다음 포인트로 순환
            targetPoint = patrolPoints[currentPointIndex];
        }
        transform.position = Vector3.MoveTowards(transform.position, targetPoint.position, speed * Time.deltaTime); // 경비병 이동
        transform.LookAt(targetPoint); // 순찰 중 목표 지점 바라보기
    }

    void DetectPlayers()
    {
        playerInSight = false; // 매 프레임마다 초기화하여 시야 내에 플레이어가 있는지 확인

        // 두 플레이어 모두 감지
        DetectSinglePlayer(playerWi);
        DetectSinglePlayer(playerZard);
    }

    void DetectSinglePlayer(GameObject player)
    {
        if (player == null) return; // 플레이어가 없는 경우 건너뜀

        Vector3 directionToPlayer = player.transform.position - transform.position; // 경비병에서 플레이어로 향하는 벡터 계산
        float angleToPlayer = Vector3.Angle(transform.forward, directionToPlayer);
        float distanceToPlayer = directionToPlayer.magnitude;

        // 시야각 내에 있는지 확인
        if (angleToPlayer < viewAngle / 2)
        {
            RaycastHit hit;
            if (Physics.Raycast(transform.position, directionToPlayer, out hit, gradualDistance))
            {
                if (hit.collider.CompareTag(player.tag))
                {
                    // 즉시 게임 종료 범위 내에 있으면 바로 게임 종료
                    if (distanceToPlayer <= immediateDistance)
                    {
                        EndGame();
                    }
                    // 점진적 감지 범위 내에 있으면 대기 후 게임 종료
                    else if (distanceToPlayer <= gradualDistance)
                    {
                        playerInSight = true; // 플레이어가 시야 내에 있음
                        playerDetectionCounter += Time.deltaTime; // 노출 시간 증가

                        if (playerDetectionCounter >= detectionTime) // 일정 시간 이상 노출되면
                        {
                            EndGame(); // 게임 종료
                        }
                    }
                }
                else
                {
                    playerDetectionCounter = 0f; // 시야에서 벗어나면 초기화
                }
            }
        }
        else
        {
            playerDetectionCounter = 0f; // 시야 범위 밖이면 초기화
        }
    }

    void EndGame()
    {
        Debug.Log("Game Over! The guard has caught a player.");

        // 두 플레이어를 지정된 위치로 이동시킴
        playerWi.transform.root.position = resetLocationWi.position;
        if (playerZard != null)
            playerZard.transform.root.position = resetLocationZard.position;
    }

    void OnDrawGizmos() // 경비병 시야를 시각적으로 확인하기 위해 Gizmo 사용
    {
        Gizmos.color = Color.red;
        Gizmos.DrawRay(transform.position, transform.forward * gradualDistance);
        Gizmos.color = Color.blue;
        Gizmos.DrawRay(transform.position, transform.forward * immediateDistance);
    }
}
