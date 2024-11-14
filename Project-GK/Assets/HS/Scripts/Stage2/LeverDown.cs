using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class LeverDown : MonoBehaviour
{
    PhotonView PV;
    bool isDown = false;
    RotateObjectByAngle leverHandle;
    [SerializeField] EVDown EV;
    [SerializeField] int levelStep; // 몇 번째 레버인지
    [SerializeField] List<Transform> carrierStep; //  인덱스 0번: 1번째 버튼 누르는 위치 1번: 2번째 버튼 누르는 위치 2번: 3번째 버튼 누르는 위치
    [SerializeField] AudioSource leverSound;
    [SerializeField] GameObject cutSceneTrigger;

    private void Start()
    {
        PV = GetComponent<PhotonView>();
        leverHandle = GetComponentInChildren<RotateObjectByAngle>();
    }

    public void UseLever()
    {
        if(!isDown)
        {
            leverSound.Play();
            
            isDown = true;
            this.gameObject.layer = 0;
             
            if(levelStep < 3)
            {
                PV.RPC("UseLeverRPC", RpcTarget.AllBuffered);
            }
            
            else if (levelStep == 3)
            {
                // 컷씬 실행 문구
            }

            this.gameObject.layer = 0;
        }
    }

    [PunRPC]
    void RotateLeverHandleRPC()
    {
        leverHandle.RotateX(-60f);
    }

    [PunRPC]
    void UseLeverRPC()
    {
        StartCoroutine(EV.MoveCarrier(carrierStep[levelStep]));
    }
}
