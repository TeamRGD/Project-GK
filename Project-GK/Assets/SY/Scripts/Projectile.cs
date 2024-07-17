using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public int attackPower = 20;
    private int ownerPhotonViewId;
    private WaitForSeconds seconds = new WaitForSeconds(10f);
    PlayerStateManager playerState;

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
                PV.TryGetComponent<PlayerStateManager>(out playerState);
                playerState.IncreaseUltimatePower(3); // 투사체 주인의 궁극 주문력을 3 올려 줌.
            }
            PhotonNetwork.Destroy(gameObject);
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

    public void SetOwner(int photonViewId) // 해당 투사체의 주인 설정.
    {
        ownerPhotonViewId = photonViewId;
    }
}
