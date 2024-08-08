using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class PlayerAttack : MonoBehaviour
{
    PhotonView PV;
    PlayerStateManager playerState;
    PlayerToolManager playerTool;
    public GameObject projectilePrefab;
    public Transform projectileSpawnPoint;
    public Transform aim;
    private int attackCount = 0;
    public bool canAttack = true; // 외부에서 설정해주는 값 (Rescue activity & Tool change)
    private float lastAttackTime;
    public float attackCool = 0.5f;
    public float projectileSpeed = 20f;
    public float maxRayDistance = 100f;
    Camera playerCamera;
    Animator animator;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerStateManager>(out playerState);
        TryGetComponent<PlayerToolManager>(out playerTool);
        TryGetComponent<Animator>(out animator);
        playerCamera = GetComponentInChildren<Camera>();
    }

    private void Update()
    {
        if (!PV.IsMine)
            return;
        Attack();
    }

    public bool CanAttack()
    {
        if (!canAttack)
            return false;

        if (Time.time - lastAttackTime < attackCool)
        {
            return false;
        }
        if (attackCount < 2 && playerState.GetPower() >= 10)
        {
            return true;
        }
        else if (attackCount >= 2 && playerState.GetPower() >= 15)
        {
            return true;
        }
        
        return false;
    }

    public void Attack()
    {
        if (Input.GetMouseButtonDown(0)&&CanAttack()&&playerState.GetUltimatePower()<100) // 기본 공격
        {
            PV.RPC("AttackRPC", RpcTarget.AllBuffered, attackCount);
            animator.SetInteger("attackCount", attackCount+1);
            animator.SetTrigger("isAttacking");
        }
        else if (Input.GetMouseButtonDown(0)&&CanAttack()&&playerState.GetUltimatePower()==100) // 궁극기
        {
            PV.RPC("UltimateAttackRPC", RpcTarget.AllBuffered);
        }
    }

    [PunRPC]
    void UltimateAttackRPC()
    {
        if (!PV.IsMine) return;
        playerState.ResetUltimatePower();
        animator.SetTrigger("isUltimate");
        attackCount = 0;
        lastAttackTime = Time.time;
    }

    [PunRPC]
    void AttackRPC(int count) // 1타, 2타 -> 마력 10 소모, 3타 -> 마력 15 소모.
    {
        if (!PV.IsMine) return;
        if (count < 2)
        {
            attackCount++;
            playerState.DecreasePower(10);
        }
        else
        {
            attackCount = 0;
            playerState.DecreasePower(15);
        }

        lastAttackTime = Time.time;
        ShotProjectile(count);
    }

    void ShotProjectile(int count) // 투사체 생성 및 공격력 설정, 해당 투사체의 오너 설정
    {
        if (projectilePrefab != null && projectileSpawnPoint != null && playerCamera != null)
        {
            Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));

            Vector3 targetPoint = Vector3.zero;

            //Debug.DrawRay(ray.origin, ray.direction * maxRayDistance, Color.red, 2f);
            if (Physics.Raycast(ray, out RaycastHit hit, maxRayDistance))
            {
                targetPoint = hit.point;
            }
            else
            {
                targetPoint = aim.position;
            }

            Vector3 direction = (targetPoint - projectileSpawnPoint.position).normalized;

            // 투사체 생성
            GameObject projectile = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", projectilePrefab.name), projectileSpawnPoint.position, Quaternion.LookRotation(direction));

            PV.RPC("SetProjectileRPC", RpcTarget.AllBuffered, projectile.GetComponent<PhotonView>().ViewID, direction, count);
        }
    }

    [PunRPC]
    void SetProjectileRPC(int projectileViewID, Vector3 direction, int count)
    {
        // 투사체 찾기
        PhotonView projectileView = PhotonView.Find(projectileViewID);
        GameObject projectile = projectileView.gameObject;

        // 투사체의 공격력, 오너 설정
        Projectile projScript;
        projectile.TryGetComponent<Projectile>(out projScript);
        if (projScript != null)
        {
            projScript.attackPower = (count < 2) ? 20 : 30;
            projScript.SetOwner(PV.ViewID);
        }

        // 투사체의 속도 설정
        Rigidbody rb;
        projectile.TryGetComponent<Rigidbody>(out rb);
        if (rb != null)
        {
            rb.velocity = direction * projectileSpeed;
        }
    }

    public void SetCanAttack(bool value)
    {
        PV.RPC("SetCanAttackRPC", RpcTarget.AllBuffered, value);
    }

    [PunRPC]
    void SetCanAttackRPC(bool value)
    {
        canAttack = value;
    }
}
