using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Subtitle : MonoBehaviour
{
    public List<string> subTitles = new List<string>(); // List를 사용하면 간단하게 요소 추가/삭제 가능
    public List<float> dubbingTime = new List<float>();
    public List<AudioSource> dubbingSound = new List<AudioSource>();
    [SerializeField] private bool isActive = false;

    [SerializeField] int dubbingSequence;

    private void OnTriggerEnter(Collider other)
    {
        if (other.transform.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
        {
            if (!isActive)
            {
                isActive = true;
                StartSubTitle(other.tag);
            }
        }

    }

    public void StartSubTitle(string player)
    {
        if (dubbingSequence == 11)
        {
            if (player == "PlayerWi")
            {
                subTitles[0] = "Wi: " + subTitles[0];
                dubbingSound.RemoveAt(1);
            }
            else if (player == "PlayerZard")
            {
                subTitles[0] = "Zard: " + subTitles[0];
                dubbingSound.RemoveAt(0);
            }
        } // S1_1

        else if (dubbingSequence == 12)
        {
            if (player == "PlayerWi")
            {
                subTitles[0] = "Wi: " + subTitles[0];
                dubbingSound.RemoveAt(1);
            }
            else if (player == "PlayerZard")
            {
                subTitles[0] = "Zard: " + subTitles[0];
                dubbingSound.RemoveAt(0);
            }
        } // S1_2

        else if (dubbingSequence == 3)
        {

        }

        StartCoroutine(SubtitleManager.instance.SubtitleInitiate(subTitles, dubbingTime, dubbingSound));
    }

    public void LoopSubTitle() // 반복하는 용도
    {
        StartCoroutine(SubtitleManager.instance.SubtitleInitiate(subTitles, dubbingTime, dubbingSound));
        RefreshActive();
    }

    public void RefreshActive()
    {
        isActive = false;
    }
}
