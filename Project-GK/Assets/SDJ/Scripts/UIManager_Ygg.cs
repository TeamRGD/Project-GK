using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using TMPro;

public class UIManager_Ygg : MonoBehaviour
{
    public GameObject boss;
    private int patternCode;

    public GameObject inputCipherDisplay;
    public GameObject inputCipherEnter;

    public RectTransform inputCipherDisplayTarget;
    public RectTransform inputCipherEnterTarget;


    public TextMeshProUGUI inputField;
    public Button inputButton;

    private int playerAttackCount;

    void Start()
    {
        patternCode = 1234;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.K))
        {
            ActivateCipher();
        }
        if (Input.GetKeyDown(KeyCode.L))
        {
            DeactivateCipher();
        }
    }


    void ActivateCipher()
    {
        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(1, 0.15f);
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(1, 0.15f);
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPos3DY(inputCipherDisplayTarget.anchoredPosition.y, 0.15f).SetEase(Ease.OutSine).OnStart(() => inputCipherDisplay.gameObject.SetActive(true));
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPos3DY(inputCipherEnterTarget.anchoredPosition.y, 0.15f).SetEase(Ease.OutSine).OnStart(() => inputCipherEnter.gameObject.SetActive(true));
    }

    void DeactivateCipher()
    {
        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(0, 0.15f);
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(0, 0.15f);
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPos3DY(0f, 0.15f).SetEase(Ease.OutSine).OnComplete(() => inputCipherDisplay.gameObject.SetActive(false));
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPos3DY(0f, 0.15f).SetEase(Ease.OutSine).OnComplete(() => inputCipherEnter.gameObject.SetActive(false));
    }

    public void InputNumber(int num)
    {
        inputField.text += num.ToString();
    }

    public void CheckCipher()
    {
        if (inputField.text == patternCode.ToString())
        {
            Debug.Log("That's Right!");
            inputField.DOColor(Color.green, 0.2f).SetEase(Ease.OutSine);
        }
        else
        {
            Debug.Log("Nope");
            inputField.DOColor(Color.red, 0.2f).SetEase(Ease.OutSine);
            inputField.DOColor(Color.white, 0.2f).SetEase(Ease.OutSine).SetDelay(0.2f);
        }
    }

    public void ResetCipher()
    {
        inputField.text = "";
    }
}
