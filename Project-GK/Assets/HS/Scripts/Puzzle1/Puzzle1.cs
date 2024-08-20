using UnityEngine;
using System.Collections.Generic;

public class Puzzle1 : MonoBehaviour
{
    [SerializeField] List<Puzzle1Frame> puzzleFrames;  // Puzzle1Frame 스크립트가 붙은 오브젝트들의 리스트
    [SerializeField] List<int> targetDirection; // 각 퍼즐 프레임의 목표 회전 각도
    [SerializeField] GameObject clearItem; // 퍼즐 클리어 시 다음 아이템 지급
    [SerializeField] GameObject puzzle2Manager; // 퍼즐2 매니저

    // 오브젝트가 회전을 완료했을 때 호출되는 함수
    public void CheckPuzzleCompletion()
    {
        for (int i=0; i<puzzleFrames.Count; i++)
        {
            if (!puzzleFrames[i].HasReachedTargetRotation(targetDirection[i]))
            {
                return;
            }
        }

        // 모든 오브젝트가 목표 각도에 도달했을 경우
        OnPuzzleComplete();
    }

    // 퍼즐이 완료되었을 때 실행할 함수
    void OnPuzzleComplete()
    {
        Debug.Log("모든 오브젝트가 목표 각도에 도달했습니다! 퍼즐 완료!");
        clearItem.SetActive(true);
        puzzle2Manager.SetActive(true);
    }
}
