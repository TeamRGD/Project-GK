using System.Collections;
using UnityEngine;
using Photon.Pun;

public class GuardManager : MonoBehaviour
{
    // 자막 관련 //
    [SerializeField] Subtitle subtitleS1_6_Wi; // 걸렸을 때 자막표기
    [SerializeField] Subtitle subtitleS1_6_Zard; // 걸렸을 때 자막표기

    [SerializeField] Subtitle subtitleRebirth_Wi; // 다시 태어날 때 자막 표기
    [SerializeField] Subtitle subtitleRebirth_Zard; // 다시 태어날 때 자막 표기

    // 경비병 관련 //
    Animator anim; // 경비병 애니메이션 컨트롤러
    PhotonView photonView; // 

    public Transform[] patrolPoints; // 경비병이 순찰할 포인트들
    public float speed = 2f; // 경비병 이동 속도
    private int currentPointIndex = 0; // 현재 경비병이 목표로 하는 포인트
    private Transform targetPoint; // 다음 순찰 포인트
    private Vector3 fixedPosition; // 경비병 고정 위치(플레이어 발견시) 

    public float sphereRadius = 12f; // 경비병 탐지반경
    public Transform rayOrigin; // Ray 발사 위치를 위한 자식 오브젝트 Transform
    public bool playerInSight = false; // 플레이어가 시야에 있는지 여부
    [SerializeField] private LayerMask detectionLayer; // 플레이어만 추출

    private bool isTurning; // 경비병이 회전 중일 때 True
    public float turnDuration = 0.8f; // 경비병 회전 시간

    // 플레이어 관련 //
    private GameObject playerWi; // PlayerWi 태그를 가진 플레이어
    private GameObject playerZard; // PlayerZard 태그를 가진 플레이어
    PlayerController playerControllerWi;
    PlayerController playerControllerZard;

    public Transform resetLocationWi; // 게임 종료 시 PlayerWi가 이동할 위치
    public Transform resetLocationZard; // 게임 종료 시 PlayerZard가 이동할 위치

    // 퍼즐 관련 //
    bool isEnding = false; // 경비병에게 걸렸을 때 True (End game 용)

    void Start()
    {
        photonView = GetComponent<PhotonView>();
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
        DetectPlayer();

        // 플레이어가 시야 내에 없다면 순찰을 계속함
        if (!playerInSight)
        {
            Patrol();
        }

        else
        {
            transform.position = fixedPosition;
        }
    }

    void Patrol()
    {
        if (isTurning)
            return;

        if (Vector3.Distance(transform.position, targetPoint.position) < 0.2f)
        {
            StartCoroutine(TurnAtPatrolPoint());
        }

        else
        {
            transform.position = Vector3.MoveTowards(transform.position, targetPoint.position, speed * Time.deltaTime); // 경비병 이동
            transform.LookAt(targetPoint); // 순찰 중 목표 지점 바라보기
        }
        
    }

    
    IEnumerator TurnAtPatrolPoint()
    {
        isTurning = true;

        // Turn 애니메이션 실행
        photonView.RPC("AnimationTriggerRPC", RpcTarget.AllBuffered, "Turn");

        // 일정 시간 동안 대기하며 회전
        float elapsedTime = 0f;
        while (elapsedTime < turnDuration)
        {
            transform.Rotate(0f, 180f * Time.deltaTime / turnDuration, 0f); // 일정 시간 동안 회전
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // 다음 Patrol Point로 이동
        currentPointIndex = (currentPointIndex + 1) % patrolPoints.Length;
        targetPoint = patrolPoints[currentPointIndex];

        isTurning = false;
    } 

    void DetectPlayer()
    {
        // 탐지 반경 안에 있는 모든 Collider를 가져옴
        Collider[] hitColliders = Physics.OverlapSphere(transform.position, sphereRadius, detectionLayer);

        if (hitColliders.Length > 0)
        {
            Debug.Log("플레이어가 주변에 있습니다!");
            foreach (var hit in hitColliders)
            {
                playerInSight = true;
                fixedPosition = transform.position;
                photonView.RPC("AnimationStateRPC", RpcTarget.AllBuffered, "isFind", true);
                if (!isEnding)
                {
                    photonView.RPC("EndGameRPC", RpcTarget.AllBuffered, hit.tag);
                }
                return;
            }
        }
        else if (!isEnding)
        {
            photonView.RPC("AnimationStateRPC", RpcTarget.AllBuffered, "isFind", false);
            playerInSight = false;
        }
    }

    [PunRPC]
    public void AnimationStateRPC(string animationName, bool state)
    {
        if (anim != null)
            anim.SetBool(animationName, state);
    }

    [PunRPC]
    void AnimationTriggerRPC(string animation)
    {   
        Debug.Log("AnimationTriggerRPC 실행");
        anim.SetTrigger(animation);
    }

    [PunRPC]
    void EndGameRPC(string tag)
    {
        StartCoroutine(EndGame(tag));
    }
    
    IEnumerator EndGame(string tag)
    {
        isEnding = true;

        playerControllerWi.SetCanMove(false);
        playerControllerZard.SetCanMove(false);

        if (tag == "PlayerWi")
            subtitleS1_6_Wi.LoopSubTitle();
        else if (tag == "PlayerZard")
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

        photonView.RPC("AnimationStateRPC", RpcTarget.AllBuffered, "isFind", false);
        playerInSight = false;

        FadeInOut.instance.FadeIn(1f);
        yield return new WaitForSeconds(1f);

        if (tag == "PlayerWi")
            subtitleRebirth_Wi.LoopSubTitle();
        else if (tag == "PlayerZard")
            subtitleRebirth_Zard.LoopSubTitle();

        isEnding = false;

        playerControllerWi.SetCanMove(true);
        playerControllerZard.SetCanMove(true);

        yield return null;
    }

    void OnDrawGizmos() // 경비병 시야를 시각적으로 확인하기 위해 Gizmo 사용
    {
        if (rayOrigin == null) return;

        Gizmos.color = Color.red;

        // SphereCast 시야를 시각화
        Gizmos.DrawWireSphere(rayOrigin.position, sphereRadius);

    }
}
