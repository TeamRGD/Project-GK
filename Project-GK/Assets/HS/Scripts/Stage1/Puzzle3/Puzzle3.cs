using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Puzzle3 : MonoBehaviour
{
    PhotonView PV;

    private List<Drawer> drawerList;  // Drawer 스크립트가 붙어있는 서랍들의 리스트
    private List<Drawer> drawerAnswerList;
    [SerializeField] GameObject StageClearWall;
    [SerializeField] Transform cabinetSetParent;   // 서랍들의 부모 오브젝트를 설정하는 Transform 변수
    [SerializeField] Transform answerParent;

    // 클리어 이후에
    [SerializeField] Subtitle subtitle;
    [SerializeField] Outline ziplineOutline;
    [SerializeField] GameObject ziplineTrigger;

    [SerializeField] List<GameObject> stairDrawerList; // 스테이지 클리어 후 계단처럼 사용할 서랍들 리스트

    private void Awake()
    {
        PV = GetComponent<PhotonView>();
        drawerList = new List<Drawer>(cabinetSetParent.GetComponentsInChildren<Drawer>());
        drawerAnswerList = new List<Drawer>(answerParent.GetComponentsInChildren<Drawer>());
    }

    [PunRPC]
    void WallRPC()
    {
        StageClearWall.SetActive(false);
        ziplineOutline.enabled = true;
    }

    public IEnumerator OnPuzzleComplete()
    {
        PV.RPC("WallRPC", RpcTarget.AllBuffered);
        subtitle.StartSubTitle("PlayerWi");

        StageClearWall.SetActive(false);
        // 퍼즐 완료 시 추가적인 동작을 여기에 추가

        ziplineOutline.enabled = true;
        //subtitle.StartSubTitle();
        

        for (int i = 0; i < drawerList.Count; i++)
        {
            drawerList[i].CloseDrawer();
        }

        for (int i=0; i<drawerAnswerList.Count; i++)
        {
            drawerAnswerList[i].CloseDrawer();
        }

        // 닫히는 사운드 추가
        yield return new WaitForSeconds(0.3f);
        // 열리는 사운드 추가

        for (int i=0; i< stairDrawerList.Count; i++)
        {
            if(stairDrawerList[i].TryGetComponent<Drawer>(out Drawer drawer))
            {
                drawer.OpenDrawer();
                drawer.OpenDrawer();
                drawer.enabled = false;
                drawer.gameObject.tag = "Others";
            }
        }
        for (int i = 0; i < drawerList.Count; i++)
        {
            drawerList[i].enabled = false;
        }

        for (int i = 0; i < drawerAnswerList.Count; i++)
        {
            drawerAnswerList[i].enabled = false;
        }

        yield return null;
    }
}
