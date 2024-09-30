using DG.Tweening;
using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerAttack : MonoBehaviour
{
    // Component
    PhotonView PV;
    PlayerStateManager playerState;
    Camera playerCamera;
    Animator animator;

    // Get Objects
    public GameObject projectilePrefab;
    public Transform projectileSpawnPoint;
    public Transform aim;
    public Transform playerBody;

    // Information variable
    int attackCount = 0;
    bool canAttack = false; // 외부에서 설정해주는 값 (Rescue activity & Tool change)
    float lastAttackTime;
    float attackCool = 0.5f;
    float projectileSpeed = 20f;
    float maxRayDistance = 100f;
    bool isUltimate = false;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerStateManager>(out playerState);
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
        if (Input.GetMouseButtonDown(0) && CanAttack() && playerState.GetUltimatePower() < 100) // 기본 공격
        {
            animator.SetInteger("attackCount", attackCount);
            animator.SetBool("isAttacking", true);
            if (attackCount < 2)
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
            StartCoroutine(AttackTime(0.5f));
        }
        else if (Input.GetMouseButtonDown(0) && CanAttack() && playerState.GetUltimatePower() == 100) // 궁극기
        {
            animator.SetBool("isUltimate", true);
            isUltimate = true;
            playerState.ResetUltimatePower();
            attackCount = 0;
            lastAttackTime = Time.time;
            StartCoroutine(UltimateAttackTime(1.0f));
        }
    }

    IEnumerator AttackTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("isAttacking", false);
    }

    IEnumerator UltimateAttackTime(float time)
    {
        yield return new WaitForSeconds(time);
        animator.SetBool("isUltimate", false);
        isUltimate = false;
    }

    void ShotProjectile() // 투사체 생성 및 공격력 설정, 해당 투사체의 오너 설정
    {
        if (projectilePrefab != null && projectileSpawnPoint != null && playerCamera != null)
        {
            Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
            ray.origin = playerBody.TransformPoint(new Vector3(0, 2f, 1f));

            Vector3 targetPoint = Vector3.zero;

            Debug.DrawRay(ray.origin, ray.direction * maxRayDistance, Color.red, 2f);
            if (Physics.Raycast(ray, out RaycastHit hit, maxRayDistance))
            {
                targetPoint = hit.point;
            }
            else
            {
                targetPoint = aim.position;
            }

            Vector3 direction = (targetPoint - projectileSpawnPoint.position).normalized;

            if (!isUltimate)
            {
                // 투사체 생성
                GameObject projectile = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", projectilePrefab.name), projectileSpawnPoint.position, Quaternion.LookRotation(direction));
                SetProjectileRPC(projectile.GetComponent<PhotonView>().ViewID, direction, (attackCount-1+3)%3);
            }
            else
            {
                // 투사체 생성
                GameObject projectile = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", projectilePrefab.name), projectileSpawnPoint.position, Quaternion.LookRotation(direction));
                SetProjectileRPC(projectile.GetComponent<PhotonView>().ViewID, direction, 5);
            }
        }
    }

    
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
            projScript.SetAttackPower((count==5)? 2 : (count < 2) ? 1f : 1f);
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
        canAttack = value;
    }
}
