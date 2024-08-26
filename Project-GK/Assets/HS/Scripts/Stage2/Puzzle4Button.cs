using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle4Button : MonoBehaviour
{
    [SerializeField] List<StairMovement> stairs; // 오브젝트 별로 계단을 따로 배치한다.

    public void UseButton()
    {
        for(int i=0; i<stairs.Count; i++)
        {
            stairs[i].Move();
        }
    }
}
