using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;

public class Destroy : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        DestroyProjectileAfterTime();
    }

    private void DestroyProjectileAfterTime() // n초 후 제거.
    {
        StartCoroutine(DestroyAfterSeconds());
    }

    private IEnumerator DestroyAfterSeconds()
    {
        yield return 1.0f;
        PhotonNetwork.Destroy(gameObject);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
