using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Puzzle4 : MonoBehaviour
{
    [SerializeField] GameObject puzzle5Manager;

    void PuzzleClear()
    {
        gameObject.SetActive(false);
        puzzle5Manager.SetActive(true);
    }
}
