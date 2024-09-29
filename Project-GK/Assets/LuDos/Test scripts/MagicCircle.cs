using System.Collections.Generic;
using UnityEngine;

public class MagicCircle : MonoBehaviour
{
    public List<GameObject> connectedTorches;
    private Boss2 boss;

    void Start()
    {
        boss = FindObjectOfType<Boss2>();
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Projectile_Wi") || collision.gameObject.CompareTag("Projectile_Zard"))
        {
            ToggleMagicCircleAndTorches();
        }
    }

    void ToggleMagicCircleAndTorches()
    {
        if (gameObject.activeSelf)
        {
            gameObject.SetActive(false);
        }
        else
        {
            gameObject.SetActive(true);
        }

        foreach (GameObject torch in connectedTorches)
        {
            if (torch.activeSelf)
            {
                torch.SetActive(false);
                boss.magicCircleCount--;
                // Debug.Log("Torch is now OFF: " + torch.name);
            }
            else
            {
                torch.SetActive(true);
                boss.magicCircleCount++;
                // Debug.Log("Torch is now ON: " + torch.name);
            }
        }

        boss.canControlSpeed = true;
    }
}
