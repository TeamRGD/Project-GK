using Photon.Pun;
using Photon.Realtime;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class PlayerListItem : MonoBehaviourPunCallbacks
{
    public Sprite wiImage;
    public Sprite zardImage;

    [SerializeField] Image character;
    [SerializeField] TMP_Text text;
    [SerializeField] TMP_Text role;

    private bool isPoping;

    Player player;


    public void SetUp(Player _player, string value)
    {
        player = _player;
        text.text = _player.NickName;
        if (_player.IsMasterClient)
        {
            character.sprite = wiImage;
            if (!isPoping) character.rectTransform.DOScale(Vector3.one * 0.5f, 0.5f).SetEase(Ease.OutBack).SetDelay(0.3f);
            role.text = value;
        }
        else
        {
            character.sprite = zardImage;
            if (!isPoping) character.rectTransform.DOScale(Vector3.one * 0.5f, 0.5f).SetEase(Ease.OutBack).SetDelay(0.3f);
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
