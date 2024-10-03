using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle0Manager : MonoBehaviour
{
    [SerializeField] GameObject guard;
    [SerializeField] GameObject guard2;
    [SerializeField] GameObject guard3;
    int sequenceLevel = 0;

    public void PuzzleProgress()
    {
        sequenceLevel += 1;
        if (sequenceLevel == 2)
        {
            guard.SetActive(true);
            guard2.SetActive(true);
            guard3.SetActive(true);
        }
    }
}
