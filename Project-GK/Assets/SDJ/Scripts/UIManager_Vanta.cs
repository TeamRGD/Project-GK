using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using Unity.Burst.CompilerServices;
using UnityEngine;
using UnityEngine.UI;

public class UIManager_Vanta : MonoBehaviour
{
    public static UIManager_Vanta Instance;

    public Image bossHealthBar;

    public CanvasGroup hint;

    public GameObject attackNodeContainer;
    public Sprite[] attackNodes;

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
        
    }

    void Update()
    {
        
    }

    public void ManageHealth(float currentHealth, float maxHealth)
    {
        if (currentHealth == 0f) bossHealthBar.fillAmount = 0f;
        else bossHealthBar.DOFillAmount(currentHealth / maxHealth, 0.05f).SetEase(Ease.OutSine);
    }

    public void EnableHint()
    {
        hint.DOFade(1f, 0.5f).SetEase(Ease.OutSine);
    }

    public void DisableHint()
    {
        hint.DOFade(0f, 0.5f).SetEase(Ease.OutSine);
    }
    public void EnableAttackNode()
    {
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(1, 0.5f).SetEase(Ease.OutSine).OnStart(() => attackNodeContainer.SetActive(true));
    }

    public void DisableAttackNode()
    {
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(0, 0.5f).SetEase(Ease.OutSine).OnComplete(() => attackNodeContainer.SetActive(false));
    }

    public void ResetAttackNode(List<int> order)
    {
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(0, 0.25f).SetEase(Ease.OutSine);
        for (int i = 0; i < 8; i++)
        {
            attackNodeContainer.transform.GetChild(i).GetComponent<Image>().sprite = attackNodes[order[i] - 1];
            attackNodeContainer.transform.GetChild(i).GetComponent<Image>().DOFade(1f, 0.01f).SetDelay(0.25f);
        }
        attackNodeContainer.GetComponent<CanvasGroup>().DOFade(1f, 0.25f).SetEase(Ease.OutSine).SetDelay(0.5f);
    }
}
