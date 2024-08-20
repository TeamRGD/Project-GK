using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Puzzle2 : MonoBehaviour
{
    [SerializeField] List<Light> lights;
    

    void Start()
    {
        SetOnLight(true);
    }

    void SetOnLight(bool state)
    {
        for (int i=0; i<lights.Count; i++)
        {
            lights[i].enabled = state;
        }
    }
}
