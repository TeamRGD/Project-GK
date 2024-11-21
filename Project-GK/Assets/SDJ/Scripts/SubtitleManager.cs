using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using DG.Tweening;

public class SubtitleManager : MonoBehaviour
{
    public static SubtitleManager instance;

    public TMP_Text subtitle;
    public TMP_Text subtitleOnOff;

    public List<string> testSubtitles;
    public List<float> testWaitSeconds;
    public List<AudioSource> testAudioSources;

    private WaitForSeconds waitForNextSubtitle;
    private WaitForSeconds waitForFadeOutSubtitle;

    private bool isTalking;
    void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        subtitle.gameObject.SetActive(false);
        waitForNextSubtitle = new WaitForSeconds(1.8f);
        waitForFadeOutSubtitle = new WaitForSeconds(0.2f);
        StartCoroutine(SubtitleInitiate(testSubtitles, testWaitSeconds, testAudioSources));

        isTalking = false;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public IEnumerator SubtitleInitiate(List<string> subtitles, List<float> waitSeconds, List<AudioSource> audios)
    {
        if (!isTalking) yield return null;
        subtitle.gameObject.SetActive(true);
        for (int i = 0; i < subtitles.Count; i++)
        {
            isTalking = true;
            audios[i].Play();
            subtitle.DOFade(1f, 0.2f).SetEase(Ease.OutSine);
            subtitle.text = subtitles[i];
            yield return new WaitForSeconds(waitSeconds[i]);
            subtitle.DOFade(0f, 0.2f).SetEase(Ease.InSine);
            yield return waitForFadeOutSubtitle;
        }
        isTalking = false;
        subtitle.gameObject.SetActive(false);
        yield return null;
    }

    public void EnableToolTip(string textScript)
    {
        subtitleOnOff.text = textScript;
        subtitleOnOff.DOFade(1f, 0.3f).SetEase(Ease.OutSine);
    }

    public void DisableToolTip()
    {
        subtitleOnOff.DOFade(0f, 0.3f).SetEase(Ease.InSine);
    }
}
