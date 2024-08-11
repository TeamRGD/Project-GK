using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RoomMenu : MonoBehaviour
{
    public AudioSource backButton;
    public AudioSource startButton;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void OnHoverBack()
    {
        backButton.Play();
    }

    public void OnHoverStart()
    {
        startButton.Play();
    }
}
