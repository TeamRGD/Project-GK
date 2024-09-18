using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EVDown : MonoBehaviour
{
    bool isFirstDown = false;
    [SerializeField] Transform EVStep;
    [SerializeField] float moveTime = 5.0f; // 이동하는 데 걸리는 시간 (초 단위)
    Transform playerTransform;
    Vector3 playerLocalPosition; // 로컬 위치 저장용

    public IEnumerator MoveCarrier(Transform target)
    {
        Vector3 startPosition = transform.position;
        Vector3 targetPosition = target.position;
        float elapsedTime = 0f;

        // 부모를 설정하기 전에 로컬 위치를 저장
        playerLocalPosition = transform.InverseTransformPoint(playerTransform.position);
        playerTransform.parent = this.gameObject.transform;
        playerTransform.localPosition = playerLocalPosition; // 월드 좌표를 로컬 좌표로 변환 후 적용

        while (elapsedTime < moveTime)
        {
            transform.position = Vector3.Lerp(startPosition, targetPosition, elapsedTime / moveTime);
            elapsedTime += Time.deltaTime; // 프레임당 시간을 더해줌
            yield return null;
        }
        transform.position = targetPosition; // 정확한 위치로 설정하여 오차를 제거

        // 부모를 null로 설정하기 전에 월드 좌표로 변환
        Vector3 worldPosition = playerTransform.position; // 월드 좌표로 저장
        playerTransform.parent = null; // 부모 해제
        playerTransform.position = worldPosition; // 해제 후 월드 좌표 적용
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!isFirstDown)
        {
            if (other.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
            {
                isFirstDown = true;
                playerTransform = other.gameObject.transform.root;
                StartCoroutine(MoveCarrier(EVStep));
            }
        }
    }
}
