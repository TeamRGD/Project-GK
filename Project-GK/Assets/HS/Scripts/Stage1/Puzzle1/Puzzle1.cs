using UnityEngine;
using System.Collections.Generic;
using Photon.Pun;

public class Puzzle1 : MonoBehaviour
{
    [SerializeField] List<Puzzle1Frame> puzzleFrames;  // Puzzle1Frame 스크립트가 붙은 오브젝트들의 리스트
    [SerializeField] List<int> targetDirection; // 각 퍼즐 프레임의 목표 회전 각도
    [SerializeField] GameObject clearItem; // 퍼즐 클리어 시 다음 아이템 지급
    [SerializeField] GameObject puzzle2Manager; // 퍼즐2 매니저
    [SerializeField] GameObject lamp; // 퍼즐2로 넘어가는 램프
    [SerializeField] Subtitle subtitle; // 퍼즐2 클리어시 나오는 자막

    PhotonView PV;

    private void Start()
    {
        PV = GetComponent<PhotonView>();
    }

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

    
    [PunRPC]
    void OnPuzzleCompleteRPC()
    {
        clearItem.SetActive(true);
        if (lamp.TryGetComponent<TarzanSwing>(out TarzanSwing tarzanSwing))
        {
            tarzanSwing.ComeToPlayer();
        }

        gameObject.SetActive(false);
        subtitle.StartSubTitle("PlayerWi");
        puzzle2Manager.SetActive(true);
    }

    void OnPuzzleComplete() // 퍼즐 완료 함수
    {
        PV.RPC("OnPuzzleCompleteRPC", RpcTarget.AllBuffered);
    }
}
