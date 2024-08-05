using Photon.Pun;
using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class PlayerListItem : MonoBehaviourPunCallbacks
{
    [SerializeField] TMP_Text text;
    [SerializeField] TMP_Text role;

    Player player;
    public void SetUp(Player _player, string value)
    {
        player = _player;
        text.text = _player.NickName;
        if (_player.IsMasterClient)
        {
            role.text = value;
        }
        else
        {
            role.text = value;
        }
    }

    public override void OnPlayerLeftRoom(Player otherPlayer)
    {
        if(player == otherPlayer)
        {
            Destroy(gameObject);
        }
    }

    public override void OnLeftRoom()
    {
        Destroy(gameObject);
    }

    public void ChangeRoleText(string value)
    {
        role.text = value;
    }
}
