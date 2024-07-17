using System.Collections;
using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class PlayerToolManager : MonoBehaviour
{
    PhotonView PV;
    public GameObject mainWeapon; // 주무기
    public GameObject telautograph; // 전송기
    private int toolNumber = 1;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
    }

    void Update()
    {
        if (!PV.IsMine)
            return;
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            SwitchToMainWeapon();
        }
        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            SwitchToTelautograph();
        }
    }

    public void SwitchToMainWeapon()
    {
        PV.RPC("SwitchToMainWeaponRPC", RpcTarget.AllBuffered);
    }

    public void SwitchToTelautograph()
    {
        PV.RPC("SwitchToTelautographRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void SwitchToMainWeaponRPC()
    {
        mainWeapon.SetActive(true);
        telautograph.SetActive(false);
        toolNumber = 1;
    }

    [PunRPC]
    void SwitchToTelautographRPC()
    {
        mainWeapon.SetActive(false);
        telautograph.SetActive(true);
        toolNumber = 2;
    }

    public int GetToolNumber()
    {
        return toolNumber;
    }
}
