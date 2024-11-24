using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using DG.Tweening;

public class GameOverManager : MonoBehaviour
{
    public static Canvas gameOverCanvas;
    // Start is called before the first frame update
    void Start()
    {
        gameOverCanvas = GameObject.Find("GameOverCanvas").GetComponent<Canvas>();
        gameOverCanvas.gameObject.SetActive(false);
        gameOverCanvas.GetComponent<CanvasGroup>().alpha = 0f;

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void toLauncher()
    {
        SceneManager.LoadScene("Launcher");
    }

    public void Retry(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }

    public static void EnableGameOver()
    {
        gameOverCanvas.gameObject.SetActive(true);
        gameOverCanvas.GetComponent<CanvasGroup>().DOFade(1f, 3f).SetEase(Ease.InOutSine);
    }
}
