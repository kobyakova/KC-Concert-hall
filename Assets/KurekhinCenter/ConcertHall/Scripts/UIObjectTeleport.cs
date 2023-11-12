
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class UIObjectTeleport : UdonSharpBehaviour
{
    public GameObject target;
    public GameObject tarObject;
    public void _OnPress()
    {
        tarObject.transform.position = target.transform.position;
        tarObject.transform.rotation = target.transform.rotation;
    }
}
