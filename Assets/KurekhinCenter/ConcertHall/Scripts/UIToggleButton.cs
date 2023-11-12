
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class UIToggleButton : UdonSharpBehaviour
{
    public Toggle togl;
    public GameObject target;
    public void _ValueChange(){
        target.SetActive(togl.isOn);
    }
}
