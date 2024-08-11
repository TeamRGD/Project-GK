using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public float attackPower = 0.2f;
    private int ownerPhotonViewId;
    private WaitForSeconds seconds = new WaitForSeconds(10f);
    PlayerStateManager playerState;
    PhotonView myPV;

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
        if (other.CompareTag("Enemy"))
        {
            PhotonView PV = PhotonView.Find(ownerPhotonViewId);
            if (PV != null && PV.IsMine)
            {
                PhotonNetwork.Destroy(gameObject);
                PV.TryGetComponent<PlayerStateManager>(out playerState);
                playerState.IncreaseUltimatePower(3); // 투사체 주인의 궁극 주문력을 3 올려 줌.
                other.GetComponentInParent<Boss1>().TakeDamage(attackPower);
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
        Destroy(gameObject);
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
        gameObject.tag = tag;
    }
}
