using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class stage1 : MonoBehaviour
{
    [SerializeField]
    GameObject passwordUI;

    void OpenPasswordInput()
    {
        passwordUI.SetActive(true);
    }

    void ClosePasswordInput()
    {
        passwordUI.SetActive(true);
    }
}
