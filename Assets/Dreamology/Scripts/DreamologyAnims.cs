
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

    public GameObject[] statues;
    public Toggle[] includeStatues;

    public GameObject[] scenaEdges;
    public Material[] sceneeEdgesMaterials;
    public Dropdown scenaEdgeMaterialSwitcher;

    private void Start()
    {
        EffectsInclude();
        ScenaEdgesEffect();
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

    
    public void HallAppear()
    {
        dreamologiAnimator.Play(ActNames[2]);
        currentActText.text = ActNames[2];
    }

    public void ActHallAppear()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "HallAppear");
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

    public void Statues()
    {
        for (int i = 0; i < statues.Length; i++)
        {
            statues[i].SetActive(includeStatues[i].isOn);
        }
    }

        public void EffectsInclude()
    {
        for (int i = 0; i < effects.Length; i++)
        {
            //if (effects[i] == null) return;
            //if (effectToggles[i] == null) return;

            effects[i].SetActive(effectToggles[i].isOn);
        } 
    }

    public void ScenaEdgesEffect()
    {
        for (int i = 0; i < scenaEdges.Length; i++)
        {
            scenaEdges[i].GetComponent<Renderer>().material = sceneeEdgesMaterials[scenaEdgeMaterialSwitcher.value];
        }
    }

    

    public void ActEmptyAnim1()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "EmptyAnim1");
    }
    public void EmptyAnim1()
    {
        dreamologiAnimator.Play(ActNames[11]);
        currentActText.text = ActNames[11];
    }
    public void ActEmptyAnim2()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "EmptyAnim2");
    }
    public void EmptyAnim2()
    {
        dreamologiAnimator.Play(ActNames[12]);
        currentActText.text = ActNames[12];
    }
    public void ActEmptyAnim3()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "EmptyAnim3");
    }
    public void EmptyAnim3()
    {
        dreamologiAnimator.Play(ActNames[13]);
        currentActText.text = ActNames[13];
    }
    public void ActEmptyAnim4()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "EmptyAnim4");
    }
    public void EmptyAnim4()
    {
        dreamologiAnimator.Play(ActNames[14]);
        currentActText.text = ActNames[14];
    }
    public void ActEmptyAnim5()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "EmptyAnim5");
    }
    public void EmptyAnim5()
    {
        dreamologiAnimator.Play(ActNames[15]);
        currentActText.text = ActNames[15];
    }
    public void ActEmptyAnim6()
    {
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "EmptyAnim6");
    }
    public void EmptyAnim6()
    {
        dreamologiAnimator.Play(ActNames[16]);
        currentActText.text = ActNames[16];
    }
}
