using System.Collections;
using System.Collections.Generic;
using Photon.Pun;
using UnityEngine;

public class PlayerToolManager : MonoBehaviour
{
    PhotonView PV;
    PlayerAttack playerAttack;
    public List<GameObject> tools = new List<GameObject>();
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
        if (Input.GetAxis("Mouse ScrollWheel") > 0f)
        {
            SwitchToNextTool();
        }
        else if (Input.GetAxis("Mouse ScrollWheel") < 0f)
        {
            SwitchToPreviousTool();
        }
    }

    void SwitchToNextTool()
    {
        PV.RPC("SwitchToNextToolRPC", RpcTarget.AllBuffered);
        PV.RPC("SetInventoryUIRPC", RpcTarget.AllBuffered);
    }

    void SwitchToPreviousTool()
    {
        PV.RPC("SwitchToPreviousToolRPC", RpcTarget.AllBuffered);
        PV.RPC("SetInventoryUIRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void SwitchToNextToolRPC()
    {
        currentToolIndex = (currentToolIndex + 1) % tools.Count;
        UIManager_Player.Instance.SetInventory(currentToolIndex);
        UpdateToolVisibility();
    }

    [PunRPC]
    void SetInventoryUIRPC()
    {
        if (!PV.IsMine)
            return;
        UIManager_Player.Instance.SetInventory(currentToolIndex);
    }

    [PunRPC]
    void SwitchToPreviousToolRPC()
    {
        currentToolIndex = (currentToolIndex - 1 + tools.Count) % tools.Count;
        UpdateToolVisibility();
    }

    void UpdateToolVisibility()
    {
        PV.RPC("UpdateToolVisibilityRPC", RpcTarget.AllBuffered);
    }

    [PunRPC]
    void UpdateToolVisibilityRPC()
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

    public void SetCanChange(bool value)
    {
        PV.RPC("SetCanChangeRPC", RpcTarget.AllBuffered, value);
    }

    [PunRPC]
    void SetCanChangeRPC(bool value)
    {
        canChange = value;
    }
}
