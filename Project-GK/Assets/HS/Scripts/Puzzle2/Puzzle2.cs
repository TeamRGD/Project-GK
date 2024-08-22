using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle2 : MonoBehaviour
{
    [SerializeField] GameObject puzzle3Manager; // 퍼즐3 매니저
    [SerializeField] GameObject lamp; // 퍼즐3로 넘어가는 램프

    // 퍼즐이 완료되었을 때 실행할 함수
    public void OnPuzzleComplete()
    {
        Debug.Log("퍼즐2 완료!");
        //clearItem.SetActive(true); // 아이템 있을 때 수정.
        if (lamp.TryGetComponent<TarzanSwing2>(out TarzanSwing2 tarzanSwing2))
        {
            tarzanSwing2.ComeToPlayer();
        }
        puzzle3Manager.SetActive(true);
    }
}
