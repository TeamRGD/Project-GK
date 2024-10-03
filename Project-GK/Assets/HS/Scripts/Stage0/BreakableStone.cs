using System.Collections;
using UnityEngine;
using Photon.Pun;

public class BreakableStone : MonoBehaviourPunCallbacks
{
    [SerializeField] Puzzle0Manager puzzle0Manager;
    [SerializeField] private int maxHealth = 5; // 돌의 최대 체력
    [SerializeField] int currentHealth; // 돌의 현재 체력

    [SerializeField] private GameObject[] debrisPrefab; // 돌이 부서질 때 나타날 잔해 프리팹
    [SerializeField] private AudioSource audioSource; // 소리를 재생할 AudioSource

    MeshDestroy meshDestroy;
    Outline outline;
    PhotonView PV;

    void Start()
    {
        meshDestroy = GetComponent<MeshDestroy>();
        outline = GetComponent<Outline>();
        PV = GetComponent<PhotonView>();

        // 초기 체력을 설정
        currentHealth = maxHealth;

        // AudioSource가 설정되지 않았을 경우 컴포넌트 자동 할당
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
    }

    public void TakeDamage(int damage)
    {
        PV.RPC("TakeDamageRPC", RpcTarget.AllBuffered, damage);
    }

    [PunRPC]
    void TakeDamageRPC(int damage)
    {
        currentHealth -= damage;

        if (currentHealth <= 0)
        {
            // 돌 파괴를 모든 클라이언트에게 전파
            PV.RPC("Break", RpcTarget.AllBuffered);
        }
    }

    // 돌이 부서질 때의 처리
    [PunRPC]
    private void Break()
    {
        puzzle0Manager.PuzzleProgress();

        // 효과음을 재생
        if (audioSource != null && audioSource.clip != null)
        {
            audioSource.Play();
        }

        // 잔해 생성
        for (int i = 0; i < debrisPrefab.Length; i++)
        {
            debrisPrefab[i].SetActive(true);
        }

        outline.enabled = false;
        meshDestroy.DestroyMesh();

        // 돌 오브젝트 파괴
        StartCoroutine(DestroyStone());
    }

    IEnumerator DestroyStone()
    {
        yield return new WaitForSeconds(3f);
        // 돌 오브젝트를 네트워크 상에서 파괴
        PhotonNetwork.Destroy(gameObject);
    }
}
