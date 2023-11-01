
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;



public class MainAppratController : UdonSharpBehaviour
{
    //Panles GROUP
    public UnityEngine.UI.Slider panelHue;
    public UnityEngine.UI.Slider panelSaturate;
    public UnityEngine.UI.Slider panelPower;

    public Dropdown panelLightMode;
    Material ActualMat;
    public Material[] panelMaterial;
    public GameObject[] panel;


    //Projectors GROUP
    public UnityEngine.UI.Slider projectorsHue;
    public UnityEngine.UI.Slider projectorsSaturate;
    public UnityEngine.UI.Slider projectorsPower;
    [SerializeField]
    public VRSL.VRStageLighting_AudioLink_Static[] projectors;

    //PostPorc GROUP
    public UnityEngine.UI.Slider postProcHue;
    public UnityEngine.UI.Slider postProcSaturate;
    public UnityEngine.UI.Slider postProcPower;
    public GameObject postProc;

    //Other GROUP


    void Start()
    {
        panelSaturate.value = 1;
        panelPower.value = 1;
        _panelModeChange();
        _OnPanelColorChange();
        _OnProjectorColorChange();
        _OnPostProcChange();


    }
    public void _OnPanelColorChange()
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
        

        for (int i = 0; i < panel.Length; i++)
        {
            panel[i].GetComponent<Renderer>().material = ActualMat;

            //panel[i].GetComponent<Renderer>().materials[0].SetColor("_Color", panCol);
            //Material[] mats =  panel[i].GetComponent<Renderer>().materials;
            //mats[].material.SetColor("_Color", panCol);
        }
        _OnPanelColorChange();
    }
    public void _OnProjectorColorChange()
    {

        float prjHue = projectorsHue.value;
        float prjSat = projectorsSaturate.value;
        float prjPow = projectorsPower.value;

        Color prjCol = Color.HSVToRGB(prjHue, prjSat, 1);

        prjCol *= Mathf.Pow(prjPow, 3.3f);

        for (int i = 0; i < projectors.Length; i++)
        {
            projectors[i].LightColorTint = prjCol;
        }
        //ActualMat.SetColor("_EmissionColor", prjCol);
    }

    public void _OnPostProcChange()
    {
        float pPHue = postProcHue.value;
        float pPSat = postProcSaturate.value;
        float pPPow = postProcPower.value;

        Material pPMat = postProc.GetComponent<Renderer>().material;

        Color pPCol = Color.HSVToRGB(pPHue, pPSat, 1);
        pPMat.SetColor("_EmissionColor", pPCol);
        
        pPMat.SetFloat("_Light", pPPow);
        //Debug.Log(lightPower + "lightPower");
    }
}
