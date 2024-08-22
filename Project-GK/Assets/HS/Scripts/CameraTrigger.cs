using UnityEngine;
using System.Collections;

public class CameraTrigger : MonoBehaviour
{
    Camera playerCamera;
    PlayerController playerController;
    Transform playerTransform;

    [SerializeField] float transitionSpeed = 4f;
    [SerializeField] float elapsedTime = 2f;

    // 목표 위치와 회전을 SerializeField로 설정
    Vector3 originalPosition;
    Quaternion originalRotation;
    [SerializeField] Vector3 targetPosition = new Vector3(0, 60, -30);
    [SerializeField] Vector3 targetRotationEuler = new Vector3(45, 0, 0);  // 회전을 Euler 각도로 설정

    private void OnTriggerEnter(Collider other)
    {
        // 트리거에 접근한 객체가 부모를 가진 경우
        if (other.transform.parent == null)
        {
            playerCamera = other.transform.GetComponentInChildren<Camera>();
            playerController = other.GetComponentInParent<PlayerController>();
            if(other.TryGetComponent<Transform>(out Transform playerTransform))
            {
                originalPosition = playerTransform.position;
                originalRotation = playerTransform.rotation;
            }
        }
    }

    public void ActivateCameraMoving()
    {
        FocusOnObjectWithParentCamera(playerCamera);
    }

    // 카메라로 특정 오브젝트를 부드럽게 비추는 코루틴
    private IEnumerator FocusOnObjectWithParentCamera(Camera camera)
    {
        Debug.Log("FocusOnObject 실행");
        Quaternion targetRotation = Quaternion.Euler(targetRotationEuler);  // 목표 회전을 Quaternion으로 변환

        Vector3 originalPosition = new Vector3(0, 0, 0);
        Quaternion originalRotation = Quaternion.Euler(0, 0, 0);

        // 부드럽게 이동
        float currentTime = 0f;  // elapsedTime 대신 새로운 타이머 변수 사용

        while (currentTime < transitionSpeed)
        {
            camera.transform.position = Vector3.Lerp(originalPosition, targetPosition, currentTime / transitionSpeed);
            camera.transform.rotation = Quaternion.Lerp(originalRotation, targetRotation, currentTime / transitionSpeed);

            currentTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(2f);
    }

    public void InitializeCamera(Camera camera) // 카메라를 기존 위치로 변경한다.
    {
        Debug.Log("InitializeCamera 실행");
        Vector3 originalPosition = new Vector3(0, 0, 0);
        Quaternion originalRotation = Quaternion.Euler(0, 0, 0);

        camera.transform.position = originalPosition;
        camera.transform.rotation = originalRotation;
    }
}