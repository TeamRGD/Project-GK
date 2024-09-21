using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle0Manager : MonoBehaviour
{
    [SerializeField] Outline[] objectSequence; // 오브젝트 
    [SerializeField] GameObject guard;
    int sequenceLevel = 0;

    public void PuzzleProgress()
    {
        objectSequence[sequenceLevel].enabled = false;
        sequenceLevel += 1;
        if (sequenceLevel == 2)
        {
            guard.SetActive(true);
        }
        objectSequence[sequenceLevel].enabled = true;
        Debug.Log("sequenceLevel: " + sequenceLevel);
    }
}
