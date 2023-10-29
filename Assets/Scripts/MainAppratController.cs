
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class MainAppratController : UdonSharpBehaviour
{
    public UnityEngine.UI.Slider panelHue;
    public UnityEngine.UI.Slider panelSaturate;
    public UnityEngine.UI.Slider panelPower;

    public Dropdown panelLightMode;
    Material ActualMat;
    public Material[] panelMaterial;
    public GameObject[] panel;

    void Start()
    {
        panelSaturate.value = 1;
        panelPower.value = 1;
        _panelModeChange();
        _OnColorChange();
        
    }
    public void _OnColorChange()
    {
        float panHue = panelHue.value;
        float panSat = panelSaturate.value;
        float panPow = panelPower.value;

        Color panCol = Color.HSVToRGB(panHue, panSat, 1);

        panCol *= Mathf.Pow(panPow, 3.3f);
        ActualMat.SetColor("_EmissionColor", panCol);
        
    }
    public void _panelModeChange()
    {
        int panMod = panelLightMode.value;
        ActualMat = panelMaterial[panMod];
        Debug.Log(panMod + "panMod");

        for (int i = 0; i < panel.Length; i++)
        {
            panel[i].GetComponent<Renderer>().material = ActualMat;

            //panel[i].GetComponent<Renderer>().materials[0].SetColor("_Color", panCol);
            //Material[] mats =  panel[i].GetComponent<Renderer>().materials;
            //mats[].material.SetColor("_Color", panCol);
        }
        _OnColorChange();
    }
}
