#if UDONSHARP
using VRC.SDKBase;
using UnityEngine.UI;

namespace VRCAudioLink
{
    using UdonSharp;

    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class DropDownSync : UdonSharpBehaviour
    {
        [UdonSynced]
        private int syncedValue;
        private bool deserializing;
        private Dropdown dropDown;
        private VRCPlayerApi localPlayer;

        private void Start()
        {
            dropDown = transform.GetComponent<Dropdown>();
            localPlayer = Networking.LocalPlayer;
            syncedValue = dropDown.value;
            deserializing = false;

            if (Networking.IsOwner(gameObject))
                RequestSerialization();
        }

        public override void OnDeserialization()
        {
            deserializing = true;
            dropDown.value = syncedValue;
            deserializing = false;
        }

        public void _DropDownUpdate()
        {
            if (dropDown == null)
                return;
            if (deserializing)
                return;
            if (!Networking.IsOwner(gameObject))
                Networking.SetOwner(localPlayer, gameObject);

            syncedValue = dropDown.value;
            RequestSerialization();
        }
    }
}
#endif