
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class MicrophoneSub : UdonSharpBehaviour
{
    public UdonBehaviour mainScript;
    public string pickupEventName;
    public string dropEventName;
    public Toggle increase;

    public override void OnPickup()
    {
        if(increase.isOn)  mainScript.SendCustomEvent(pickupEventName);
    }
    public override void OnDrop() 
    {
        mainScript.SendCustomEvent(dropEventName);
    }
}
