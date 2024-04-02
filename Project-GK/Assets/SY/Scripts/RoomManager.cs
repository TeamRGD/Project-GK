using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using UnityEngine.SceneManagement;
using System.IO;

public class RoomManager : MonoBehaviourPunCallbacks
{
    public static RoomManager Instance;
    public static Vector3[] playerFirstPositions;

    void Awake()
    {
        if(Instance) // checks if another RoomManger exists
        {
            Destroy(gameObject); // there can only be one
            return;
        }
        DontDestroyOnLoad(gameObject); // I am the only one
        Instance = this;

        playerFirstPositions = new Vector3[2]
        {
            new Vector3(15f, 0f, 20f),    // ù ��° �÷��̾��� ��ġ (pos1)
            new Vector3(-15f, 0f, 20f)     // �� ��° �÷��̾��� ��ġ (pos2)
        };
    }

    public override void OnEnable()
    {
        base.OnEnable();
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    public override void OnDisable()
    {
        base.OnDisable();
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode loadSceneMode)
    {
        if(scene.buildIndex==1) // We're in the game scene
        {
            PhotonNetwork.Instantiate(Path.Combine("PhotonPrefabs", "PlayerManager"), Vector3.zero, Quaternion.identity);
        }
    }
}
