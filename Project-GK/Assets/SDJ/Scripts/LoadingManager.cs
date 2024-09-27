using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class LoadingManager : MonoBehaviour
{
    public Image loadingBackground;
    public TMP_Text loadingDescription;

    public int loadingIndex;

    public Sprite[] loadingImages;
    public string[] loadingDescriptions;

    // Start is called before the first frame update
    void Start()
    {
        loadingBackground.sprite = loadingImages[loadingIndex];
        loadingDescription.text = loadingDescriptions[loadingIndex];
    }
}
