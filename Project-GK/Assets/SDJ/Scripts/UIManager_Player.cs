using DG.Tweening;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UIManager_Player : MonoBehaviour
{
    //for Singleton Pattern
    public static UIManager_Player Instance;

    // for Player Stats
    public Image healthBar;
    public Image manaBar;
    public Image ultBar;

    // for Inventory
    public Image[] inventoryOutlines;
    public Image aim;
    public AudioSource inventorySFX;

    //for aggro
    public Image saveCirc;
    public TMP_Text saveText;

    // for Interaction
    public GameObject interactionNotice;
    public GameObject interactionNoticeForCipher;

    // SFX


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
        for (int i = 0; i < inventoryOutlines.Length; i++)
        {
            inventoryOutlines[i].enabled = false;
        }
        inventoryOutlines[0].enabled = true;
    }


    // Player Stats
    public void ManageHealth(float currentHp, float maxHp)
    {
        healthBar.DOFillAmount(currentHp / maxHp, 0.05f).SetEase(Ease.OutFlash);
    }

    public void ManageMana(float currentPower, float maxPower)
    {
        manaBar.DOFillAmount(currentPower / maxPower, 0.05f).SetEase(Ease.OutFlash);
    }

    public void ManageUlt(float currentUlt, float maxUlt)
    {
        ultBar.DOFillAmount(currentUlt / maxUlt, 0.2f).SetEase(Ease.OutSine);
    }

    // Inventory
    public void SetInventory(int num)
    {
        if (num == 0)
        {
            aim.enabled = true;
        }
        else
        {
            aim.enabled = false;
        }
        for (int i = 0; i < inventoryOutlines.Length; i++)
        {
            if (i == num)
            {
                inventoryOutlines[i].enabled = true;
            } else
            {
                inventoryOutlines[i].enabled = false;
            }
        }
        inventorySFX.Play();
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
        if (who == "Wi")
        {
            //Color aimColor = new Color(54f, 194f, 82f);
            aim.color = Color.green;
        } else if (who == "Zard")
        {
            //Color aimColor = new Color(217f, 85f, 59f);
            aim.color = Color.red;
        } else
        {
            aim.color = Color.white;
        }
    }
}
