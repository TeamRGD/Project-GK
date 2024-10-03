using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Puzzle2 : MonoBehaviour
{
    [SerializeField] GameObject puzzle3Manager; // 퍼즐3 매니저
    [SerializeField] GameObject lamp; // 퍼즐3로 넘어가는 램프
    [SerializeField] Subtitle subtitle;

    PhotonView PV;

    private void Start()
    {
        PV = GetComponent<PhotonView>();
    }

    // 퍼즐이 완료되었을 때 실행할 함수
    public void OnPuzzleComplete()
    {
        PV.RPC("OnPuzzleCompleteRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void OnPuzzleCompleteRPC()
    {
        if (lamp.TryGetComponent<TarzanSwing2>(out TarzanSwing2 tarzanSwing2))
        {
            tarzanSwing2.ComeToPlayer();
        }
        gameObject.SetActive(false);

        subtitle.StartSubTitle("PlayerWi");
        puzzle3Manager.SetActive(true);
    }
}
