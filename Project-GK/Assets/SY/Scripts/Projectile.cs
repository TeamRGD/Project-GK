using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using Unity.Properties;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Projectile : MonoBehaviour
{
    public float attackPower = 0.2f;
    private int ownerPhotonViewId;
    private WaitForSeconds seconds = new WaitForSeconds(10f);
    PlayerStateManager playerState;
    PhotonView myPV;
    public GameObject hit;
    public GameObject projectile;
    private Rigidbody rb;

    void Awake()
    {
        TryGetComponent<PhotonView>(out myPV);
        rb = GetComponent<Rigidbody>();
    }

    void Start()
    {
        DestroyProjectileAfterTime();
    }
    IEnumerator ActivateAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        if (myPV.IsMine)
        {
            PhotonNetwork.Destroy(gameObject);
        }
    }
    [PunRPC]
    void SetActive()
    {
        rb.velocity = Vector3.zero;   
        hit.transform.SetParent(gameObject.transform);
        hit.SetActive(true);
        projectile.SetActive(false);
        StartCoroutine(ActivateAfterDelay(1f));
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("ect"))
        {
            if (other.CompareTag("Enemy"))
            {
                myPV.RPC("SetActive",RpcTarget.All);
                PhotonView PV = PhotonView.Find(ownerPhotonViewId);
                if (PV != null && PV.IsMine)
                {
                    PV.TryGetComponent<PlayerStateManager>(out playerState);
                    if (SceneManager.GetActiveScene().name == "Yggdrasil")
                    {
                        Boss1 boss1 = other.GetComponentInParent<Boss1>();
                        if (!boss1.GetIsInvincible())
                        {
                            boss1.TakeDamage(attackPower);
                            playerState.IncreaseUltimatePower(3); // 투사체 주인의 궁극 주문력을 3 올려 줌.
                        }
                    }
                    else if (SceneManager.GetActiveScene().name == "Vanta")
                    {
                        Boss2 boss2 = other.GetComponentInParent<Boss2>(); 
                        if (!boss2.GetIsInvincible())
                        {
                            boss2.TakeDamage(attackPower);
                            playerState.IncreaseUltimatePower(3); // 투사체 주인의 궁극 주문력을 3 올려 줌.
                        }
                    }
                }
            }
            else if (other.CompareTag("Stone"))
            {
                myPV.RPC("SetActive",RpcTarget.All);
                BreakableStone stone = other.GetComponent<BreakableStone>();
                stone.TakeDamage(1);
            }

            else if (other.CompareTag("Drawer"))
            {
                myPV.RPC("SetActive",RpcTarget.All);
            }
            else
            {
                myPV.RPC("SetActive",RpcTarget.All);
            }
        }
    }

    private void DestroyProjectileAfterTime() // n초 후 제거.
    {
        StartCoroutine(DestroyAfterSeconds());
    }

    private IEnumerator DestroyAfterSeconds()
    {
        yield return seconds;
        if (myPV.IsMine)
        {
            PhotonNetwork.Destroy(gameObject);
        }
    }

    public void SetOwner(int photonViewId) // 해당 투사체의 주인 설정. 이 또한 동기화 해야 함.
    {
        if (!myPV.IsMine)
            return;
        ownerPhotonViewId = photonViewId;
        if (PhotonNetwork.IsMasterClient)
        {
            myPV.RPC("SetTag", RpcTarget.AllBuffered, "Projectile_Wi");
        }
        else
        {
            myPV.RPC("SetTag", RpcTarget.AllBuffered, "Projectile_Zard");
        }
    }

    public void SetAttackPower(float _attackPower)
    {
        attackPower = _attackPower;
    }

    [PunRPC]
    void SetTag(string tag)
    {
        Transform projectile = transform.Find("WindBulletProjectile");
        projectile.gameObject.tag = tag;
    }
}
