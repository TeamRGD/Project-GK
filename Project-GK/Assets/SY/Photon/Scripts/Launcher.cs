using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Photon.Pun;
using Photon.Realtime;
using TMPro;
using System.Linq;

public class Launcher : MonoBehaviourPunCallbacks
{

    public static Launcher instance;
    void Awake()
    {
        instance = this;
    }
    [SerializeField] TMP_InputField roomCodeInputField;
    [SerializeField] TMP_Text errorText;
    [SerializeField] TMP_Text roomNameText;
    [SerializeField] Transform playerListContent;
    [SerializeField] GameObject roomListItemPrefab;
    [SerializeField] GameObject playerListItemPrefab;
    [SerializeField] GameObject startGameButton;
    [SerializeField] GameObject readyGameButton;
    private bool isInStartMenu = false;
    private bool isFirst = true;
    public bool isReady;
    private List<RoomInfo> roomInfos = new List<RoomInfo>();

    void Start()
    {
        Debug.Log("Connecting to Master");
        PhotonNetwork.ConnectUsingSettings();
    }

    void Update()
    {
        if (isInStartMenu && IsAnyKeyPressed())
        {
            OpenTitleMenu();
        }

    }

    bool IsAnyKeyPressed() // 마우스 제외 키보드에서 아무 키 입력
    {
        foreach (KeyCode keyCode in System.Enum.GetValues(typeof(KeyCode)))
        {
            if (keyCode >= KeyCode.Mouse0 && keyCode <= KeyCode.Mouse6)
                continue;

            if (Input.GetKeyDown(keyCode))
            {
                return true;
            }
        }
        return false;
    }

    public override void OnConnectedToMaster()
    {
        Debug.Log("Connected to Master");
        PhotonNetwork.JoinLobby();
        PhotonNetwork.AutomaticallySyncScene = true;
    }

    public override void OnJoinedLobby()
    {
        if (isFirst)
        {
            MenuManager.Instance.OpenMenu("Start");
            isInStartMenu = true;
            isFirst = false;
        }
        else
        {
            MenuManager.Instance.OpenMenu("Title");
        }
        Debug.Log("Joined Lobby");
        //PhotonNetwork.NickName = "Player " + Random.Range(0, 1000).ToString("0000");
    }

    void OpenTitleMenu()
    {
        MenuManager.Instance.OpenMenu("Title");
        isInStartMenu = false;
    }

    public void BackToTitleMenu()
    {
        MenuManager.Instance.OpenMenu("Title");
    }

    public void CreateRoom()
    {
        PhotonNetwork.CreateRoom(Random.Range(100000, 999999).ToString("000000"));
        PhotonNetwork.NickName = "Wi";
        MenuManager.Instance.OpenMenu("Loading");
    }

    public void EnterRoom()
    {
        foreach (RoomInfo roomInfo in roomInfos)
        {
            if (roomInfo.Name == roomCodeInputField.text)
            {
                Debug.Log("Success");
                JoinRoom(roomInfo);
                roomCodeInputField.text = "";
                return;
            }
        }
        roomCodeInputField.text = "";
    }

    public override void OnRoomListUpdate(List<RoomInfo> roomList)
    {
        roomInfos.Clear();
        foreach (RoomInfo roomInfo in roomList)
        {
            if (!roomInfo.RemovedFromList)
            {
                roomInfos.Add(roomInfo);
            }
        }
    }

    void UpdatePlayerList()
    {
        Player[] players = PhotonNetwork.PlayerList;

        foreach(Transform child in playerListContent)
        {
            Destroy(child.gameObject);
        }

        for (int i = 0; i < players.Count(); i++)
        {
            if (players[i].IsMasterClient)
            {
                Instantiate(playerListItemPrefab, playerListContent).GetComponent<PlayerListItem>().SetUp(players[i], "Host");
            }
            else
            {
                object isReady_;
                if (players[i].CustomProperties.TryGetValue("isReady", out isReady_))
                {
                    Instantiate(playerListItemPrefab, playerListContent).GetComponent<PlayerListItem>().SetUp(players[i], ((bool)isReady_) ? "Ready" : "Not Ready");
                }
            }
        }
    }

    public override void OnJoinedRoom()
    {
        MenuManager.Instance.OpenMenu("room");
        roomNameText.text = PhotonNetwork.CurrentRoom.Name;
        roomCodeInputField.text = "";

        SetIsReady(PhotonNetwork.IsMasterClient);
        UpdatePlayerList();

        startGameButton.SetActive(PhotonNetwork.IsMasterClient);
        readyGameButton.SetActive(!PhotonNetwork.IsMasterClient);
    }

    void SetIsReady(bool value)
    {
        isReady = value;
        SetPlayerReadyState(isReady);
    }

    public override void OnMasterClientSwitched(Player newMasterClient)
    {
        PhotonNetwork.NickName = "Wi";
        
        SetIsReady(PhotonNetwork.IsMasterClient);

        UpdatePlayerList();

        startGameButton.SetActive(PhotonNetwork.IsMasterClient);
        readyGameButton.SetActive(!PhotonNetwork.IsMasterClient);
    }

    public override void OnCreateRoomFailed(short returnCode, string message)
    {
        errorText.text = "Room Creation Failed " + message;
        MenuManager.Instance.OpenMenu("error");
    }

    public void StartGame()
    {
        if (AreAllPlayersReady())
        {
            PhotonNetwork.LoadLevel(1);
        }
        else
        {
            Debug.Log("Not all players are ready.");
        }
    }

    bool AreAllPlayersReady()
    {
        foreach (Player player in PhotonNetwork.PlayerList)
        {
            object isReady;
            if (player.CustomProperties.TryGetValue("isReady", out isReady))
            {
                if ((bool)isReady == false)
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        return true;
    }

    public void OnClickReadyButton()
    {
        SetIsReady(!isReady);
        UpdatePlayerList();
    }

    void SetPlayerReadyState(bool readyState)
    {
        ExitGames.Client.Photon.Hashtable props = new ExitGames.Client.Photon.Hashtable
        {
            { "isReady", readyState }
        };
        PhotonNetwork.LocalPlayer.SetCustomProperties(props);
    }

    public void LeaveRoom()
    {
        PhotonNetwork.LeaveRoom();
        MenuManager.Instance.OpenMenu("Loading");
    }

    public void JoinRoom(RoomInfo info)
    {
        PhotonNetwork.JoinRoom(info.Name);
        MenuManager.Instance.OpenMenu("Loading");
        PhotonNetwork.NickName = "Zard";
        SetIsReady(PhotonNetwork.IsMasterClient);
    }

    public override void OnLeftRoom()
    {
        MenuManager.Instance.OpenMenu("Title");
    }

    public override void OnPlayerEnteredRoom(Player newPlayer)
    {
        UpdatePlayerList();
    }

    public override void OnPlayerPropertiesUpdate(Player targetPlayer, ExitGames.Client.Photon.Hashtable changedProps)
    {
        UpdatePlayerList();
    }
}