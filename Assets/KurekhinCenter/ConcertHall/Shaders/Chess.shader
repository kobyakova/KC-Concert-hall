// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Chess"
{
	Properties
	{
		_TimeScale("TimeScale", Float) = 0.3
		_IDKOef("IDKOef", Float) = 0.164658
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			half filler;
		};

		uniform float _IDKOef;
		uniform float _TimeScale;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			uint currInstanceId = 0;
			#ifdef UNITY_INSTANCING_ENABLED
			currInstanceId = unity_InstanceID;
			#endif
			float3 objToWorld24 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float mulTime9 = _Time.y * _TimeScale;
			float3 temp_cast_0 = (round( frac( ( ( currInstanceId + objToWorld24.x + objToWorld24.y ) * sin( _IDKOef ) * mulTime9 ) ) )).xxx;
			o.Emission = temp_cast_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
996;73;923;926;2693.129;1082.644;3.156019;True;False
Node;AmplifyShaderEditor.TransformPositionNode;24;-1015.572,589.1183;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.InstanceIdNode;23;-889.1062,479.2028;Inherit;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-972.6723,810.1185;Inherit;False;Property;_IDKOef;IDKOef;1;0;Create;True;0;0;0;True;0;False;0.164658;160.84;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1002.213,1012.06;Inherit;False;Property;_TimeScale;TimeScale;0;0;Create;True;0;0;0;True;0;False;0.3;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;9;-820.2125,956.2601;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;26;-751.6721,762.0183;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-634.6722,542.3185;Inherit;False;3;3;0;INT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-393.444,549.9302;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;10;-265.28,111.8299;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;2;-107.9,49.28;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Chess;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;9;0;13;0
WireConnection;26;0;25;0
WireConnection;22;0;23;0
WireConnection;22;1;24;1
WireConnection;22;2;24;2
WireConnection;27;0;22;0
WireConnection;27;1;26;0
WireConnection;27;2;9;0
WireConnection;10;0;27;0
WireConnection;2;0;10;0
WireConnection;0;2;2;0
ASEEND*/
//CHKSM=EDE1C74F9B22268F53B094E89C86047715EFE976