using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using System.IO;
using System.Numerics;

public class PlayerManager : MonoBehaviour
{
    PhotonView PV;
    private UnityEngine.Vector3 startPositionWi = new UnityEngine.Vector3(330, 6, 35); //S1
    private UnityEngine.Vector3 startPositionZard = new UnityEngine.Vector3(330, 6, 35); //S1
    //private UnityEngine.Vector3 startPositionWi = new UnityEngine.Vector3(37, 24, -17); //S2
    //private UnityEngine.Vector3 startPositionZard = new UnityEngine.Vector3(37, 5, 0); //S2
    //private UnityEngine.Vector3 startPositionWi = new UnityEngine.Vector3(25, 66, 0); //S3
    //private UnityEngine.Vector3 startPositionZard = new UnityEngine.Vector3(25, 66, 0); //S3
    //private UnityEngine.Vector3 startPositionWi = new UnityEngine.Vector3(13, 1, 1); // Ygg
    //private UnityEngine.Vector3 startPositionZard = new UnityEngine.Vector3(13, 1, -1); // Ygg
    //private UnityEngine.Vector3 startPositionWi = new UnityEngine.Vector3(193, 3, 0); // S4
    //private UnityEngine.Vector3 startPositionZard = new UnityEngine.Vector3(193, 3, 0); // S4


    private UnityEngine.Quaternion startRotationWi = UnityEngine.Quaternion.Euler(0, -90, 0); //S1
    private UnityEngine.Quaternion startRotationZard = UnityEngine.Quaternion.Euler(0, -90, 0); //S1
    //private UnityEngine.Quaternion startRotationWi = UnityEngine.Quaternion.Euler(90, 90, 180); //S2
    //private UnityEngine.Quaternion startRotationZard = UnityEngine.Quaternion.Euler(0, 90, 0); //S2
    //private UnityEngine.Quaternion startRotationWi = UnityEngine.Quaternion.Euler(0, -90, 0); //S3
    //private UnityEngine.Quaternion startRotationZard = UnityEngine.Quaternion.Euler(0, -90, 0); //S3
    //private UnityEngine.Quaternion startRotationWi = UnityEngine.Quaternion.Euler(0, 270, 0);  // Ygg
    //private UnityEngine.Quaternion startRotationZard = UnityEngine.Quaternion.Euler(0, 270, 0);  // Ygg
    //private UnityEngine.Quaternion startRotationWi = UnityEngine.Quaternion.Euler(0, 180, 0);  // S4
    //private UnityEngine.Quaternion startRotationZard = UnityEngine.Quaternion.Euler(0, 180, 0);  // S4

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
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "Wi"), startPositionWi, startRotationWi);
        }
        else
        {
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "Zard"), startPositionZard, startRotationZard);
        }
    }
}
