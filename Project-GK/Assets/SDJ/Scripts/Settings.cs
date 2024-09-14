using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class Settings : MonoBehaviour
{
    public AudioMixer masterMixer;
    public Slider masterSlider;
    public Slider bgmSlider;
    public Slider sfxSlider;
    // Start is called before the first frame update
    void Start()
    {
        //masterSlider.value = 0;
        //bgmSlider.value = 0;
        //sfxSlider.value = 0;

        Preset();
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void masterAudioControl()
    {
        float value = masterSlider.value;
        bgmSlider.value = value;
        sfxSlider.value = value;
        if (value == 1)
        {
            masterMixer.SetFloat("Master", value * -80f);
        }
        else
        {
            masterMixer.SetFloat("Master", value * -20f);
        }
        PlayerPrefs.SetFloat("MasterVolume", value);
    }

    public void bgmAudioControl()
    {
        float value = bgmSlider.value;
        if (value == 1)
        {
            masterMixer.SetFloat("BGM", value * -80f);
        }
        else
        {
            masterMixer.SetFloat("BGM", value * -20f);
        }
        PlayerPrefs.SetFloat("bgmVolume", value);
    }

    public void sfxAudioControl()
    {
        float value = sfxSlider.value;
        if (value == 1)
        {
            masterMixer.SetFloat("SFX", value * -80f);
        }
        else
        {
            masterMixer.SetFloat("SFX", value * -20f);
        }

        PlayerPrefs.SetFloat("sfxVolume", value);
    }
    public void Preset()
    {
        masterSlider.value = PlayerPrefs.GetFloat("MasterVolume");
        bgmSlider.value = PlayerPrefs.GetFloat("bgmVolume");
        sfxSlider.value = PlayerPrefs.GetFloat("sfxVolume");
        masterAudioControl();
        bgmAudioControl();
        sfxAudioControl();
    }
}
