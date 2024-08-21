using UnityEngine;
using System.Collections;

public class CameraTrigger : MonoBehaviour
{
    Camera playerCamera;
    PlayerController playerController;
    [SerializeField] float transitionSpeed = 2f;
    [SerializeField] float elapsedTime = 4f;

    private void OnTriggerEnter(Collider other)
    {
        // 트리거에 접근한 객체가 부모를 가진 경우
        if (other.transform.parent == null)
        {
            playerCamera = other.transform.GetComponentInChildren<Camera>();
            playerController = other.GetComponentInParent<PlayerController>();
            if (playerCamera != null)
            {
                // 원하는 작업 수행 (예: 카메라 조작)
                // 예를 들어, 특정 동작을 수행할 수 있도록 설정
                playerController.CursorOn();
                StartCoroutine(FocusOnObjectWithParentCamera(playerCamera));
                playerController.CursorOff();
            }
        }
    }

    // 카메라로 특정 오브젝트를 부드럽게 비추는 코루틴 (예시)
    IEnumerator FocusOnObjectWithParentCamera(Camera camera)
    {
        // 예: 카메라 이동, 회전 등
        Vector3 targetPosition = new Vector3(0, 20, -10);  // 목표 위치
        Quaternion targetRotation = Quaternion.Euler(45, 0, 0);  // 목표 회전

        Vector3 originalPosition = camera.transform.position;
        Quaternion originalRotation = camera.transform.rotation;

        // 부드럽게 이동
        while (elapsedTime < transitionSpeed)
        {
            camera.transform.position = Vector3.Lerp(originalPosition, targetPosition, elapsedTime / transitionSpeed);
            camera.transform.rotation = Quaternion.Lerp(originalRotation, targetRotation, elapsedTime / transitionSpeed);

            elapsedTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(2f);

        // 원래 자리로 돌아오기
        camera.transform.position = originalPosition;
        camera.transform.rotation = originalRotation;
    }
}
