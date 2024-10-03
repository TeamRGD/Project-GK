using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Video;


public class CutScenePlay : MonoBehaviour
{
    public VideoPlayer cutScenePlayer;

    private bool triggered;
    // Start is called before the first frame update
    void Start()
    {
        triggered = false;
    }

    // Update is called once per frame
    void Update()
    {

    }

    void PlayCutScene()
    {
        cutScenePlayer.Play();
    }

    void OnTriggerEnter(Collider other)
    {
        if ((other.CompareTag("PlayerWi") || other.CompareTag("PlayerZard")) && !triggered)
        {
            triggered = true;
            PlayCutScene();
        }
    }
}