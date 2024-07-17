using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class PlayerAttack : MonoBehaviour
{
    PhotonView PV;
    PlayerStateManager playerState;
    public GameObject projectilePrefab;
    public Transform projectileSpawnPoint;
    private int attackCount = 0;
    private float lastAttackTime;
    public float attackCool = 1.0f;
    public float projectileSpeed = 15f;
    public float maxRayDistance = 1000f;
    Camera playerCamera;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerStateManager>(out playerState);
        playerCamera = GetComponentInChildren<Camera>();
    }

    private void Update()
    {
        if (!PV.IsMine)
            return;

        if (Input.GetMouseButtonDown(0))
        {
            Attack();
        }
    }

    public bool CanAttack()
    {
        if (Time.time - lastAttackTime < attackCool)
        {
            return false;
        }
        if (attackCount < 2 && playerState.currentPower >= 10)
        {
            return true;
        }
        else if (attackCount >= 2 && playerState.currentPower >= 15)
        {
            return true;
        }
        return false;
    }

    public void Attack()
    {
        if (CanAttack())
        {
            PV.RPC("AttackRPC", RpcTarget.AllBuffered, attackCount);
        }
    }

    [PunRPC]
    void AttackRPC(int count) // 1타, 2타 -> 마력 10 소모, 3타 -> 마력 15 소모.
    {
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
        FireProjectile(count);
    }

    void FireProjectile(int count) // 투사체 생성 및 공격력 설정, 해당 투사체의 오너 설정
    {
        if (projectilePrefab != null && projectileSpawnPoint != null && playerCamera != null)
        {
            // 에임을 향해 투사체 발사
            Ray ray = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
            Vector3 targetPoint;

            if (Physics.Raycast(ray, out RaycastHit hit, maxRayDistance))
            {
                targetPoint = hit.point;
            }
            else
            {
                targetPoint = ray.GetPoint(maxRayDistance);
            }

            Vector3 direction = (targetPoint - projectileSpawnPoint.position).normalized;

            // 투사체 생성
            GameObject projectile = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", projectilePrefab.name), projectileSpawnPoint.position, Quaternion.LookRotation(direction));
            Rigidbody rb;
            projectile.TryGetComponent<Rigidbody>(out rb);
            if (rb != null)
            {
                rb.velocity = direction  * projectileSpeed;
            }
            
            // 투사체의 공격력, 오너 설정
            Projectile projScript;
            projectile.TryGetComponent<Projectile>(out projScript);
            if (projScript != null)
            {
                projScript.attackPower = (count < 2) ? 20 : 30;
                projScript.SetOwner(PV.ViewID);
            }
        }
    }
}
