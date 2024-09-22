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
    private int playerAttackCount;

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
        bossHealthBar.DOFillAmount(currentHealth / maxHealth, 0.05f).SetEase(Ease.OutSine);
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
}
