using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Subtitle : MonoBehaviour
{
    public string[] subTitles;
    [SerializeField] private bool isActive = false;

    private void OnTriggerEnter(Collider other)
    {
        if (other.transform.CompareTag("PlayerWi") || other.transform.CompareTag("PlayerZard"))
        {
            if (!isActive)
            {
                isActive = true;
                StartSubTitle();
            }
        }

    }

    public void StartSubTitle()
    {
        StartCoroutine(SubtitleManager.instance.SubtitleInitiate(subTitles));
    }

    public void LoopSubTitle() // 반복하는 용도
    {
        StartCoroutine(SubtitleManager.instance.SubtitleInitiate(subTitles));
        RefreshActive();
    }

    public void RefreshActive()
    {
        isActive = false;
    }
}
