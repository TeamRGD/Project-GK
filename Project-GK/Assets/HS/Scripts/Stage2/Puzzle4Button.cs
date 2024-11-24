using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle4Button : MonoBehaviour
{
    [SerializeField] List<StairMovement> stairs; // 오브젝트 별로 계단을 따로 배치한다.
    [SerializeField] Transform originTransform;
    [SerializeField] Transform destTransform;
    bool isClick = false; // 눌려있는지 아닌지 true: 눌려져 있는 상태
    public bool isUsing = false; // 버튼을 눌러서 계단이 움직이고 있는 상태면 true
    float durationTime;

    public void UseButton()
    {
        if (isUsing)
            return;

        StartCoroutine(MoveButton());
    }

    public IEnumerator MoveButton()
    {
        isUsing = true;
        isClick = !isClick;

        if(stairs[0].TryGetComponent<StairMovement>(out StairMovement stairMovement))
        {
            durationTime = stairMovement.getMoveDuration();
            for (int i = 0; i < stairs.Count; i++)
            {
                stairs[i].Move();
                StartCoroutine(MoveTransform());
            }
            yield return new WaitForSeconds(durationTime);

            isUsing = false;
        }

        yield return null;
    }

    private IEnumerator MoveTransform()
    {
        float elapsedTime = 0f;
        Vector3 startPosition = transform.position;
        this.gameObject.layer = 0;
        if (isClick)
        {
            while (elapsedTime < durationTime)
            {
                transform.position = Vector3.Lerp(startPosition, destTransform.position, elapsedTime / durationTime);
                elapsedTime += Time.deltaTime;
                yield return null;
            }
            transform.position = destTransform.position; // 이동 보정
        }

        else
        {
            while (elapsedTime < durationTime)
            {
                transform.position = Vector3.Lerp(startPosition, originTransform.position, elapsedTime / durationTime);
                elapsedTime += Time.deltaTime;
                yield return null;
            }
            transform.position = originTransform.position; // 이동 보정
        }

        this.gameObject.layer = 6;
        yield return null;
    }
}
