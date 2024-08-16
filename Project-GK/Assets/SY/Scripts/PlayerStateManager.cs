using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerStateManager : MonoBehaviour
{
    
    // HP
    private int maxHealth = 100;
    private int currentHealth;

    // 마력
    private int maxPower = 150;
    private int currentPower;

    // 궁극주문력
    private int maxUltimatePower = 100;
    private int currentUltimatePower;

    // 코루틴 변수
    private WaitForSeconds oneSecond = new WaitForSeconds(1f);

    // Bool 값들
    public bool isAlive = true;

    // Component
    PhotonView PV;
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
        if (!PV.IsMine)
            return;
        currentHealth = maxHealth;
        currentPower = maxPower;
        currentUltimatePower = 0;
        StartCoroutine(RecoverPower());
    }

    void Update()
    {
        if(Input.GetKeyDown(KeyCode.M))
        {
            //TakeDamage(100);
            currentUltimatePower = 100;
        }
    }

    void OnTriggerEnter(Collider other) // 수정 필요. 콜라이더를 여러 부분에 해뒀기 때문에 중복으로 TakeDamage가 적용됨.
    {
        if (isAlive)
        {
            if (other.gameObject.CompareTag("DamageCollider") || other.gameObject.CompareTag("ShockWave"))
            {
                TakeDamage(3);
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
        currentHealth -= damage;
        if (currentHealth <= 0)
        {
            currentHealth = 0;
            OnDeath();
        }
        UIManager_Player.Instance.ManageHealth(currentHealth, maxHealth);
    }

    void OnDeath()
    {
        animator.SetBool("isGroggy", true);
        animator.SetTrigger("groggy");
        SetCanState(false);
        PV.RPC("OnDeathRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void OnDeathRPC()
    {
        isAlive = false;
    }

    void OnGroggy()
    {
        animator.SetBool("isGroggy", true);
        animator.SetTrigger("groggy");
        SetCanState(false);
        StartCoroutine(GroggyTime(2));
    }

    IEnumerator GroggyTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("isGroggy", false);
        OnNotGroggy();
    }
    
    void OnNotGroggy()
    {
        SetCanState(true);
    }

    void SetCanState(bool value)
    {
        playerController.SetCanControl(value);
        playerAttack.SetCanAttack(value);
        playerToolManager.SetCanChange(value);
    }

    public void Revive()
    {
        animator.SetBool("isGroggy", false);
        PV.RPC("ReviveRPC", RpcTarget.AllBuffered);
        SetCanState(true);
    }

    [PunRPC]
    void ReviveRPC()
    {
        isAlive = true;
        currentHealth = maxHealth;
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
                UIManager_Player.Instance.ManageMana(currentPower, maxPower);
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

    public int GetHealth() // 동기화 안됨.
    {
        return currentHealth;
    }

    public int GetPower() // 동기화 안됨.
    {
        return currentPower;
    }

    public int GetUltimatePower() // 동기화 안됨.
    {
        return currentUltimatePower;
    }
}
