using DG.Tweening;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Photon.Pun;
using Photon.Realtime;

public class UIManager_Player : MonoBehaviourPunCallbacks
{
    public GameObject loadingUI;
    //for Singleton Pattern
    public static UIManager_Player Instance;

    // for Player Stats
    public Image healthBar;
    public Image manaBar;
    public Image ultBar;
    public RectTransform notEnoughMana;
    public Image getHit;
    private bool isLowHealth;

    // for Inventory
    public Sprite[] itemImages;
    //public Image[] inventoryOutlines;
    public Image leftTool;
    public Image currentTool;
    public Image rightTool;
    public Image aim;
    //public AudioSource inventorySFX;

    //for aggro
    public Image saveCirc;
    public TMP_Text saveText;

    // for Interaction
    public GameObject interactionNotice;
    public GameObject interactionNoticeForHold;
    public GameObject interactionNoticeForCipher;

    // set Singleton
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
        //for (int i = 0; i < inventoryOutlines.Length; i++)
        //{
        //    inventoryOutlines[i].enabled = false;
        //}
        //inventoryOutlines[0].enabled = true;
        isLowHealth = false;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.H))
        {
            ManageHealth(4, 1000);
        }
    }

    public void LoadingUI(bool value)
    {
        loadingUI.SetActive(value);
    }

    [PunRPC]
    void UI()
    {
        loadingUI.SetActive(true);
    }


    // Player Stats
    public void ManageHealth(float currentHp, float maxHp)
    {
        float temp = currentHp / maxHp;
        healthBar.DOFillAmount(currentHp / maxHp, 0.05f).SetEase(Ease.OutFlash);
        if (temp <= 0.3f && !isLowHealth)
        {
            print("Done");
            getHit.DOKill();
            isLowHealth = true;
            getHit.DOFade(1f, 1.5f).SetDelay(0.3f).SetLoops(-1, LoopType.Yoyo).SetEase(Ease.InOutSine);
        }
        else
        {
            print("Done1");
            getHit.DOKill();
            isLowHealth = false;
            getHit.DOFade(0f, 0.3f).SetEase(Ease.OutSine);
        }
    }

    public void ManageMana(float currentPower, float maxPower)
    {
        if (manaBar.fillAmount == 0f)
        {
            notEnoughMana.DOKill();
            notEnoughMana.DOShakeAnchorPos(0.3f, 10f, 40, 90, false, true).OnStart(() => notEnoughMana.gameObject.SetActive(true)).OnComplete(() => notEnoughMana.gameObject.SetActive(false));
        }
        manaBar.DOFillAmount(currentPower / maxPower, 0.05f).SetEase(Ease.OutFlash);
    }

    public void ManageUlt(float currentUlt, float maxUlt)
    {
        ultBar.DOFillAmount(currentUlt / maxUlt, 0.2f).SetEase(Ease.OutSine);
    }

    // Inventory
    public void SetInventory(int num, List<GameObject> tools)
    {
        //print(tools.Count);
        if (num == 0)
        {
            aim.enabled = true;
        }
        else
        {
            aim.enabled = false;
        }
        int leftIndex = num - 1;
        int rightIndex = num + 1;
        if (num == 0)
        {
            leftIndex = tools.Count - 1;
        }
        else if (num == tools.Count - 1)
        {
            rightIndex = 0;
        }
        for (int i = 0; i < tools.Count; i++)
        {
            if (itemImages[i].name == tools[leftIndex].name)
            {
                leftTool.sprite = itemImages[i];
            }
            if (itemImages[i].name == tools[num].name)
            {
                currentTool.sprite = itemImages[i];
            }
            if (itemImages[i].name == tools[rightIndex].name)
            {
                rightTool.sprite = itemImages[i];
            }
        }
        //inventorySFX.Play();
    }

    // Interaction
    public void EnableInteractionNotice()
    {
        interactionNotice.GetComponent<CanvasGroup>().DOFade(1, 0.1f).SetEase(Ease.OutSine);
        interactionNotice.GetComponent<RectTransform>().DOAnchorPosY(-70f, 0.1f).SetEase(Ease.OutBack);
    }

    public void DisableInteractionNotice()
    {
        interactionNotice.GetComponent<CanvasGroup>().DOFade(0, 0.1f).SetEase(Ease.InSine);
        interactionNotice.GetComponent<RectTransform>().DOAnchorPosY(0f, 0.1f).SetEase(Ease.InSine);
    }

    public void EnableInteractionNoticeForHold()
    {
        interactionNoticeForHold.GetComponent<CanvasGroup>().DOFade(1, 0.1f).SetEase(Ease.OutSine);
        interactionNoticeForHold.GetComponent<RectTransform>().DOAnchorPosY(-70f, 0.1f).SetEase(Ease.OutBack);
    }

    public void DisableInteractionNoticeForHold()
    {
        interactionNoticeForHold.GetComponent<CanvasGroup>().DOFade(0, 0.1f).SetEase(Ease.InSine);
        interactionNoticeForHold.GetComponent<RectTransform>().DOAnchorPosY(0f, 0.1f).SetEase(Ease.InSine);
    }

    public void EnableInteractionNoticeForCipher(bool down)
    {
        if (down)
        {
            interactionNoticeForCipher.GetComponent<CanvasGroup>().DOFade(1, 0.1f).SetEase(Ease.OutSine);
            interactionNoticeForCipher.GetComponent<RectTransform>().DOAnchorPosY(-120f, 0.1f).SetEase(Ease.OutBack);
        }
        else
        {
            interactionNoticeForCipher.GetComponent<CanvasGroup>().DOFade(1, 0.1f).SetEase(Ease.OutSine);
            interactionNoticeForCipher.GetComponent<RectTransform>().DOAnchorPosY(-70f, 0.1f).SetEase(Ease.OutBack);
        }
    }

    public void DisableInteractionNoticeForCipher()
    {
        interactionNoticeForCipher.GetComponent<CanvasGroup>().DOFade(0, 0.1f).SetEase(Ease.InSine);
        interactionNoticeForCipher.GetComponent<RectTransform>().DOAnchorPosY(0f, 0.1f).SetEase(Ease.InSine);
    }


    public void SaveUI(float currentSaveTime)
    {
        if (currentSaveTime == 0)
        {
            saveText.gameObject.SetActive(false);
        } else
        {
            saveText.gameObject.SetActive(true);
        }
        saveCirc.fillAmount = currentSaveTime / 6f;
    }

    public void AggroAim(string who)
    {
        if (who == "PlayerWi")
        {
            //Color aimColor = new Color(54f, 194f, 82f);
            aim.color = Color.green;
        } else if (who == "PlayerZard")
        {
            //Color aimColor = new Color(217f, 85f, 59f);
            aim.color = Color.red;
        } else
        {
            aim.color = Color.white;
        }
    }
}
