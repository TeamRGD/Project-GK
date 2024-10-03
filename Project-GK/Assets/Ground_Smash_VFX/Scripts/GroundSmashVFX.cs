using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroundSmashVFX : MonoBehaviour
{

   public GameObject smashFX;
   public GameObject avatar;
   public AudioSource groundSmashAudio;

   private bool castingMagicCheck = false;
   private Animator magicAnim;

    void Start()
    {

         magicAnim = avatar.GetComponent<Animator>();
         smashFX.SetActive(false);

    }


    void Update()
    {

        if (Input.GetButtonDown("Fire1"))
        {

            if (castingMagicCheck == false)
            {
                    StartCoroutine("StartGroundSmash");
                    castingMagicCheck = true;     

            }

        }

    }


    IEnumerator StartGroundSmash()
    {

        magicAnim.SetBool("smash", true);
        groundSmashAudio.Play();

        // Add a delay if if a casting animation needs to complete first
        yield return new WaitForSeconds(0.0f);  

        smashFX.SetActive(true);

        yield return new WaitForSeconds(1.0f);

        magicAnim.SetBool("smash", false);

        yield return new WaitForSeconds(3.5f);  

        magicAnim.SetBool("smash", false);

        smashFX.SetActive(false);
        castingMagicCheck = false;

    }

}

