using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FadeInOut : MonoBehaviour
{
    public static FadeInOut instance;
    public Image fader;

    public bool initialState;

    // Start is called before the first frame update
    void Awake()
    {
        if (instance == null)
        {
            instance = this;
        } else
        {
            Destroy(this);
        }
    }

    void Start()
    {
        Color color = fader.color;
        if (initialState) color.a = 1f;
        else if (!initialState) color.a = 0f;
        fader.color = color;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Q))
        {
            FadeIn(1f);
        }  
        if (Input.GetKeyDown(KeyCode.E))
        {
            FadeOut(1f);
        }
    }

    public void FadeIn(float duration)
    {
        fader.DOFade(0f, duration).SetEase(Ease.OutSine);
    }

    public void FadeOut(float duration)
    {
        fader.DOFade(1f, duration).SetEase(Ease.InSine);
    }
}
