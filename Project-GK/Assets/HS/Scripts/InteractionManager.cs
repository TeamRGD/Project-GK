using Photon.Pun;
using System.Collections.Generic;
using UnityEngine;

public class InteractionManager : MonoBehaviour
{
    // 오픈할 UI를 찾기 위해 Tag들을 비교하는 함수.
    public void CheckForTags(RaycastHit hitInfo)
    {
        if (hitInfo.collider.CompareTag("Note"))
        {
            Puzzle1Note.ActiveUI(); // -> 여기서 에러가 생기는 느낌임.
            // 뭔가 보안상 싱글톤 안 쓰는게 좋을 거 같은데 이게 편해서 씀.
        }

        if (hitInfo.collider.CompareTag("Stair"))
        {
            // 이동식 발판
        }
    }
}
