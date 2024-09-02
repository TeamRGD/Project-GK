using System.Collections;
using UnityEngine;

public class ButtonCarrier : MonoBehaviour
{
    [SerializeField] bool isDownCarrier;
    [SerializeField] bool isDownButton;
    [SerializeField] Transform carrier;
    [SerializeField] Transform carrierDestination;
    [SerializeField] Transform carrierOrigin;
    [SerializeField] Transform button;
    [SerializeField] Transform buttonDestination;
    [SerializeField] Transform buttonOrigin;

    [SerializeField] float moveSpeed = 0.2f; // 움직이는 속도
    [SerializeField] float moveButtonSpeed = 0.1f; // 버튼 움직이는 속도

    private Coroutine currentMoveCoroutine;
    private Coroutine currentButtonCoroutine;

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
        while(Vector3.Distance(button.position, targetPosition) > 0.1f)
        {
            button.position = Vector3.MoveTowards(button.position, targetPosition, moveButtonSpeed);
            yield return null;
        }
        button.position = targetPosition; // 정확한 위치로 설정하여 오차를 제거
        currentButtonCoroutine = null;
    }

    private IEnumerator MoveCarrier()
    {
        Vector3 targetPosition = isDownCarrier ? carrierDestination.position : carrierOrigin.position;
        while(Vector3.Distance(carrier.position, targetPosition) > 0.1f)
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
            isDownButton = true;
            ButtonDown(isDownButton);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
        {
            isDownButton = false;
            ButtonDown(isDownButton);
        }
    }
}
