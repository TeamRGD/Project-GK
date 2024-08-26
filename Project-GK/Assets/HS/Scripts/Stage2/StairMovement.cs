using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class StairMovement : MonoBehaviour
{
    bool isAppear;

     public void Move()
    {
        if(isAppear)
        {
            isAppear = !isAppear;
            transform.Translate(new Vector3(3, 0, 0), Space.Self);
        }
        else
        {
            isAppear = !isAppear;
            transform.Translate(new Vector3(-3, 0, 0), Space.Self);
        }
    }
}
