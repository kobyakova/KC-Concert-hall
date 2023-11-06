#if UDONSHARP
using VRC.SDKBase;
using UnityEngine.UI;

namespace VRCAudioLink
{
    using UdonSharp;

    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class ToggleSync : UdonSharpBehaviour
    {
        [UdonSynced]
        private bool syncedValue;
        private bool deserializing;
        private Toggle dropDown;
        private VRCPlayerApi localPlayer;

        private void Start()
        {
            dropDown = transform.GetComponent<Toggle>();
            localPlayer = Networking.LocalPlayer;
            syncedValue = dropDown.isOn;
            deserializing = false;

            if (Networking.IsOwner(gameObject))
                RequestSerialization();
        }

        public override void OnDeserialization()
        {
            deserializing = true;
            dropDown.isOn = syncedValue;
            deserializing = false;
        }

        public void OnValueChanged()
        {
            if (dropDown == null)
                return;
            if (deserializing)
                return;
            if (!Networking.IsOwner(gameObject))
                Networking.SetOwner(localPlayer, gameObject);

            syncedValue = dropDown.isOn;
            RequestSerialization();
        }
    }
}
#endif