using System.Collections;
using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class PlayerToolManager : MonoBehaviour
{

    // Component
    PhotonView PV;
    PlayerAttack playerAttack;
    public List<GameObject> entireTools = new List<GameObject>();
    List<GameObject> tools = new List<GameObject>();

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
        tools.Add(entireTools[0]);
        tools.Add(entireTools[1]);
        tools.Add(entireTools[2]);
        UIManager_Player.Instance.SetInventory(0, tools);
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
        if(!PV.IsMine)
            return;
        PV.RPC("SwitchToNextToolRPC", RpcTarget.AllBuffered);
        //UIManager_Player.Instance.SetInventory(currentToolIndex, tools);
    }

    void SwitchToPreviousTool()
    {
        if(!PV.IsMine)
            return;
        PV.RPC("SwitchToPreviousToolRPC", RpcTarget.AllBuffered);
        //UIManager_Player.Instance.SetInventory(currentToolIndex, tools);
    }

    [PunRPC]
    void SwitchToNextToolRPC()
    {
        currentToolIndex = (currentToolIndex + 1) % tools.Count;
        UpdateToolVisibility();
        UIManager_Player.Instance.SetInventory(currentToolIndex, tools);
    }

    [PunRPC]
    void SwitchToPreviousToolRPC()
    {
        currentToolIndex = (currentToolIndex - 1 + tools.Count) % tools.Count;
        UpdateToolVisibility();
        UIManager_Player.Instance.SetInventory(currentToolIndex, tools);
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


    public void AddTool(int idx)
    {
        if(!PV.IsMine)
            return;
        PV.RPC("AddToolRPC", RpcTarget.AllBuffered, idx);
    }

    [PunRPC]
    void AddToolRPC(int idx)
    {
        tools.Add(entireTools[idx]);
        UpdateToolVisibility();
    }

    public void UseTool(int idx)
    {
        if(!PV.IsMine)
            return;
        PV.RPC("UseToolRPC", RpcTarget.AllBuffered, idx);
    }

    [PunRPC]
    void UseToolRPC(int idx)
    {
        currentToolIndex = 0; // [임시완]
        tools.RemoveAt(idx);
        UpdateToolVisibility();
    }
    
}

