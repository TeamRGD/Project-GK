using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using TMPro;
using System;

public class UIManager_Ygg : MonoBehaviour
{
    // for Singleton Pattern
    public static UIManager_Ygg Instance;

    // Get default Prefabs
    public GameObject boss;
    private GameObject player;

    // Variables being used in pattern1 logic
    public int patternCode;

    public GameObject inputCipherDisplay;
    public GameObject inputCipherEnter;

    public TextMeshProUGUI inputField;
    public Button inputButton;


    // Variables being used in pattern2 logic
    public TextMeshProUGUI areaNumText;


    // Variables being used in pattern3 logic
    public GameObject attackNodeContainer;
    private int playerAttackCount;

    // for Singleton Pattern (Don't know meaning but everyone uses this)
    void Awake()
    {
        if (Instance == null) 
        { 
            Instance = this;
        }
        else
        {
            Destroy(this.gameObject);
        }
    }

    void Start()
    {
        patternCode = 1234;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.V))
        {
            ActivateCipher();
        }
        if (Input.GetKeyDown(KeyCode.B))
        {
            DeactivateCipher();
        }

        if (Input.GetKeyDown(KeyCode.N))
        {
            EnableAreaNum();
        }
        if (Input.GetKeyDown(KeyCode.M))
        {
            DisableAreaNum();
        }

        if(Input.GetKeyDown(KeyCode.Z))
        {
            EnableAttackNode();
        }
        if(Input.GetKeyDown(KeyCode.X))
        {
            DisableAttackNode();
        }
        if (Input.GetKeyDown(KeyCode.C))
        {
            NodeDeduction();
        }
    }

    //------------PATTERN 1--------------
    void ActivateCipher()
    {
        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(1, 0.15f);
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(1, 0.15f);
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPos3DY(150f, 0.15f).SetEase(Ease.OutSine).OnStart(() => inputCipherDisplay.gameObject.SetActive(true));
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPos3DY(-200f, 0.15f).SetEase(Ease.OutSine).OnStart(() => inputCipherEnter.gameObject.SetActive(true));

        GameObject.Find("Wi(Clone)").GetComponent<PlayerController>().CursorOn();
        GameObject.Find("Zard(Clone)").GetComponent<PlayerController>().CursorOn();
    }

    void DeactivateCipher()
    {
        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(0, 0.15f);
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(0, 0.15f);
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPos3DY(0f, 0.15f).SetEase(Ease.OutSine).OnComplete(() => inputCipherDisplay.gameObject.SetActive(false));
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPos3DY(0f, 0.15f).SetEase(Ease.OutSine).OnComplete(() => inputCipherEnter.gameObject.SetActive(false));

        GameObject.Find("Wi(Clone)").GetComponent<PlayerController>().CursorOff();
        GameObject.Find("Zard(Clone)").GetComponent<PlayerController>().CursorOff();
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
            boss.GetComponent<Boss1>().IsCorrect = true;
        }
        else
        {
            Debug.Log("Nope");
            inputField.DOColor(Color.red, 0.2f).SetEase(Ease.OutSine);
            inputField.DOColor(Color.white, 0.2f).SetEase(Ease.OutSine).SetDelay(0.2f);
            boss.GetComponent<Boss1>().IsCorrect = false;
        }
    }

    public void ResetCipher()
    {
        inputField.text = "";
    }

    //------------PATTERN 2--------------
    public void EnableAreaNum()
    {
        areaNumText.DOFade(1, 0.25f).SetEase(Ease.OutSine).OnStart(() => areaNumText.enabled = true);
    }

    public void SetAreaNum(int num)
    {
        areaNumText.text = "Area " + num.ToString();
    }

    public void DisableAreaNum()
    {
        areaNumText.DOFade(0, 0.25f).SetEase(Ease.OutSine).OnComplete(() => areaNumText.enabled = false);
    }

    //------------PATTERN 3--------------
    public void EnableAttackNode()
    {
        playerAttackCount = 0;
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(1, 0.2f).SetEase(Ease.OutSine).OnStart(() => attackNodeContainer.SetActive(true));
    }

    public void NodeDeduction()
    {
        Image node = attackNodeContainer.GetComponent<RectTransform>().GetChild(playerAttackCount).GetComponent<Image>();
        node.DOFade(0, 0.15f);
        playerAttackCount++;
    }

    public void DisableAttackNode()
    {
        playerAttackCount = 0;
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(1, 0.2f).SetEase(Ease.OutSine).OnComplete(() => attackNodeContainer.SetActive(false));
    }
}
