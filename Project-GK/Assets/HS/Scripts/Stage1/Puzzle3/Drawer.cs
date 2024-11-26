using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;


public class Drawer : MonoBehaviour
{
    [SerializeField] float moveSpeed = 2f;
    [SerializeField] public bool isOpen = false;
    [SerializeField] AudioSource openSound;
    [SerializeField] AudioSource closeSound;

    public bool isAvailable = true;


    PhotonView PV;

    private void Start()
    {
        PV = GetComponent<PhotonView>();
    }

    
    void OnTriggerEnter(Collider other)
    {
        if (!this.enabled) // 스크립트가 활성화 상태인지 확인
        {
            return; // 스크립트가 비활성화 상태면 충돌을 무시
        }

        if (other.gameObject.CompareTag("Projectile_Zard") ||
            other.gameObject.CompareTag("Projectile_Wi"))
        {
            Collider ownCollider;
            if (TryGetComponent<Collider>(out ownCollider))
            {
                if (!isOpen && isAvailable)
                {
                    OpenDrawer();
                }
                else if(isOpen && isAvailable)
                {
                    CloseDrawer();
                }
            }
        }
    }
    

    public void OpenDrawer()
    {
        if (!isOpen)
        {
            openSound.Play();
            PV.RPC("OpenDrawerRPC", RpcTarget.AllBuffered);
        }
    }

    [PunRPC]
    void OpenDrawerRPC()
    {
        transform.Translate(new Vector3(3, 0, 0), Space.Self);
        isOpen = true;
    }

    public void CloseDrawer()
    {
        if (isOpen)
        {
            closeSound.Play();
            PV.RPC("CloseDrawerRPC", RpcTarget.AllBuffered);
        }
    }

    [PunRPC]
    void CloseDrawerRPC()
    {
        transform.Translate(new Vector3(-3, 0, 0), Space.Self);
        isOpen = false;
    }

    public void SetDrawer(float x = 0, float y = 0, float z = 0)
    {
        openSound.Play();
        PV.RPC("SetDrawerRPC", RpcTarget.AllBuffered, x, y, z);
    }

    [PunRPC]
    void SetDrawerRPC(float x = 0, float y = 0, float z = 0)
    {
        transform.Translate(new Vector3(x, y, z), Space.Self);
        isAvailable = false;
    }
}
