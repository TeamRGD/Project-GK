using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class CSLuDos: MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Camera.main.DOShakePosition(1f, 0.6f, 50, 90, true); //paste this
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
