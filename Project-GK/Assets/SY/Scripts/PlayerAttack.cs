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

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerStateManager>(out playerState);
        TryGetComponent<PlayerToolManager>(out playerTool);
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
        if (Input.GetMouseButtonDown(0)&&CanAttack())
        {
            PV.RPC("AttackRPC", RpcTarget.AllBuffered, attackCount);
        }
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

    void ShotProjectile(int count) // 투사체 생성 및 공격력 설정, 해당 투사체의 오너 설정 // 하다가 일단 멈춤. 꼭 Refactoring 조만간..
    {
        if (projectilePrefab != null && projectileSpawnPoint != null && playerCamera != null)
        {
            Ray[] rays = new Ray[3]; // Ray의 개수를 늘림으로써 에임 타겟팅 정확도 향상
            rays[0] = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0));
            //rays[1] = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.51f, 0));
            //rays[2] = playerCamera.ViewportPointToRay(new Vector3(0.5f, 0.49f, 0)); 

            Vector3 targetPoint = Vector3.zero;
            bool hitDetected = false;

            // Debug each Ray
            for (int i = 0; i < rays.Length; i++)
            {
                Debug.DrawRay(rays[i].origin, rays[i].direction * maxRayDistance, Color.red, 2f);
                if (Physics.Raycast(rays[i], out RaycastHit hit, maxRayDistance))
                {
                    if (!hitDetected) // 첫 번째로 충돌한 지점을 타겟으로 설정
                    {
                        targetPoint = hit.point;
                        hitDetected = true;
                    }
                }
            }

            if (!hitDetected)
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
            rb.velocity = direction  * projectileSpeed;
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
