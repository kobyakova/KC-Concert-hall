
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
    public Color col;
    //public string testVar;

    public override void OnPickup()
    {
        if (increase.isOn)
        {
            
            mainScript.SetProgramVariable("heldMicro", this.gameObject);
            //this.GetComponent<Renderer>().material.SetColor("_EmissionColor", Color.white * 3);

            mainScript.SendCustomEvent(pickupEventName);
        }
    } 
    public override void OnDrop() 
    {
        mainScript.SendCustomEvent(dropEventName);
        
    }
}
