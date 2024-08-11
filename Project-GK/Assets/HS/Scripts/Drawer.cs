using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Drawer : MonoBehaviour
{
    [SerializeField] float moveSpeed = 2f;
    [SerializeField] bool isOpen = false;

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Projectile_Zard") ||
            other.gameObject.CompareTag("Projectile_Wi"))
        {
            Collider ownCollider;
            if (TryGetComponent<Collider>(out ownCollider))
            {
                if (isOpen)
                {
                    transform.Translate(new Vector3(-3, 0, 0), Space.Self);
                    isOpen = false;
                }
                else
                {
                    transform.Translate(new Vector3(3, 0, 0), Space.Self);
                    isOpen = true;
                }

                // Projectile 오브젝트 삭제
                Destroy(other.gameObject);
            }
        }
    }
}
