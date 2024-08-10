using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class TitleMenu : MonoBehaviour
{
    public RectTransform buttonContainer;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    void OnDisable()
    {
        buttonContainer.anchoredPosition = new Vector2(0, -300f);
    }

    void OnEnable()
    {
        buttonContainer.DOAnchorPosY(0f, 0.5f).SetEase(Ease.OutBack);
    }
}
