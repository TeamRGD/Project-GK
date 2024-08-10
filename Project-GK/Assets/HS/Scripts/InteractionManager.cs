using UnityEngine;

public class InteractionManager : MonoBehaviour
{
    [SerializeField]    Puzzle1Note puzzle1Note;

    // 오픈할 UI를 찾기 위해 Tag들을 비교하는 함수.
    public void CheckForTags(RaycastHit hitInfo)
    {
        if (hitInfo.collider.CompareTag("Note"))
        {
            if (Input.GetKey(KeyCode.E))
            {
                Puzzle1Note.ActiveUI();
            }
        }

        if (hitInfo.collider.CompareTag("Stair"))
        {
            // 이동식 발판
        }
    }
}
