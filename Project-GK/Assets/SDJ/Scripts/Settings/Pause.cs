using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class Pause : MonoBehaviour
{
    public GameObject pauseContainer;
    public GameObject settingsContainer;
    public GameObject leaveGameContainer;

    // Start is called before the first frame update
    void Start()
    {
        pauseContainer.SetActive(false);
        settingsContainer.SetActive(false);
        leaveGameContainer.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            PauseOn();
        }
    }

    public void PauseOn()
    {
        pauseContainer.SetActive(true);
        settingsContainer.SetActive(false);
        leaveGameContainer.SetActive(false);
    }

    public void PauseOff()
    {
        pauseContainer.SetActive(false);
        settingsContainer.SetActive(false);
        leaveGameContainer.SetActive(false);
    }
    public void SettingsOn()
    {
        pauseContainer.SetActive(false);
        settingsContainer.SetActive(true);
        leaveGameContainer.SetActive(false);
    }

    public void HowAboutLeaveGame()
    {
        pauseContainer.SetActive(false);
        settingsContainer.SetActive(false);
        leaveGameContainer.SetActive(true);
    }

    public void LeaveGameOff()
    {
        pauseContainer.SetActive(false);
        settingsContainer.SetActive(false);
        leaveGameContainer.SetActive(false);
    }

    public void OnHoverEnter(TMP_Text innerText)
    {
        print(innerText.text);
        innerText.DOFade(1f, 0.2f).SetEase(Ease.OutSine);
    }

    public void OnHoverExit(TMP_Text innerText)
    {
        innerText.DOFade(0.1f, 0.2f).SetEase(Ease.OutSine);
    }
}
