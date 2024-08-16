using System.Collections;
using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class PlayerToolManager : MonoBehaviour
{

    // Component
    PhotonView PV;
    PlayerAttack playerAttack;
    public List<GameObject> tools = new List<GameObject>();

    // Information variable
    private int currentToolIndex = 0;
    private bool canChange = true;

    void Awake()
    {
        TryGetComponent<PhotonView>(out PV);
        TryGetComponent<PlayerAttack>(out playerAttack);
    }

    void Start()
    {
        UpdateToolVisibility();
    }

    void Update()
    {
        if (!PV.IsMine || !canChange)
            return;
        if (Input.GetAxis("Mouse ScrollWheel") < 0f)
        {
            SwitchToNextTool();
        }
        else if (Input.GetAxis("Mouse ScrollWheel") > 0f)
        {
            SwitchToPreviousTool();
        }
    }

    void SwitchToNextTool()
    {
        PV.RPC("SwitchToNextToolRPC", RpcTarget.AllBuffered);
        UIManager_Player.Instance.SetInventory(currentToolIndex);
    }

    void SwitchToPreviousTool()
    {
        PV.RPC("SwitchToPreviousToolRPC", RpcTarget.AllBuffered);
        UIManager_Player.Instance.SetInventory(currentToolIndex);
    }

    [PunRPC]
    void SwitchToNextToolRPC()
    {
        currentToolIndex = (currentToolIndex + 1) % tools.Count;
        UpdateToolVisibility();
    }

    [PunRPC]
    void SwitchToPreviousToolRPC()
    {
        currentToolIndex = (currentToolIndex - 1 + tools.Count) % tools.Count;
        UpdateToolVisibility();
    }

    void UpdateToolVisibility()
    {
        for (int i = 0; i < tools.Count; i++)
        {
            tools[i].SetActive(i == currentToolIndex);
        }
        playerAttack.SetCanAttack(currentToolIndex == 0); 
    }

    public int GetCurrentToolIndex()
    {
        return currentToolIndex;
    }

    public void SetCanChange(bool value)
    {
        canChange = value;
    }


    /* 상호작용 부분에서 수정 필요.
    public void AddTool(GameObject newTool)
    {
        PV.RPC("AddToolRPC", RpcTarget.AllBuffered, newTool.GetComponent<PhotonView>().ViewID);
    }

    [PunRPC]
    void AddToolRPC(int newToolViewID)
    {
        PhotonView newToolPV = PhotonView.Find(newToolViewID);
        if (newToolPV != null)
        {
            tools.Add(newToolPV.gameObject);
            UpdateToolVisibility();
        }
    }
    */
}
