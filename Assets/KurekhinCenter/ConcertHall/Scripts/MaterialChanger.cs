
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon.Common.Interfaces;
using VRC.Udon;


    public class MaterialChanger : UdonSharpBehaviour
    {
        public Renderer[] Target;
        public int matSlot;
        public Material mat;

       
        public override void Interact()
        {
            SendCustomNetworkEvent(NetworkEventTarget.All, "ApplyToggle");
            //Networking.SetOwner(Networking.LocalPlayer, gameObject);
            //RequestSerialization();

            //ApplyToggle();
        }

        public void ApplyToggle()
        {
            int allTarget = Target.Length;
            for (int i = 0; i < allTarget; i++)
            {
                var mR = Target[i].materials;
                mR[matSlot] = mat;
                Target[i].materials = mR;

            }
        }
    }
