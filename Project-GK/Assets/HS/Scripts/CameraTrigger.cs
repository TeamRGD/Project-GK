using UnityEngine;
using System.Collections;

public class CameraTrigger : MonoBehaviour
{
    Camera playerCamera;
    PlayerController playerController;

    [SerializeField] public float transitionSpeed = 3f;
    [SerializeField] public float waitTime = 0.3f;

    // 목표 위치는 월드 좌표로 설정
    [SerializeField] Vector3 targetWorldPosition = new Vector3(90, 22, -17);
    [SerializeField] Vector3 targetWorldRotationEuler = new Vector3(11, -170, 0);  // 회전을 Euler 각도로 설정

    // 카메라의 원래 위치와 회전은 로컬 좌표로 저장
    [SerializeField] Vector3 originalLocalPosition = new Vector3(0, 0, 0);
    [SerializeField] Vector3 originalLocalRotationEuler = new Vector3(0, 0, 0);

    private void OnTriggerStay(Collider other)
    {
        // 트리거에 접근한 객체가 부모를 가진 경우
        if (other.transform.parent == null)
        {
            playerCamera = other.transform.GetComponentInChildren<Camera>();
            playerController = other.GetComponentInParent<PlayerController>();
        }
    }

    public void ActivateCameraMoving()
    {
        Debug.Log("ActivateCameraMoving");
        StartCoroutine(FocusOnObjectWithParentCamera(playerCamera));
    }

    // 카메라로 특정 오브젝트를 부드럽게 비추는 코루틴
    private IEnumerator FocusOnObjectWithParentCamera(Camera camera)
    {
        Debug.Log("FocusOnObject 실행");

        // 목표 회전을 Quaternion으로 변환 (월드 좌표 기준)
        Quaternion targetWorldRotation = Quaternion.Euler(targetWorldRotationEuler);

        float currentTime = 0f;

        // 카메라를 월드 좌표 기준으로 목표 위치로 이동
        while (currentTime < transitionSpeed)
        {
            camera.transform.position = Vector3.Lerp(camera.transform.position, targetWorldPosition, currentTime / transitionSpeed);
            camera.transform.rotation = Quaternion.Lerp(camera.transform.rotation, targetWorldRotation, currentTime / transitionSpeed);

            currentTime += Time.deltaTime;
            yield return null;
        }

        yield return new WaitForSeconds(waitTime);
        Debug.Log("카메라 움직임 끝");
    }

    public void InitializeCamera(Camera camera)
    {
        Debug.Log("InitializeCamera 실행");

        // 로컬 좌표로 카메라 초기화
        camera.transform.localPosition = originalLocalPosition;
        Quaternion originalLocalRotation = Quaternion.Euler(originalLocalRotationEuler);
        camera.transform.localRotation = originalLocalRotation;
    }
}
