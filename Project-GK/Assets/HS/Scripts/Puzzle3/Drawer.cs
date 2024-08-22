using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Drawer : MonoBehaviour
{
    [SerializeField] float moveSpeed = 2f;
    [SerializeField] public bool isOpen = false;
    Puzzle3 puzzle3Manager;

    public void Start()
    {
        puzzle3Manager = FindAnyObjectByType<Puzzle3>();
        if(puzzle3Manager != null)
        {
            Debug.Log("퍼즐3 찾음");
        }
    }

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
                    OpenDrawer();
                }
                else
                {
                    CloseDrawer();
                }

                // Projectile 오브젝트 삭제
                Destroy(other.gameObject);
                puzzle3Manager.CheckPuzzleComplete();
            }
        }
    }

    public void OpenDrawer()
    {
        transform.Translate(new Vector3(-3, 0, 0), Space.Self);
        isOpen = false;
    }

    public void CloseDrawer()
    {
        transform.Translate(new Vector3(3, 0, 0), Space.Self);
        isOpen = true;
    }
}
