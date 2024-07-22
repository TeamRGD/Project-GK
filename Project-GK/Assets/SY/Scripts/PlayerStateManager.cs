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

    // 마력
    public int maxPower = 150;
    public int currentPower; // (test) should be private.

    // 궁극주문력
    public int maxUltimatePower = 100;
    public int currentUltimatePower; // (test) should be private.

    private WaitForSeconds oneSecond = new WaitForSeconds(1f);

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
    }

    void Start()
    {
        currentHealth = maxHealth;
        currentPower = maxPower;
        currentUltimatePower = 0;
        StartCoroutine(RecoverPower());
    }

    private void Update()
    {
        if (!PV.IsMine)
            return;
        if (Input.GetKeyDown(KeyCode.K)) // HP test code. should be removed.
        {
            TakeDamage(10);
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
        if (currentHealth < 0)
        {
            currentHealth = 0;
        }
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
}
