using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using TMPro;

public class StartMenu : MonoBehaviour
{
    public TextMeshProUGUI pressStart;

    // Start is called before the first frame update
    void Start()
    {
        pressStart.DOFade(0.1f, 1f).SetEase(Ease.InOutSine).SetLoops(-1, LoopType.Yoyo);
    }
}
