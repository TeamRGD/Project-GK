using System.Collections;
using UnityEngine;

public class BreakableStone : MonoBehaviour
{
    [SerializeField] Puzzle0Manager puzzle0Manager;
    [SerializeField] private int maxHealth = 5; // 돌의 최대 체력
    private int currentHealth; // 돌의 현재 체력

    [SerializeField] private GameObject[] debrisPrefab; // 돌이 부서질 때 나타날 잔해 프리팹
    [SerializeField] private AudioSource audioSource; // 소리를 재생할 AudioSource

    MeshDestroy meshDestroy;
    Outline outline;

    void Start()
    {
        meshDestroy = GetComponent<MeshDestroy>();
        outline = GetComponent<Outline>();
        // 초기 체력을 설정
        currentHealth = maxHealth;

        // AudioSource가 설정되지 않았을 경우 컴포넌트 자동 할당
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
    }

    // Projectile과 충돌했을 때 호출되는 함수
    private void OnTriggerEnter(Collider other)
    {
        // 충돌한 오브젝트가 Projectile 태그를 가지고 있을 때
        if (other.gameObject.CompareTag("Projectile_Wi") || other.gameObject.CompareTag("Projectile_Zard"))
        {
            // 체력 감소
            TakeDamage(1);

            // 충돌한 Projectile 삭제
            Destroy(other.gameObject);
        }
    }

    // 체력을 감소시키고, 체력이 0 이하가 되면 부서짐 처리
    private void TakeDamage(int damage)
    {
        currentHealth -= damage;

        if (currentHealth <= 0)
        {
            StartCoroutine(Break());
        }
    }

    // 돌이 부서질 때의 처리
    IEnumerator Break()
    {
        puzzle0Manager.PuzzleProgress();
        // 효과음을 재생
        if (audioSource != null && audioSource.clip != null)
        {
            audioSource.Play();
            Debug.Log("소리 남");
        }
        else
        {
            Debug.Log("소리 안 남");
        }

        // 잔해 생성
        for (int i = 0; i < debrisPrefab.Length; i++)
        {
            debrisPrefab[i].SetActive(true);
        }
        outline.enabled = false;
        meshDestroy.DestroyMesh();

        // 돌 오브젝트 파괴
        yield return new WaitForSeconds(3f);

        Destroy(gameObject);
    }
}
