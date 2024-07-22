using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using System.IO;
using System.Numerics;

public class PlayerManager : MonoBehaviour
{
    PhotonView PV;
    private UnityEngine.Vector3 startPositionWi = UnityEngine.Vector3.zero;
    private UnityEngine.Vector3 startPositionZard = new UnityEngine.Vector3(5, 0, 0);


    void Awake()
    {
        PV = GetComponent<PhotonView>();
    }

    void Start()
    {
        if (PV.IsMine) 
        {
            CreateController(); 
        }
    }
    
    void CreateController()
    {
        if (PhotonNetwork.IsMasterClient)
        {
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "Wi"), startPositionWi, UnityEngine.Quaternion.identity);
        }
        else
        {
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "Zard"), startPositionZard, UnityEngine.Quaternion.identity);
        }
    }
}
