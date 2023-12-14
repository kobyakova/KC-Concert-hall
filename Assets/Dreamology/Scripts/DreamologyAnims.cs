
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

    public Text currentActText;
    public string[] ActNames;

    private void Start()
    {
        EffectsInclude();
    }
    public void ActHall()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "Hall");
    }
    public void Hall()
    {
        dreamologiAnimator.Play(ActNames[0]);
        currentActText.text = ActNames[0];
    }

    public void ActHallBroken()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "HallBroken");
    }
    public void HallBroken()
    {
        dreamologiAnimator.Play(ActNames[1]);
        currentActText.text = ActNames[1];
    }

    public void ActHallAppear()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "HallAppear");
    }
    public void HallAppear()
    {
        dreamologiAnimator.Play(ActNames[2]);
        currentActText.text = ActNames[2];
    }

    public void ActWakeUp()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "WakeUp");
    }
    public void WakeUp()
    {
        dreamologiAnimator.Play(ActNames[3]);
        currentActText.text = ActNames[3];
    }

    public void ActDiologs()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "Diologs");
    }
    public void Diologs()
    {
        dreamologiAnimator.Play(ActNames[4]);
        currentActText.text = ActNames[4];
    }

    public void ActArhetip()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "Arhetip");
    }
    public void Arhetip()
    {
        dreamologiAnimator.Play(ActNames[5]);
        currentActText.text = ActNames[5];
    }

    public void ActNoise()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "Noise");
    }
    public void Noise()
    {
        dreamologiAnimator.Play(ActNames[6]);
        currentActText.text = ActNames[6];
    }

    public void ActChoise()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "Choise");
    }
    public void Choise()
    {
        dreamologiAnimator.Play(ActNames[7]);
        currentActText.text = ActNames[7];
    }

    public void ActIdle()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "Idle");
    }
    public void Idle()
    {
        dreamologiAnimator.Play(ActNames[8]);
        currentActText.text = ActNames[8];
    }

    public void ActEnd1()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "End1");
    }
    public void End1()
    {
        dreamologiAnimator.Play(ActNames[9]);
        currentActText.text = ActNames[9];
    }

    public void ActEnd2()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "End2");
    }
    public void End2()
    {
        dreamologiAnimator.Play(ActNames[10]);
        currentActText.text = ActNames[10];
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
