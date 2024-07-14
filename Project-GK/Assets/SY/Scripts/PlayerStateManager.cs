using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerStateManager : MonoBehaviour
{
    PhotonView PV;
    public int maxHealth = 100;
    public int maxPower = 150;
    public int maxUltimatePower = 100;
    public int currentHealth; // (test) should be private.
    public int currentPower; // (test) should be private.
    public int currentUltimatePower; // (test) should be private.
    private int attackCount = 0;
    private float lastAttackTime;
    public float attackCool = 1.0f;
    public GameObject projectilePrefab;
    public Transform projectileSpawnPoint;
    public float projectileSpeed = 15f;

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
        lastAttackTime = -attackCool;
        StartCoroutine(RecoverPower());
    }

    // Update is called once per frame
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

    IEnumerator RecoverPower()
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

    public bool CanAttack()
    {
        if (Time.time - lastAttackTime < attackCool)
        {
            return false;
        }
        if (attackCount < 2 && currentPower >= 10)
        {
            return true;
        }
        else if (attackCount >= 2 && currentPower >= 15)
        {
            return true;
        }
        return false;
    }

    public void Attack()
    {
        PV.RPC("AttackRPC", RpcTarget.AllBuffered, attackCount);
    }

    [PunRPC]
    void AttackRPC(int count)
    {
        if (count < 2)
        {
            attackCount++;
            currentPower -= 10;
        }
        else
        {
            attackCount = 0;
            currentPower -= 15;
        }

        lastAttackTime = Time.time;
        FireProjectile(count);
    }

    void FireProjectile(int count)
    {
        if (projectilePrefab != null && projectileSpawnPoint != null)
        {
            GameObject projectile = Instantiate(projectilePrefab, projectileSpawnPoint.position, projectileSpawnPoint.rotation);
            Rigidbody rb = projectile.GetComponent<Rigidbody>();
            if (rb != null)
            {
                rb.velocity = projectileSpawnPoint.forward * projectileSpeed;
            }
            Projectile projScript = projectile.GetComponent<Projectile>();
            if (projScript != null)
            {
                projScript.attackPower = (count < 2) ? 20 : 30;
                projScript.SetOwner(PV.ViewID);
            }
        }
    }

    public void IncreaseUltimatePower(int amount)
    {
        PV.RPC("IncreaseUltimatePowerRPC", RpcTarget.AllBuffered, amount);
    }

    [PunRPC]
    void IncreaseUltimatePowerRPC(int amount)
    {
        if (PV.IsMine)
        {
            currentUltimatePower += amount;
            if (currentUltimatePower > maxUltimatePower)
            {
                currentUltimatePower = maxUltimatePower;
            }
        }
    }
}
