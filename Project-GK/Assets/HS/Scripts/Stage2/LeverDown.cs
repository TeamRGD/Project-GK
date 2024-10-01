using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeverDown : MonoBehaviour
{
    bool isDown = false;
    RotateObjectByAngle leverHandle;
    [SerializeField] EVDown EV;
    [SerializeField] int levelStep; // 몇 번째 레버인지
    [SerializeField] List<Transform> carrierStep; //  인덱스 0번: 1번째 버튼 누르는 위치 1번: 2번째 버튼 누르는 위치 2번: 3번째 버튼 누르는 위치
    [SerializeField] AudioSource leverSound;

    private void Start()
    {
        leverHandle = GetComponentInChildren<RotateObjectByAngle>();
    }

    public void UseLever()
    {
        if(!isDown)
        {
            leverSound.Play();
            leverHandle.RotateX(-60f);
            isDown = true;
            this.gameObject.layer = 0;
             
            if(levelStep < 3)
            {
                StartCoroutine(EV.MoveCarrier(carrierStep[levelStep]));
            }
            
            else if (levelStep == 3)
            {
                // 컷씬 실행 문구
            }

            this.gameObject.layer = 0;
        }
    }

    
}
