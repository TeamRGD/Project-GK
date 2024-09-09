using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LeverDown : MonoBehaviour
{
    bool isDown = false;
    RotateObjectByAngle levelHandle;
    [SerializeField] EVDown EV;
    [SerializeField] int levelStep; // 몇 번째 레버인지
    [SerializeField] List<Transform> carrierStep; //  인덱스 0번: 1번째 버튼 누르는 위치 1번: 2번째 버튼 누르는 위치 2번: 3번째 버튼 누르는 위치

    private void Start()
    {
        levelHandle = GetComponentInChildren<RotateObjectByAngle>();
    }

    public void UseLever()
    {
        if(!isDown)
        {
            levelHandle.RotateX(-60f);
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
        }
    }

    
}
