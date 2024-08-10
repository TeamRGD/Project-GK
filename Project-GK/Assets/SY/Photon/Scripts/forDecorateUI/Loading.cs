using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class Loading : MonoBehaviour
{
    public TextMeshProUGUI loadingText;

    private WaitForSeconds waitSomeTime;
    private 

    // Start is called before the first frame update
    void Start()
    {
        waitSomeTime = new WaitForSeconds(0.5f);
        StartCoroutine(loadingCoroutine());
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    IEnumerator loadingCoroutine()
    {
        while (true)
        {
            loadingText.text = "Loading";
            for (int i = 0; i < 3; i++) 
            {
                loadingText.text += ".";
                yield return waitSomeTime;
            }
        }
    }
}
