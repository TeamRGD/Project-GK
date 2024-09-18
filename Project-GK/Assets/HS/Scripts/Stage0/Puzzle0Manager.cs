using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle0Manager : MonoBehaviour
{
    [SerializeField] Outline[] objectSequence; // 오브젝트 
    int sequenceLevel = 0;

    public void PuzzleProgress()
    {
        objectSequence[sequenceLevel].enabled = false;
        sequenceLevel += 1;
        objectSequence[sequenceLevel].enabled = true;
        Debug.Log("sequenceLevel: " + sequenceLevel);
    }
}
