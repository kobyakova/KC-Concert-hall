
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class DreamologyAnims : UdonSharpBehaviour
{
    public Animator dreamologiAnimator;

    public GameObject[] effects;
    public Toggle[] effectToggles;

    public string[] ActNames;

    private void Start()
    {
        EffectsInclude();
    }
    public void ActHall()
    {
        dreamologiAnimator.Play(ActNames[0]);
    }
    public void ActHallBroken()
    {
        dreamologiAnimator.Play(ActNames[1]);
    }
    public void ActHallAppear()
    {
        dreamologiAnimator.Play(ActNames[2]);
    }
    public void ActWakeUp()
    {
        dreamologiAnimator.Play(ActNames[3]);
    }
    public void ActDiologs()
    {
        dreamologiAnimator.Play(ActNames[4]);
    }
    public void ActArhetip()
    {
        dreamologiAnimator.Play(ActNames[5]);
    }
    public void ActNoise()
    {
        dreamologiAnimator.Play(ActNames[6]);
    }
    public void ActChoise()
    {
        dreamologiAnimator.Play(ActNames[7]);
    }
    public void ActIdle()
    {
        dreamologiAnimator.Play(ActNames[8]);
    }
    public void ActEnd1()
    {
        dreamologiAnimator.Play(ActNames[9]);
    }
    public void ActEnd2()
    {
        dreamologiAnimator.Play(ActNames[10]);
    }

    public void EffectsInclude()
    {
        for (int i = 0; i < effects.Length; i++)
        {
            if (effects[i] == null) return;
            if (effectToggles[i] == null) return;

            effects[i].SetActive(effectToggles[i].isOn);
        }
    }
}
