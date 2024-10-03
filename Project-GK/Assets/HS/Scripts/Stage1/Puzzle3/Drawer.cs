using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Drawer : MonoBehaviour
{
    [SerializeField] float moveSpeed = 2f;
    [SerializeField] public bool isOpen = false;
    [SerializeField] AudioSource openSound;
    [SerializeField] AudioSource closeSound;

    void OnTriggerEnter(Collider other)
    {
        if (!this.enabled) // 스크립트가 활성화 상태인지 확인
        {
            return; // 스크립트가 비활성화 상태면 충돌을 무시
        }

        if (other.gameObject.CompareTag("Projectile_Zard") ||
            other.gameObject.CompareTag("Projectile_Wi"))
        {
            Collider ownCollider;
            if (TryGetComponent<Collider>(out ownCollider))
            {
                if (!isOpen)
                {
                    OpenDrawer();
                }
                else
                {
                    CloseDrawer();
                }

                // Projectile 오브젝트 삭제
                Destroy(other.gameObject);
            }
        }
    }

    public void OpenDrawer()
    {
        openSound.Play();
        transform.Translate(new Vector3(3, 0, 0), Space.Self);
        isOpen = true;
    }

    public void CloseDrawer()
    {
        closeSound.Play();
        transform.Translate(new Vector3(-3, 0, 0), Space.Self);
        isOpen = false;
    }
}
