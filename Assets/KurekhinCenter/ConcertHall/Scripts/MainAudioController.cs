
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;


public class MainAudioController : UdonSharpBehaviour
{
    [Header("Defaul audio States")]
    [Space(10)]

    [Header("Audio Booster")]
    public float onStageGain;
    public float onStageFar;
    public float onStageNear;
    public float offStageGain;
    public float offStageFar;
    public float offStageNear;
    [Space(5)] 

    [Header("Microphones")]
    public GameObject microphoneRed;
    public GameObject microphoneGreen;
    public GameObject microphoneBlue;

    public Transform defRed;
    public Transform defGreen;
    public Transform defBlue;
    [Space(5)]

    [Header("Microphones States")]
    public Toggle micRedInclude;
    public Toggle micRedIncrease;
    [Space(2)]
    public Toggle micGreenInclude;
    public Toggle micGreenIncrease;
    [Space(2)]
    public Toggle micBlueInclude;
    public Toggle micBlueIncrease;
    [Space(5)]

    [Header("Microphones States")]
    public Slider highSliderGain;
    public Slider highSliderFar;
    public Slider highSliderNear;
    public Slider lowSliderGain;
    public Slider lowSliderFar;
    public Slider lowSliderNear;

    bool onStage;
    bool boosted;
    VRCPlayerApi locPlayer;
    public Text debugLog;
    public Text debugLogCollider;

    public void Start()
    {
        locPlayer = Networking.LocalPlayer;
        debugLog.text = locPlayer.displayName;
        Debug.Log(locPlayer);

        IncludeMic();
    }

    public override void OnPlayerTriggerEnter(VRCPlayerApi a)
    {
        if (locPlayer == null) return;
        onStage = true;
        Debug.Log("Player enter in audio boost zone");
        if (a.isLocal)
        {
            locPlayer.SetVoiceDistanceFar(highSliderFar.value);
            locPlayer.SetVoiceGain(highSliderGain.value);
            locPlayer.SetVoiceDistanceNear(highSliderNear.value);
            locPlayer.SetJumpImpulse(30);

            boosted = true;
            
            Debug.Log("Player voice did increased");
            Debug.Log(a);
            debugLogCollider.text = a.displayName;
        }
        
    }

    public override void OnPlayerTriggerExit(VRCPlayerApi a)
    {
        if (locPlayer == null) return;
        Debug.Log("Player exit in audio boost zone");
        onStage = false;

        if (!(microphoneRed.GetComponent<VRC_Pickup>().IsHeld ||
           microphoneGreen.GetComponent<VRC_Pickup>().IsHeld ||
           microphoneBlue.GetComponent<VRC_Pickup>().IsHeld)){ //Если не один из микрофонов не в руках. Т.е. если хоть один микрофон удерживается, то не надо

            if (a.isLocal)
            {
                locPlayer.SetVoiceDistanceFar(lowSliderFar.value);
                locPlayer.SetVoiceGain(lowSliderGain.value);
                locPlayer.SetVoiceDistanceNear(lowSliderNear.value);
                locPlayer.SetJumpImpulse(3);

                boosted = false;
                Debug.Log("Player voice did decrease");
            }
        }
    }

    public void _OnVolumeChange()
    {
        if (boosted)
        {
            locPlayer.SetVoiceDistanceFar(highSliderFar.value);
            locPlayer.SetVoiceGain(highSliderGain.value);
            locPlayer.SetVoiceDistanceNear(highSliderNear.value);
        }
        else
        {
            locPlayer.SetVoiceDistanceFar(lowSliderFar.value);
            locPlayer.SetVoiceGain(lowSliderGain.value);
            locPlayer.SetVoiceDistanceNear(lowSliderNear.value); 
        }
        Debug.Log("Volume change");
    }

    public void MicrophonePickUp()
    {
        if (locPlayer == null) return;
        Debug.Log("Microphone has been picked");
        if (!boosted)
        {
            if (locPlayer.isLocal)
            {
                locPlayer.SetVoiceDistanceFar(highSliderFar.value);
                locPlayer.SetVoiceGain(highSliderGain.value);
                locPlayer.SetVoiceDistanceNear(highSliderNear.value);
                locPlayer.SetJumpImpulse(30);

                boosted = true;

                Debug.Log("Player voice did increased");
            }
        }
    }

    public void MicrophoneDrop()
    {
        if (locPlayer == null) return;
        Debug.Log("Microphone has been drop");
        if (!onStage)
        {
            if (locPlayer.isLocal)
            {
                locPlayer.SetVoiceDistanceFar(lowSliderFar.value);
                locPlayer.SetVoiceGain(lowSliderGain.value);
                locPlayer.SetVoiceDistanceNear(lowSliderNear.value);
                locPlayer.SetJumpImpulse(3);

                boosted = false;

                Debug.Log("Player voice did decrease");
                
            }
        }
    }

    public void _IncreaseChange()
    {
        if (microphoneRed.GetComponent<VRC_Pickup>().IsHeld & micRedIncrease.isOn) MicrophoneDrop();
        if (microphoneGreen.GetComponent<VRC_Pickup>().IsHeld & micGreenIncrease.isOn) MicrophoneDrop();
        if (microphoneBlue.GetComponent<VRC_Pickup>().IsHeld & micBlueIncrease.isOn) MicrophoneDrop();
        
    }
       

    public void _OnLowReset()
    {
        lowSliderFar.value = offStageFar;
        lowSliderGain.value = offStageGain;
        lowSliderNear.value = offStageNear;
        Debug.Log("Low level Volume reseted");
    }
    public void _OnHighReset()
    {
        highSliderFar.value = onStageFar;
        highSliderGain.value = onStageGain;
        highSliderNear.value = onStageNear;
        Debug.Log("High level Volume reseted");
    }

    public void IncludeMic()
    {
        //SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All,"_SyncMicIncl");
        microphoneRed.SetActive(micRedInclude.isOn);
        microphoneGreen.SetActive(micGreenInclude.isOn);
        microphoneBlue.SetActive(micBlueInclude.isOn);
    }
    public void _SyncMicIncl()
    {

    }

    public void RedtoDef()
    {
        //microphoneRed.transform.SetPositionAndRotation(defRed.transform.position,defRed.transform.rotation);
        microphoneRed.transform.position = defRed.transform.position;
        microphoneRed.transform.rotation = defRed.transform.rotation;
    }
    public void GreentoDef()
    {
        microphoneGreen.transform.SetPositionAndRotation(defGreen.transform.position, defRed.transform.rotation);
    }
    public void BluetoDef()
    {
        microphoneBlue.transform.SetPositionAndRotation(defBlue.transform.position, defRed.transform.rotation);
    }
}
