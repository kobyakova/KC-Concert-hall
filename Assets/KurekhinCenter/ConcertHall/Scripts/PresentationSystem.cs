
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

public class PresentationSystem : UdonSharpBehaviour
{
    public GameObject mainScreen;
    Material screenMaterial;
    public Dropdown selectPresentation;
    Texture[] curretPresentation;
    int currentSlide;
    public Toggle includePresentationScreen;
    
    public Texture[] firstPresentation;
    public Texture[] secondPresentation;
    public Texture[] thridPresentation;
    public Texture[] fourPresentation;
    public Texture[] fivePresentation;
    public Texture[] sixPresentation;
    public Texture[] sevenPresentation;
    public Texture[] eightPresentation;

    public Button nextSlide;
    public Button prevSlide;

    private void Start()
    {
        screenMaterial = mainScreen.GetComponent<Renderer>().material;
        curretPresentation = firstPresentation;
        ChangePresentation();
        IncludePresentationScreen(); 
    }

    public void ChangePresentation()
    {
        currentSlide = 0;
        switch (selectPresentation.value)
        {
            case 0:
                if ((firstPresentation.Length == 0) || (firstPresentation[0] == null)) break;
                curretPresentation = firstPresentation;
                ChangeSlide();
                break;
            case 1:
                if ((secondPresentation.Length == 0) || (secondPresentation[0] == null)) break;
                curretPresentation = secondPresentation;
                ChangeSlide();
                break;
            case 2:
                if ((thridPresentation.Length == 0)||(thridPresentation[0] == null)) break;
                curretPresentation = thridPresentation;
                ChangeSlide();
                break;
            case 3:
                if ((fourPresentation.Length == 0) || (fourPresentation[0] == null)) break;
                curretPresentation = fourPresentation;
                ChangeSlide();
                break;
            case 4:
                if ((fivePresentation.Length == 0) || (fivePresentation[0] == null)) break;
                curretPresentation = fivePresentation;
                ChangeSlide();
                break;
            case 5:
                if ((sixPresentation.Length == 0) || (sixPresentation[0] == null)) break;
                curretPresentation = sixPresentation;
                ChangeSlide();
                break;
            case 6:
                if ((sevenPresentation.Length == 0) || (sevenPresentation[0] == null)) break;
                curretPresentation = sevenPresentation;
                ChangeSlide();
                break;
            case 7:
                if ((eightPresentation.Length == 0) || (eightPresentation[0] == null)) break;
                curretPresentation = eightPresentation;
                ChangeSlide();
                break;


            default:
                break;
        }
        
    }

    public void plusSlide() 
    {
        if (curretPresentation.Length != currentSlide+1)
        { 
            currentSlide++;
            ChangeSlide();
        }
    }
    public void minusSlide()
    {
        if (currentSlide != 0)
        {
            currentSlide--;
            ChangeSlide();
        }
    }

    public void ChangeSlide()
    {
        
        screenMaterial.SetTexture("_EmissionMap", curretPresentation[currentSlide]);
    }

    public void IncludePresentationScreen()
    {
        mainScreen.SetActive(includePresentationScreen.isOn);
    }

}
 