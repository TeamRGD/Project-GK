using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerStateManager : MonoBehaviour
{
    PhotonView PV;
    
    bool isGroggy = false;
    
    // HP
    private int maxHealth = 100;
    public int currentHealth; // (test) should be private.
    private bool isAlive;

    // 마력
    private int maxPower = 150;
    public int currentPower; // (test) should be private.

    // 궁극주문력
    private int maxUltimatePower = 100;
    public int currentUltimatePower; // (test) should be private.

    private WaitForSeconds oneSecond = new WaitForSeconds(1f);
    PlayerController playerController;
    PlayerAttack playerAttack;
    PlayerToolManager playerToolManager;
    Animator animator;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerController>(out playerController);
        TryGetComponent<PlayerAttack>(out playerAttack);
        TryGetComponent<PlayerToolManager>(out playerToolManager);
        TryGetComponent<Animator>(out animator);
    }

    void Start()
    {
        isAlive = true;
        currentHealth = maxHealth;
        currentPower = maxPower;
        currentUltimatePower = 0;
        StartCoroutine(RecoverPower());
    }

    void OnTriggerEnter(Collider other)
    {
        if (isAlive)
        {
            if (other.gameObject.CompareTag("DamageCollider") || other.gameObject.CompareTag("ShockWave"))
            {
                TakeDamage(3);
                if (!PV.IsMine)
                    return;
                animator.SetTrigger("getHit");
            }
            else if (other.gameObject.CompareTag("ShockDamageCollider"))
            {
                TakeDamage(10);
                if (isAlive)
                {
                    OnGroggy();
                }
            }
        }
    }

    public void TakeDamage(int damage)
    {
        PV.RPC("TakeDamageRPC", RpcTarget.AllBuffered, damage);
    }
    
    [PunRPC]
    void TakeDamageRPC(int damage)
    {
        if (!PV.IsMine)
            return;
        currentHealth -= damage;
        if (currentHealth <= 0)
        {
            currentHealth = 0;
            OnDeath();
        }
        UIManager_Player.Instance.ManageHealth(currentHealth, maxHealth);
    }

    void OnGroggy()
    {
        animator.SetBool("isGroggy", true);
        animator.SetTrigger("groggy");
        PV.RPC("OnGroggyRPC", RpcTarget.AllBuffered);
        StartCoroutine(GroggyTime(2));
    }

    [PunRPC]
    void OnGroggyRPC()
    {
        isGroggy = true;
        playerController.SetCanControl(false);
        playerAttack.SetCanAttack(false);
        playerToolManager.SetCanChange(false);
    }
    void OnNotGroggy()
    {
        PV.RPC("OnNotGroggyRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void OnNotGroggyRPC()
    {
        isGroggy = false;
        playerController.SetCanControl(true);
        playerAttack.SetCanAttack(true);
        playerToolManager.SetCanChange(true);
    }

    IEnumerator GroggyTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("isGroggy", false);
        OnNotGroggy();
    }

    void OnDeath()
    {
        animator.SetBool("isGroggy", true);
        animator.SetTrigger("groggy");
        PV.RPC("OnDeathRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void OnDeathRPC()
    {
        isAlive = false;
        playerController.SetCanControl(false);
        playerAttack.SetCanAttack(false);
        playerToolManager.SetCanChange(false);
    }

    public void Revive()
    {
        animator.SetBool("isGroggy", false);
        PV.RPC("ReviveRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void ReviveRPC()
    {
        isAlive = true;
        playerController.SetCanControl(true);
        playerAttack.SetCanAttack(true);
        playerToolManager.SetCanChange(true);
        currentHealth = maxHealth;
    }

    [PunRPC]
    void UpdateManaRPC()
    {
        if (!PV.IsMine)
            return;
        UIManager_Player.Instance.ManageMana(currentPower, maxPower);
    }
    
    IEnumerator RecoverPower() // 매초마다 마력 5씩 회복
    {
        while (true)
        {
            yield return oneSecond;
            if (currentPower < maxPower)
            {
                currentPower += 5;
                if (currentPower > maxPower)
                {
                    currentPower = maxPower;
                }
                PV.RPC("UpdateManaRPC", RpcTarget.AllBuffered);
            }
        }
    }

    public void IncreaseUltimatePower(int amount)
    {
        if (!PV.IsMine)
            return;
        PV.RPC("IncreaseUltimatePowerRPC", RpcTarget.AllBuffered, amount);
    }

    [PunRPC]
    void IncreaseUltimatePowerRPC(int amount)
    {
        if (!PV.IsMine)
            return;
        currentUltimatePower += amount;
        if (currentUltimatePower > maxUltimatePower)
        {
            currentUltimatePower = maxUltimatePower;
        }
        UIManager_Player.Instance.ManageUlt(currentUltimatePower, maxUltimatePower);
    }

    public void DecreasePower(int amount)
    {
        if (!PV.IsMine)
            return;
        PV.RPC("DecreasePowerRPC", RpcTarget.AllBuffered, amount);
    }

    [PunRPC]
    void DecreasePowerRPC(int amount)
    {
        if (!PV.IsMine)
            return;
        currentPower -= amount;
        UIManager_Player.Instance.ManageMana(currentPower, maxPower);
    }

    public void ResetUltimatePower()
    {
        if (!PV.IsMine)
            return;
        PV.RPC("ResetUltimatePowerRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void ResetUltimatePowerRPC()
    {
        if (!PV.IsMine)
            return;
        currentUltimatePower = 0;
        UIManager_Player.Instance.ManageUlt(currentUltimatePower, maxUltimatePower);
    }

    public bool GetIsAlive()
    {
        return isAlive;
    }

    public int GetHealth()
    {
        return currentHealth;
    }

    public int GetPower()
    {
        return currentPower;
    }

    public int GetUltimatePower()
    {
        return currentUltimatePower;
    }
}
