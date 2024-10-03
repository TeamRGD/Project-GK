using System.Collections;
using UnityEngine;

public class GuardManager : MonoBehaviour
{

    [SerializeField] Subtitle subtitleS1_6_Wi; // 걸렸을 때 자막표기
    [SerializeField] Subtitle subtitleS1_6_Zard; // 걸렸을 때 자막표기

    [SerializeField] Subtitle subtitleRebirth_Wi; // 다시 태어날 때 자막 표기
    [SerializeField] Subtitle subtitleRebirth_Zard; // 다시 태어날 때 자막 표기

    public Transform[] patrolPoints; // 경비병이 순찰할 포인트들
    public float speed = 2f; // 경비병 이동 속도
    private int currentPointIndex = 0; // 현재 경비병이 목표로 하는 포인트
    private Transform targetPoint; // 다음 순찰 포인트

    public float detectionTime = 2f; // 플레이어가 시야에 노출된 시간을 관리하는 변수
    [SerializeField] private float playerDetectionCounterWi = 0f; // 플레이어가 시야에 있는 시간
    [SerializeField] private float playerDetectionCounterZard = 0f; // 플레이어가 시야에 있는 시간
    public float viewAngle = 360f; // 경비병의 시야각 (원형 시야)
    public float sphereRadius = 1f; // SphereCast의 반경
    public float immediateDistance = 2f; // 즉시 게임 종료 범위
    public float gradualDistance = 5f; // 일정 시간 후 게임 종료 범위

    public Transform rayOrigin; // Ray 발사 위치를 위한 자식 오브젝트 Transform

    private GameObject playerWi; // PlayerWi 태그를 가진 플레이어
    private GameObject playerZard; // PlayerZard 태그를 가진 플레이어
    PlayerController playerControllerWi;
    PlayerController playerControllerZard;

    public Transform resetLocationWi; // 게임 종료 시 PlayerWi가 이동할 위치
    public Transform resetLocationZard; // 게임 종료 시 PlayerZard가 이동할 위치
    private bool playerInSight = false; // 플레이어가 시야에 있는지 여부

    bool isEnding = false;

    Animator anim;

    void Start()
    {

        anim = GetComponent<Animator>();

        if (patrolPoints.Length == 0)
        {
            Debug.LogError("Patrol points are not set.");
            return;
        }

        targetPoint = patrolPoints[currentPointIndex]; // 첫 번째 순찰 포인트 설정

        // 각각의 플레이어 오브젝트 찾기
        playerWi = GameObject.FindGameObjectWithTag("PlayerWi");
        playerZard = GameObject.FindGameObjectWithTag("PlayerZard");
        if (playerWi != null)
            playerControllerWi = playerWi.GetComponentInParent<PlayerController>();
        if (playerZard != null)
            playerControllerZard = playerZard.GetComponentInParent<PlayerController>();
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

        playerDetectionCounterWi = 0f;
        playerDetectionCounterZard = 0f;
    }

    void DetectPlayers()
    {

        // 두 플레이어 모두 감지
        DetectSinglePlayerWi(playerWi);
        if (playerZard != null)
            DetectSinglePlayerZard(playerZard);
    }

    void DetectSinglePlayerWi(GameObject player)
    {
        if (player.tag != "PlayerWi") return; // 플레이어가 없는 경우 건너뜀

        Vector3 directionToPlayer = player.transform.position - rayOrigin.position;
        float distanceToPlayer = directionToPlayer.magnitude;

        // 방향과 거리 계산
        if (distanceToPlayer <= gradualDistance)
        {
            // SphereCast를 통해 플레이어를 감지
            RaycastHit hit;
            if (Physics.SphereCast(rayOrigin.position, sphereRadius, directionToPlayer.normalized, out hit, gradualDistance))
            {
                if (hit.collider.CompareTag(player.tag))
                {
                    anim.SetBool("isFind", true);
                    playerInSight = true;
                    // 즉시 게임 종료 범위 내에 있으면 바로 게임 종료
                    if (distanceToPlayer <= immediateDistance)
                    {
                        if (!isEnding)
                            StartCoroutine(EndGame(player));
                        return;
                    }
                    // 점진적 감지 범위 내에 있으면 대기 후 게임 종료
                    else if (distanceToPlayer <= gradualDistance)
                    {
                        playerInSight = true; // 플레이어가 시야 내에 있음
                        playerDetectionCounterWi += Time.deltaTime; // 노출 시간 증가

                        if (playerDetectionCounterWi >= detectionTime) // 일정 시간 이상 노출되면
                        {
                            StartCoroutine(EndGame(player));
                            return;
                        }
                    }
                    else
                    {
                        playerDetectionCounterWi = 0f; // 플레이어가 감지되지 않으면 노출 시간 초기화
                        anim.SetBool("isFind", false);
                        playerInSight = false;
                    }
                }
            }
        }
    }

    void DetectSinglePlayerZard(GameObject player)
    {
        if (player.tag != "PlayerZard") return;

        Vector3 directionToPlayer = player.transform.position - rayOrigin.position;
        float distanceToPlayer = directionToPlayer.magnitude;

        // 방향과 거리 계산
        if (distanceToPlayer <= gradualDistance)
        {
            // SphereCast를 통해 플레이어를 감지
            RaycastHit hit;
            if (Physics.SphereCast(rayOrigin.position, sphereRadius, directionToPlayer.normalized, out hit, gradualDistance))
            {
                if (hit.collider.CompareTag(player.tag))
                {
                    anim.SetBool("isFind", true);
                    playerInSight = true;
                    // 즉시 게임 종료 범위 내에 있으면 바로 게임 종료
                    if (distanceToPlayer <= immediateDistance)
                    {
                        if (!isEnding)
                        {
                            StartCoroutine(EndGame(player));
                        }
                        return;
                    }
                    // 점진적 감지 범위 내에 있으면 대기 후 게임 종료
                    else if (distanceToPlayer <= gradualDistance)
                    {
                        playerInSight = true; // 플레이어가 시야 내에 있음
                        playerDetectionCounterZard += Time.deltaTime; // 노출 시간 증가

                        if (playerDetectionCounterZard >= detectionTime) // 일정 시간 이상 노출되면
                        {
                            StartCoroutine(EndGame(player));
                            return;
                        }
                    }
                    else
                    {
                        playerDetectionCounterZard = 0f; // 플레이어가 감지되지 않으면 노출 시간 초기화
                        anim.SetBool("isFind", false);
                        playerInSight = false;
                    }
                }
            }
        }
    }

    
    IEnumerator EndGame(GameObject player)
    {
        isEnding = true;

        playerControllerWi.SetCanMove(false);
        if (playerControllerZard != null)
            playerControllerZard.SetCanMove(false);

        if (player.CompareTag("PlayerWi"))
            subtitleS1_6_Wi.LoopSubTitle();
        else if (player.CompareTag("PlayerZard"))
            subtitleS1_6_Zard.LoopSubTitle();

        yield return new WaitForSeconds(2f);
        FadeInOut.instance.FadeOut(1f);
        yield return new WaitForSeconds(1f);


        // 두 플레이어를 지정된 위치로 이동시킴
        if (playerWi != null)
        {
            playerWi.transform.root.position = resetLocationWi.position;
            playerWi.transform.root.rotation = resetLocationWi.rotation;
        }
        if (playerZard != null)
        {
            playerZard.transform.root.position = resetLocationZard.position;
            playerZard.transform.root.rotation = resetLocationZard.rotation;
        }

        anim.SetBool("isFind", false);
        playerInSight = false;

        FadeInOut.instance.FadeIn(1f);
        yield return new WaitForSeconds(1f);

        if (player.CompareTag("PlayerWi"))
            subtitleRebirth_Wi.LoopSubTitle();
        else if (player.CompareTag("PlayerZard"))
            subtitleRebirth_Zard.LoopSubTitle();

        playerDetectionCounterWi = 0f;
        playerDetectionCounterZard = 0f;

        isEnding = false;

        playerControllerWi.SetCanMove(true);
        if (playerControllerZard != null)
            playerControllerZard.SetCanMove(true);

        yield return null;
    }

    void OnDrawGizmos() // 경비병 시야를 시각적으로 확인하기 위해 Gizmo 사용
    {
        if (rayOrigin == null) return;

        Gizmos.color = Color.red;

        // SphereCast 시야를 시각화
        Gizmos.DrawWireSphere(rayOrigin.position, gradualDistance);

        // 즉시 종료 범위 시각화
        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(rayOrigin.position, immediateDistance);
    }
}
