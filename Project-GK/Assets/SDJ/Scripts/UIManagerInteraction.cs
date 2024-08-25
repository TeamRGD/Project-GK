using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using TMPro;
using System.Collections;

public class UIManagerInteraction : MonoBehaviour
{
    // for Singleton Pattern
    public static UIManagerInteraction Instance;

    public GameObject inputCipherDisplay;
    public GameObject inputCipherEnter;
    public GameObject enterButton1;
    public GameObject enterButton2;

    public TextMeshProUGUI inputField;
    public Button inputButton;

    public GameObject SFXContainer;
    private AudioSource[] paperSFXs;
    public GameObject[] papers;

    UIManager_Player uiManager;

    // CuriHuS
    Puzzle2Book puzzle2Book;
    Puzzle3Cipher puzzle3Cipher;

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
        paperSFXs = SFXContainer.GetComponents<AudioSource>();
        for (int i = 0; i < papers.Length; i++)
        {
            papers[i].SetActive(false);
        }
        uiManager = FindObjectOfType<UIManager_Player>();
        puzzle2Book = FindAnyObjectByType<Puzzle2Book>();
        puzzle3Cipher = FindAnyObjectByType<Puzzle3Cipher>();
    }

    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.G))
        //{
        //    PopUpPaper(4);
        //}
        //if (Input.GetKeyUp(KeyCode.G))
        //{
        //    PopDownPaper(4);
        //}

        //if (Input.GetKeyDown(KeyCode.Y))
        //{
        //    ActivateCipher(1);
        //}

        //if (Input.GetKeyDown(KeyCode.U))
        //{
        //    ActivateCipher(2);
        //}
        //if (Input.GetKeyDown(KeyCode.T))
        //{
        //    DeactivateCipher();
        //}
    }

    //------------Cipher--------------
    public void ActivateCipher(int index = 1)
    {
        ResetCipher();
        if (index == 1)
        {
            enterButton1.SetActive(true);
            enterButton2.SetActive(false);
        } else if (index == 2) 
        {
            enterButton1.SetActive(false);
            enterButton2.SetActive(true);
        }

        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(1, 0.15f);
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(1, 0.15f);
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPosY(120f, 0.15f).SetEase(Ease.OutSine).OnStart(() => inputCipherDisplay.gameObject.SetActive(true));
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPosY(-200f, 0.15f).SetEase(Ease.OutSine).OnStart(() => inputCipherEnter.gameObject.SetActive(true));

        uiManager.interactionNotice.gameObject.SetActive(false);
    }

    public void DeactivateCipher()
    {
        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(0, 0.15f);
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(0, 0.15f);
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPosY(0f, 0.15f).SetEase(Ease.OutSine).OnComplete(() => inputCipherDisplay.gameObject.SetActive(false));
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPosY(0f, 0.15f).SetEase(Ease.OutSine).OnComplete(() => inputCipherEnter.gameObject.SetActive(false));

        uiManager.interactionNotice.gameObject.SetActive(true);
    }

    public void InputNumber(int num)
    {
        inputField.text += num.ToString();
    }

    public void CheckCipher(int code)
    {
        if (inputField.text == code.ToString())
        {
            inputField.DOColor(Color.green, 0.2f).SetEase(Ease.OutSine);
            if (enterButton1.activeSelf)
            {
                puzzle2Book.DisableAndEnableNew();
            }
            else
            {
                puzzle3Cipher.DisableAndEnable();
            }
        }
        else
        {
            
            inputField.DOColor(Color.red, 0.2f).SetEase(Ease.OutSine);
            inputField.text = "WRONG";

        }
    }

    public IEnumerator ResetCipherWithDelay()
    {
        yield return new WaitForSeconds(0.5f);
        ResetCipher();
        yield return null;
    }

    public void ResetCipher()
    {
        inputField.text = "";
        inputField.color = Color.white;
    }

    //------------Paper--------------
    public void PopUpPaper(int index)
    {
        for (int i = 0; i < paperSFXs.Length; i++)
        {
            int randint = Random.Range(0, paperSFXs.Length);
            paperSFXs[randint].Play();
        }
        papers[index].transform.DOScale(Vector3.one * 0.8f, 0.15f).SetEase(Ease.OutSine).OnStart(() => papers[index].SetActive(true));
    }

    public void PopDownPaper(int index)
    {
        for (int i = 0; i < paperSFXs.Length; i++)
        {
            int randint = Random.Range(0, paperSFXs.Length);
            paperSFXs[randint].Play();
        }
        papers[index].transform.DOScale(Vector3.zero, 0.15f).SetEase(Ease.InSine).OnComplete(() => papers[index].SetActive(false));
    }
}
