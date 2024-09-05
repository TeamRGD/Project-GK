using System.Collections;
using UnityEngine;

public class ButtonCarrier : MonoBehaviour
{
    [SerializeField] bool isDownCarrier;
    [SerializeField] bool isDownButton; // 내려가는 상태면 True 올라가는 상태면 False
    [SerializeField] Transform carrier; // 캐리어 오브젝트
    [SerializeField] Transform carrierDestination; // 캐리어 목적지(내려갔을 때)
    [SerializeField] Transform carrierOrigin; // 캐리어 원래 자리
    [SerializeField] Transform button; // 버튼 오브젝트
    [SerializeField] Transform buttonDestination; // 버튼 목적지(밟았을 때)
    [SerializeField] Transform buttonOrigin; // 버튼 원래 자리(안 밟았을 때)



    [SerializeField] float moveSpeed = 0.2f; // 움직이는 속도
    [SerializeField] float moveButtonSpeed = 0.03f; // 버튼 움직이는 속도

    private Coroutine currentMoveCoroutine;
    private Coroutine currentButtonCoroutine;

    Transform player;
    Transform originalParent; // 플레이어의 원래 부모

    void ButtonDown(bool state) // 버튼 위에 올라갔을 때 true
    {
        if (currentButtonCoroutine != null)
        {
            StopCoroutine(currentButtonCoroutine);
        }
        currentButtonCoroutine = StartCoroutine(MoveButton());
        CarrierExecute(state);
    }

    void CarrierExecute(bool state) // 버튼에 따라 캐리어 움직임 제어 함수
    {
        isDownCarrier = state;
        if (currentMoveCoroutine != null)
        {
            StopCoroutine(currentMoveCoroutine);
        }
        currentMoveCoroutine = StartCoroutine(MoveCarrier());
    }

    private IEnumerator MoveButton()
    {
        Vector3 targetPosition = isDownButton ? buttonDestination.position : buttonOrigin.position;
        while (Vector3.Distance(button.position, targetPosition) > 0.1f)
        {
            button.position = Vector3.MoveTowards(button.position, targetPosition, moveButtonSpeed);
            yield return null;
        }
        Debug.Log("MoveButton 실행 중");
        button.position = targetPosition; // 정확한 위치로 설정하여 오차를 제거
        currentButtonCoroutine = null;
    }

    private IEnumerator MoveCarrier()
    {
        Vector3 targetPosition = isDownCarrier ? carrierDestination.position : carrierOrigin.position;
        while (Vector3.Distance(carrier.position, targetPosition) > 0.1f)
        {
            carrier.position = Vector3.MoveTowards(carrier.position, targetPosition, moveSpeed);
            yield return null;
        }
        carrier.position = targetPosition; // 정확한 위치로 설정하여 오차를 제거
        currentMoveCoroutine = null;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
        {
            Debug.Log("접근 중");
            isDownButton = true;
            ButtonDown(isDownButton);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
        {
            Debug.Log("빠져나옴");
            isDownButton = false;
            ButtonDown(isDownButton);
        }
    }
}