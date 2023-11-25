
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class CanvasLocker : UdonSharpBehaviour
{
    
    public UnityEngine.UI.Toggle locker;

    public UnityEngine.UI.Slider[] sliders;
    public UnityEngine.UI.Toggle[] toggles;
    public UnityEngine.UI.Dropdown[] dropdowns;
    public UnityEngine.UI.Button[] buttons;


    void Start()
    {
        _lockerValueChange();
    }

    public void _lockerValueChange()
    {        

        for (int i = 0; i < sliders.Length; i++)
        {
            if (sliders[i] != null)
            {
                sliders[i].interactable = !locker.isOn;
            }
        }

        for (int i = 0; i < toggles.Length; i++)
        {
            if (toggles[i] != null)
            {
                toggles[i].interactable = !locker.isOn;
            }
        }

        for (int i = 0; i < dropdowns.Length; i++) 
        {
            if (dropdowns[i] != null)
            {
                dropdowns[i].interactable = !locker.isOn;
            }
        }

        for (int i = 0; i < buttons.Length; i++)
        {
            if (buttons[i] != null)
            {
                buttons[i].interactable = !locker.isOn;
            }
        }
    }
    
}