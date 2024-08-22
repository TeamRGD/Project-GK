using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle3 : MonoBehaviour
{
    private List<Drawer> drawerList;  // Drawer 스크립트가 붙어있는 서랍들의 리스트
    private List<Drawer> drawerAnswerList; // drawer 중 정답 서랍 리스트
    [SerializeField] Transform cabinetSetParent;   // 서랍들의 부모 오브젝트를 설정하는 Transform 변수
    [SerializeField] Transform answerParent;

    [SerializeField] List<GameObject> stairDrawerList; // 스테이지 클리어 후 계단처럼 사용할 서랍들 리스트
    private void Start()
    {
        drawerList = new List<Drawer>(cabinetSetParent.GetComponentsInChildren<Drawer>());
        drawerAnswerList = new List<Drawer>(answerParent.GetComponentsInChildren<Drawer>());

        for (int i=0; i<drawerAnswerList.Count; i++)
        {
            drawerAnswerList[i].Start();
        }
        for (int i = 0; i < drawerList.Count; i++)
        {
            drawerList[i].Start();
        }
    }

    public void CheckPuzzleComplete()
    {
        for (int i=0; i<drawerList.Count; i++)
        {
            if (drawerList[i].isOpen)
            {
                return;
            }
        }

        for (int i=0; i<drawerAnswerList.Count; i++)
        {
            if(!drawerAnswerList[i].isOpen)
            {
                return;
            }
        }

        // 모든 조건이 충족되면 퍼즐 완료
        StartCoroutine(OnPuzzleComplete());
    }

    // 퍼즐 완성 시 실행할 함수
    IEnumerator OnPuzzleComplete()
    {
        Debug.Log("Puzzle3 Complete!");
        // 퍼즐 완료 시 추가적인 동작을 여기에 추가
        for (int i = 0; i < drawerAnswerList.Count; i++)
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

            }
        }

        for (int i=0; i<drawerAnswerList.Count; i++)
        {
            drawerAnswerList[i].enabled = false;
        }

        for (int i = 0; i < drawerList.Count; i++)
        {
            drawerList[i].enabled = false;
        }

        yield return null;
    }
}
