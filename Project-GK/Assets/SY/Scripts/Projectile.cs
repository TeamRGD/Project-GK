using Photon.Pun;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public int attackPower;
    private int ownerPhotonViewId;
    private WaitForSeconds seconds = new WaitForSeconds(3f);

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
                PV.GetComponent<PlayerStateManager>().IncreaseUltimatePower(3);
            }
            Destroy(gameObject);
        }
    }
    private void DestroyProjectileAfterTime()
    {
        StartCoroutine(DestroyAfterSeconds());
    }

    private IEnumerator DestroyAfterSeconds()
    {
        yield return seconds;
        Destroy(gameObject);
    }

    public void SetOwner(int photonViewId)
    {
        ownerPhotonViewId = photonViewId;
    }
}
