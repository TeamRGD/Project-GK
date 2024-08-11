using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class AudioManager : MonoBehaviour
{
    public static AudioManager instance;

    public AudioSource[] stage1BGM;


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
        
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            PlayBGMStage1(0);
        }
        if (Input.GetKeyDown(KeyCode.T))
        {
            PlayBGMStage1(1);
        }
        if (Input.GetKeyDown(KeyCode.V))
        {
            EndBGMStage1(0);
        }
        if (Input.GetKeyDown(KeyCode.B))
        {
            EndBGMStage1(1);
        }
    }

    public void PlayBGMStage1(int index)
    {
        stage1BGM[index].volume = 1.0f;
        stage1BGM[index].enabled = true;
    }

    public void EndBGMStage1(int index)
    {
        stage1BGM[index].DOFade(0f, 2f).OnComplete(() => stage1BGM[index].enabled = false);
    }
}
