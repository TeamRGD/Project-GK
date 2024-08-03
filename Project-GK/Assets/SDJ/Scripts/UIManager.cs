using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using TMPro;

public class UIManager : MonoBehaviour
{
    public Image titleLogo;
    public TextMeshProUGUI pressAnyKey;
    public GameObject buttonContainer;

    void Start()
    {
        buttonContainer.SetActive(false);
        pressAnyKey.DOFade(0.1f, 1f).SetLoops(-1, LoopType.Yoyo);
    }

    void Update()
    {
        if (Input.anyKey)
        {
            pressAnyKey.DOPause();
            pressAnyKey.enabled = false;
            buttonContainer.SetActive(true);
        }
    }
}
