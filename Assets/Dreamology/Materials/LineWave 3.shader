// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LineWavePulse"
{
	Properties
	{
		_TimeScale("TimeScale", Float) = 1
		_SInScale("SInScale", Float) = 1
		_Length("Length", Float) = 1
		_Float0("Float 0", Float) = 0.5
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

		uniform float _Float0;
		uniform float _TimeScale;
		uniform float _SInScale;
		uniform float _Length;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float mulTime1 = _Time.y * _TimeScale;
			float clampResult4 = clamp( ( sin( ( mulTime1 * _SInScale ) ) * _Length ) , 0.0 , 1.0 );
			float3 temp_cast_0 = (clampResult4).xxx;
			o.Emission = temp_cast_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16800
1048.8;73.6;998;998;1226.857;393.796;1.3;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-1235.658,313.305;Float;False;Property;_TimeScale;TimeScale;0;0;Create;True;0;0;True;0;1;120.99;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1;-1071.658,246.305;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1013.658,407.3049;Float;False;Property;_SInScale;SInScale;1;0;Create;True;0;0;True;0;1;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-718.6577,231.305;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;2;-598.6578,205.305;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-643.6577,354.3049;Float;False;Property;_Length;Length;2;0;Create;True;0;0;True;0;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-437.6577,138.305;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;4;-273.6578,125.305;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-373.1828,345.1373;Float;False;Property;_Float0;Float 0;3;0;Create;True;0;0;True;0;0.5;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;-108.2334,-130.9416;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;132.6,-33.8;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;LineWavePulse;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;0;6;0
WireConnection;8;0;1;0
WireConnection;8;1;7;0
WireConnection;2;0;8;0
WireConnection;3;0;2;0
WireConnection;3;1;9;0
WireConnection;4;0;3;0
WireConnection;0;2;4;0
ASEEND*/
//CHKSM=F5343B07E20AB3559E16873DA29DFA074232E28C