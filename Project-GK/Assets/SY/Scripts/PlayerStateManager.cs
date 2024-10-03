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
    bool onStun = false;

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
        if (!isAlive) // [임시완]
        {
            SetCanState(false);
        }
    }

    void OnTriggerEnter(Collider other) 
    {
        if (!PV.IsMine)
            return;
        if (isAlive)
        {
            if (other.gameObject.CompareTag("DamageCollider"))
            {
                GetHit();
            }
            else if (other.gameObject.CompareTag("ShockDamageCollider"))
            {
                OnStun();
            }
        }
    }

    void GetHit()
    {
        playerController.SetIsFreeLooking(false);
        TakeDamage(5);
        if (isAlive)
        {
            playerController.SetSavingState(false);
            SetCanState(false);
            animator.SetBool("getHit", true);
            StartCoroutine(GetHitAnimTime(0.2f));
            StartCoroutine(HitTime(0.9f));
        }
    }

    IEnumerator GetHitAnimTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("getHit", false);
    }

    IEnumerator HitTime(float time)
    {
        yield return new WaitForSeconds(time);
        SetCanState(true);
    }

    public void TakeDamage(int damage)
    {
        currentHealth -= damage;
        if (currentHealth <= 0)
        {
            currentHealth = 0;
            OnGroggy();
        }
        UIManager_Player.Instance.ManageHealth(currentHealth, maxHealth);
        Debug.Log(currentHealth);
    }

    void OnGroggy()
    {
        if(!PV.IsMine)
            return;
        PV.RPC("OnGroggyRPC", RpcTarget.AllBuffered);
    }

    IEnumerator TriggerAnimTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("trigger", false);
    }

    [PunRPC]
    void OnGroggyRPC()
    {
        SetCanState(false); // 상대 화면에서도 빠른 동작 멈춤을 위해 동기화 해줌.
        animator.SetBool("isGroggy", true);
        animator.SetBool("trigger", true);
        StartCoroutine(TriggerAnimTime(0.4f));
        isAlive = false;
    }

    void OnStun()
    {
        playerController.SetIsFreeLooking(false);
        TakeDamage(5);
        if (isAlive)
        {
            playerController.SetSavingState(false);
            onStun = true;
            SetCanState(false);
            animator.SetBool("onStun", true);
            StartCoroutine(OnStunAnimTime(0.2f));
            StartCoroutine(StunTime(2.2f));
        }
    }

    IEnumerator OnStunAnimTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("onStun", false);
    }

    IEnumerator StunTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("onStun", false);
        OnNotStun();
    }
    
    void OnNotStun()
    {
        SetCanState(true);
        onStun = false;
    }

    void SetCanState(bool value)
    {
        playerController.SetCanControl(value);
        playerAttack.SetCanAttack(value);
        playerToolManager.SetCanChange(value);
    }

    public void Revive() // 상대 PC에서 해당 함수를 실행하기 때문에, 본인 PC에서 소생되기 위해 모든 것을 동기화 함수에 넣어줌.
    {
        PV.RPC("ReviveRPC", RpcTarget.All);
    }

    [PunRPC]
    void ReviveRPC()
    {
        animator.SetBool("isGroggy", false);
        isAlive = true;
        currentHealth = maxHealth;
        SetCanState(true);
        // UI만 동기화 X
        if(!PV.IsMine)
            return;
        UIManager_Player.Instance.ManageHealth(currentHealth, maxHealth);
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
        currentPower -= amount;
        UIManager_Player.Instance.ManageMana(currentPower, maxPower);
    }

    public void ResetUltimatePower()
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

    public bool GetOnStun()
    {
        return onStun;
    }
}
