using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using TMPro;
using System.Collections;
using Photon.Pun;
using Unity.Properties;

public class UIManager_Ygg : MonoBehaviour
{
    // for Singleton Pattern
    public static UIManager_Ygg Instance;

    // Get default Prefabs
    public GameObject boss;

    // Variables being used in default situation
    public Image bossHealthBar;

    // Variables being used in pattern1 logic
    public CanvasGroup hint;
    public bool isCorrectedPrevCode;
    public TextMeshProUGUI aggroText;
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
    UIManager_Player uiManager;
    PhotonView PV;

    public GameObject cutSceneForYgg;

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
        TryGetComponent<PhotonView>(out PV);
    }

    void Start()
    {
        //cutSceneForYgg.SetActive(false);
        uiManager = FindObjectOfType<UIManager_Player>();
        patternCode = 1234;
        isCorrectedPrevCode = false;
    }

    void Update()
    {
        //if (Input.GetKeyDown(KeyCode.V))
        //{
        //    ActivateCipher();
        //}
        //if (Input.GetKeyDown(KeyCode.Escape))
        //{
        //    DeactivateCipher();
        //}

        //if (Input.GetKeyDown(KeyCode.N))
        //{
        //    EnableAreaNum();
        //}
        //if (Input.GetKeyDown(KeyCode.M))
        //{
        //    DisableAreaNum();
        //}

        //if (Input.GetKeyDown(KeyCode.Z))
        //{
        //    EnableAttackNode();
        //}
        //if (Input.GetKeyDown(KeyCode.X))
        //{
        //    DisableAttackNode();
        //}
        //if (Input.GetKeyDown(KeyCode.C))
        //{
        //    NodeDeduction();
        //}

        //if (Input.GetKeyDown(KeyCode.Alpha1))
        //{
        //    EnableHint();
        //    }
        //if (Input.GetKeyDown(KeyCode.Alpha2))
        //{
        //    DisableHint();
        //}

        //if (Input.GetKeyDown(KeyCode.Alpha3))
        //{
        //    WhosAggro();
        //}
        //if (Input.GetKeyDown(KeyCode.Alpha4))
        //{
        //    AggroEnd();
        //}
    }

    //------------DEFAULT--------------
    public void ManageHealth(float currentHealth, float maxHealth)
    {
        bossHealthBar.DOFillAmount(currentHealth / maxHealth, 0.05f).SetEase(Ease.OutSine);
    }

    //------------PATTERN 1--------------
    public void EnableHint()
    {
        hint.DOFade(1f, 0.5f).SetEase(Ease.OutSine);
    }

    public void DisableHint()
    {
        hint.DOFade(0f, 0.5f).SetEase(Ease.OutSine);
    }

    public void WhosAggro()
    {
        aggroText.DOFade(1f, 0.25f).SetEase(Ease.OutSine);
    }

    public void AggroEnd()
    {
        aggroText.DOFade(0f, 0.25f).SetEase(Ease.OutSine);
    }

    public void ActivateCipher()
    {
        inputCipherDisplay.GetComponent<CanvasGroup>().DOFade(1, 0.15f).OnStart(() => inputCipherDisplay.gameObject.SetActive(true)); 
        inputCipherEnter.GetComponent<CanvasGroup>().DOFade(1, 0.15f).OnStart(() => inputCipherEnter.gameObject.SetActive(true));
        inputCipherDisplay.GetComponent<RectTransform>().DOAnchorPosY(120f, 0.15f).SetEase(Ease.OutSine).OnStart(() => ResetCipher());
        inputCipherEnter.GetComponent<RectTransform>().DOAnchorPosY(-200f, 0.15f).SetEase(Ease.OutSine);

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

    public void CheckCipher()
    {
        if (inputField.text == patternCode.ToString())
        {
            inputField.DOColor(Color.green, 0.2f).SetEase(Ease.OutSine);
            PV.RPC("UpdateValue", RpcTarget.AllBuffered, true); // 상대 PC에 Correct value 동기화
        }
        else
        {
            inputField.DOColor(Color.red, 0.2f).SetEase(Ease.OutSine);
            inputField.text = "WRONG";
            StartCoroutine(ResetCipherWithDelay());
            PV.RPC("UpdateValue", RpcTarget.AllBuffered, false); // 상대 PC에 Correct value 동기화
        }
    }

    public IEnumerator ResetCipherWithDelay()
    {
        yield return new WaitForSeconds(0.5f);
        ResetCipher();
        yield return null;
    }

    [PunRPC]
    void UpdateValue(bool value)
    {
        boss.GetComponent<Boss1>().IsCorrect = value;
    }

    public void ResetCipher()
    {
        inputField.text = "";
        inputField.color = Color.white;
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
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(1, 0.5f).SetEase(Ease.OutSine).OnStart(() => attackNodeContainer.SetActive(true));
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
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(0, 0.5f).SetEase(Ease.OutSine).OnComplete(() => attackNodeContainer.SetActive(false));
    }

    public void ResetAttackNode()
    {
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(0, 0.25f).SetEase(Ease.OutSine);
        for (int i = 0; i < 7; i++) 
        {
            attackNodeContainer.transform.GetChild(i).GetComponent<Image>().DOFade(1f, 0.01f).SetDelay(0.25f);
        }
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(1f, 0.25f).SetEase(Ease.OutSine).SetDelay(0.5f);
    }

    public void EnableCutScene()
    {
        cutSceneForYgg.SetActive(true);
    }
}
