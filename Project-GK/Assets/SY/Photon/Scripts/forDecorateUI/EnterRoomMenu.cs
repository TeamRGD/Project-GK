using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class EnterRoomMenu : MonoBehaviour
{
    public AudioSource backButtonSFX;
    public AudioSource doneButtonSFX;

    public TMP_InputField roomCodeInputField;
    public Image doneButton;
    public TMP_Text doneButtonText;

    // Start is called before the first frame update
    void Start()
    {
        doneButton.DOFade(0.3f, 0.01f).SetEase(Ease.OutSine);
        doneButtonText.DOFade(0.5f, 0.01f).SetEase(Ease.OutSine);
    }

    public void OnHoverBack()
    {
        //backButtonSFX.Play();
    }

    public void OnHoverStart()
    {
        //doneButtonSFX.Play();
    }

    public void OnValueChange()
    {
        if (roomCodeInputField.text == "")
        {
            doneButton.DOFade(0.1f, 0.2f).SetEase(Ease.OutSine);
            doneButtonText.DOFade(0.5f, 0.2f).SetEase(Ease.OutSine);
        }
        else
        {
            doneButton.DOFade(0.4f, 0.2f).SetEase(Ease.OutSine);
            doneButtonText.DOFade(1f, 0.2f).SetEase(Ease.OutSine);
        }
    }
}
