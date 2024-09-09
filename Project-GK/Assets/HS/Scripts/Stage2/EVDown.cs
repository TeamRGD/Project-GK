using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EVDown : MonoBehaviour
{
    bool isFirstDown = false;
    [SerializeField] Transform EVStep;
    float moveSpeed = 0.1f;

    public IEnumerator MoveCarrier(Transform target)
    {
        Vector3 targetPosition = target.position;
        while (Vector3.Distance(transform.position, targetPosition) > 0.1f)
        {
            transform.position = Vector3.MoveTowards(transform.position, targetPosition, moveSpeed);
            yield return null;
        }
        transform.position = targetPosition; // 정확한 위치로 설정하여 오차를 제거
    }

    private void OnTriggerEnter(Collider other)
    {
        if(!isFirstDown)
        {
            if (other.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
            {
                isFirstDown = true;
                StartCoroutine(MoveCarrier(EVStep));
            }
        }
    }
}
