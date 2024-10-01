using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Subtitle1 : MonoBehaviour
{
    public string[] subTitles;
    private bool isActive = false;

    private void OnTriggerEnter(Collider other)
    {
        if (other.transform.CompareTag("PlayerWi"))
        {
            if (!isActive)
            {
                StartSubTitle();
                isActive = true;
            }
        }

    }

    void StartSubTitle()
    {
        StartCoroutine(SubtitleManager.instance.SubtitleInitiate(subTitles));
    }
}
