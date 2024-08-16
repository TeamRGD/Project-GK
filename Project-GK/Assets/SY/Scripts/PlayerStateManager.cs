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

    void OnTriggerEnter(Collider other) // 수정 필요. 콜라이더를 여러 부분에 해뒀기 때문에 중복으로 TakeDamage가 적용됨.
    {
        if (!PV.IsMine)
            return;
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
        animator.SetBool("groggy", true);
        SetCanState(false);
        StartCoroutine(GroggyAnimTime(0.2f));
        PV.RPC("OnDeathRPC", RpcTarget.AllBuffered);
    }

    IEnumerator GroggyAnimTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("groggy", false);
    }

    [PunRPC]
    void OnDeathRPC()
    {
        isAlive = false;
    }

    void OnGroggy()
    {
        animator.SetBool("isGroggy", true);
        animator.SetBool("groggy", true);
        StartCoroutine(GroggyAnimTime(0.2f));
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

    public void Revive() // 상대 PC에서 해당 함수를 실행하기 때문에, 본인 PC에서 소생되기 위해 모든 것을 동기화 함수에 넣어줌.
    {
        PV.RPC("ReviveRPC", RpcTarget.AllBuffered);
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
}
