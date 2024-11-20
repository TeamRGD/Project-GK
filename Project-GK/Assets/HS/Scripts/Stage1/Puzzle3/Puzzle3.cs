using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Puzzle3 : MonoBehaviour
{
    PhotonView PV;

    private List<Drawer> drawerList;  // Drawer 스크립트가 붙어있는 서랍들의 리스트
    private List<Drawer> drawerFakeList;
    [SerializeField] GameObject StageClearWall;
    [SerializeField] Transform cabinetSetParent;   // 서랍들의 부모 오브젝트를 설정하는 Transform 변수
    [SerializeField] Transform fakeParent;

    // 클리어 이후에
    [SerializeField] Subtitle subtitle;
    [SerializeField] Outline ziplineOutline;

    [SerializeField] List<GameObject> stairDrawerList; // 스테이지 클리어 후 계단처럼 사용할 서랍들 리스트

    private void Awake()
    {
        PV = GetComponent<PhotonView>();
        drawerList = new List<Drawer>(cabinetSetParent.GetComponentsInChildren<Drawer>());
        drawerFakeList = new List<Drawer>(fakeParent.GetComponentsInChildren<Drawer>());
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

        for (int i=0; i<drawerFakeList.Count; i++)
        {
            drawerFakeList[i].CloseDrawer();
        }

        // 닫히는 사운드 추가
        yield return new WaitForSeconds(0.5f);
        // 열리는 사운드 추가

        for (int i=0; i< stairDrawerList.Count; i++)
        {
            if(stairDrawerList[i].TryGetComponent<Drawer>(out Drawer drawer))
            {
                drawer.SetDrawer(3, 0, 0);
                drawer.enabled = false;
                drawer.gameObject.tag = "Others"; // Drawer tag 제거로 플레이어 공격에 반응 안 하도록
            }
        }
        for (int i = 0; i < drawerList.Count; i++)
        {
            drawerList[i].enabled = false;
        }

        for (int i = 0; i < drawerFakeList.Count; i++)
        {
            drawerFakeList[i].enabled = false;
        }

        yield return null;
    }
}
