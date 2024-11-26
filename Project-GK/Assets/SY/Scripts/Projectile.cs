using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using Unity.Properties;
using UnityEngine;
using UnityEngine.SceneManagement;
using System.IO;

public class Projectile : MonoBehaviour
{
    public float attackPower = 0.2f;
    private int ownerPhotonViewId;
    private WaitForSeconds seconds = new WaitForSeconds(10f);
    PlayerStateManager playerState;
    PhotonView myPV;
    GameObject wb;
    bool canEnter = true;

    void Awake()
    {
        TryGetComponent<PhotonView>(out myPV);
    }

    void Start()
    {
        DestroyProjectileAfterTime();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (canEnter)
        {
            if (!other.CompareTag("ect") && !other.CompareTag("Stair"))
            {
                if (other.CompareTag("Enemy"))
                {
                    canEnter = false;
                    PhotonView PV = PhotonView.Find(ownerPhotonViewId);
                    if (PV != null && PV.IsMine)
                    {
                        Vector3 position = gameObject.transform.position;
                        Quaternion quaternion = gameObject.transform.rotation;
                        if (myPV.IsMine)
                        {
                            wb = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "WB"), position, quaternion);
                        }
                        PhotonNetwork.Destroy(gameObject);
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
                            float currentHealth = boss2.GetCurrentHP();
                            if (currentHealth <= 2 && currentHealth > 0)
                            {
                                if (PhotonNetwork.IsMasterClient)
                                {
                                    print(33333);
                                    boss2.ChangePlayerOrder(1);
                                }
                                else
                                {
                                    print(44444);
                                    boss2.ChangePlayerOrder(2);
                                }
                            }
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
                    BreakableStone stone = other.GetComponent<BreakableStone>();
                    stone.TakeDamage(1);
                    Vector3 position = gameObject.transform.position;
                    Quaternion quaternion = gameObject.transform.rotation;
                    if (myPV.IsMine)
                    {
                        wb = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "WB"), position, quaternion);
                    }
                    PhotonNetwork.Destroy(gameObject);
                }

                else if (other.CompareTag("Drawer"))
                {
                    Vector3 position = gameObject.transform.position;
                    Quaternion quaternion = gameObject.transform.rotation;
                    if (myPV.IsMine)
                    {
                        wb = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "WB"), position, quaternion);
                    }
                    PhotonNetwork.Destroy(gameObject);
                }
                else
                {
                    Vector3 position = gameObject.transform.position;
                    Quaternion quaternion = gameObject.transform.rotation;
                    if (myPV.IsMine)
                    {
                        wb = PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "WB"), position, quaternion);
                    }
                    //PhotonNetwork.Destroy(gameObject);
                }
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
        transform.gameObject.tag = tag;
    }
}
