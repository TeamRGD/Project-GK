using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnterRoomMenu : MonoBehaviour
{
    public AudioSource backButton;
    public AudioSource doneButton;

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
        doneButton.Play();
    }
}
