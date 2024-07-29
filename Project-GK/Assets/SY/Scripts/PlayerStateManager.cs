using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerStateManager : MonoBehaviour
{
    PhotonView PV;
    
    // HP
    public int maxHealth = 100;
    public int currentHealth; // (test) should be private.
    private bool isAlive;

    // 마력
    public int maxPower = 150;
    public int currentPower; // (test) should be private.

    // 궁극주문력
    public int maxUltimatePower = 100;
    public int currentUltimatePower; // (test) should be private.

    private WaitForSeconds oneSecond = new WaitForSeconds(1f);
    PlayerController playerController;
    PlayerAttack playerAttack;
    PlayerToolManager playerToolManager;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerController>(out playerController);
        TryGetComponent<PlayerAttack>(out playerAttack);
        TryGetComponent<PlayerToolManager>(out playerToolManager);
    }

    void Start()
    {
        isAlive = true;
        currentHealth = maxHealth;
        currentPower = maxPower;
        currentUltimatePower = 0;
        StartCoroutine(RecoverPower());
    }

    private void Update()
    {
        if (!PV.IsMine)
            return;
        if (Input.GetKeyDown(KeyCode.K)) // 기절 테스트
        {
            TakeDamage(100);
        }
    }

    public void TakeDamage(int damage)
    {
        if (!PV.IsMine)
            return;
        PV.RPC("TakeDamageRPC", RpcTarget.AllBuffered, damage);
    }
    
    [PunRPC]
    void TakeDamageRPC(int damage)
    {
        currentHealth -= damage;
        if (currentHealth <= 0)
        {
            currentHealth = 0;
            OnDeath();
        }
    }

    void OnDeath()
    {
        PV.RPC("OnDeathRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void OnDeathRPC()
    {
        isAlive = false;
        transform.rotation = Quaternion.Euler(0, 0, 90); // 임시로 기절 표현
        playerController.SetCanMove(false);
        playerAttack.SetCanAttack(false);
        playerToolManager.SetCanChange(false);
    }

    public void Revive()
    {
        PV.RPC("ReviveRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void ReviveRPC()
    {
        isAlive = true;
        playerController.SetCanMove(true);
        playerAttack.SetCanAttack(true);
        playerToolManager.SetCanChange(true);
        currentHealth = maxHealth;
        transform.rotation = Quaternion.Euler(0, 0, 0); // 임시로 부활 표현
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
        currentUltimatePower += amount;
        if (currentUltimatePower > maxUltimatePower)
        {
            currentUltimatePower = maxUltimatePower;
        }
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
        currentPower -= amount;
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
        currentUltimatePower = 0;
    }

    public bool GetIsAlive()
    {
        return isAlive;
    }
}
