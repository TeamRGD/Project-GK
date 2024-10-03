using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using System.IO;
using System.Numerics;
using UnityEngine.SceneManagement;

public class PlayerManager : MonoBehaviour
{
    PhotonView PV;

    List<UnityEngine.Vector3> startPositionWi = new List<UnityEngine.Vector3>
    {
        new UnityEngine.Vector3(330, 0, 32), // S1
        new UnityEngine.Vector3(37, 24, -17), // S2
        new UnityEngine.Vector3(13, 1, 1), // Ygg
        new UnityEngine.Vector3(25, 66, 0), // S3
        new UnityEngine.Vector3(-10, 4, -1), // Vanta
        new UnityEngine.Vector3(193, 3, 0) // S4
    };
    List<UnityEngine.Vector3> startPositionZard = new List<UnityEngine.Vector3>
    {
        new UnityEngine.Vector3(330, 0, 37), // S1
        new UnityEngine.Vector3(37, 5, 0), // S2
        new UnityEngine.Vector3(13, 1, -1), // Ygg
        new UnityEngine.Vector3(25, 66, 0), // S3
        new UnityEngine.Vector3(-10, 4, 1), // Vanta
        new UnityEngine.Vector3(193, 3, 0) // S4
    };
    List<UnityEngine.Quaternion> startRotationWi = new List<UnityEngine.Quaternion>
    {
        UnityEngine.Quaternion.Euler(0, -90, 0), // S1
        UnityEngine.Quaternion.Euler(90, 90, 180), // S2
        UnityEngine.Quaternion.Euler(0, 270, 0), // Ygg
        UnityEngine.Quaternion.Euler(0, -90, 0), // S3
        UnityEngine.Quaternion.Euler(0, 270, 0), // Vanta
        UnityEngine.Quaternion.Euler(0, 180, 0) // S4
    };
    List<UnityEngine.Quaternion> startRotationZard = new List<UnityEngine.Quaternion>
    {
        UnityEngine.Quaternion.Euler(0, -90, 0), // S1
        UnityEngine.Quaternion.Euler(0, 90, 0), // S2
        UnityEngine.Quaternion.Euler(0, 270, 0), // Ygg
        UnityEngine.Quaternion.Euler(0, -90, 0), // S3
        UnityEngine.Quaternion.Euler(0, 270, 0), // Vanta
        UnityEngine.Quaternion.Euler(0, 180, 0) // S4
    };

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
        int currentSceneIndex = SceneManager.GetActiveScene().buildIndex;

        if (PhotonNetwork.IsMasterClient)
        {
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "Wi"), startPositionWi[currentSceneIndex-1], startRotationWi[currentSceneIndex-1]);
        }
        else
        {
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "Zard"), startPositionZard[currentSceneIndex-1], startRotationZard[currentSceneIndex-1]);
        }
    }
}
