// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LineWavesByTex"
{
	Properties
	{
		_TimeScale("TimeScale", Float) = 1
		_SInScale("SInScale", Float) = 1
		_Length("Length", Float) = 1
		_IDSHift("IDSHift", Float) = 1
		_Float0("Float 0", Float) = 0.5
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
			float2 uv_texcoord;
		};

		uniform float _Float0;
		uniform sampler2D _TextureSample0;
		uniform float _IDSHift;
		uniform float _TimeScale;
		uniform float _SInScale;
		uniform float _Length;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			uint currInstanceId = 0;
			#ifdef UNITY_INSTANCING_ENABLED
			currInstanceId = unity_InstanceID;
			#endif
			float mulTime1 = _Time.y * _TimeScale;
			float temp_output_8_0 = ( ( ( currInstanceId * _IDSHift ) + mulTime1 ) * _SInScale );
			float temp_output_3_0 = ( temp_output_8_0 * _Length );
			float2 temp_cast_0 = (temp_output_3_0).xx;
			float2 uv_TexCoord10 = i.uv_texcoord + temp_cast_0;
			o.Emission = tex2D( _TextureSample0, uv_TexCoord10 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16800
1490.4;73.6;557;998;279.2743;762.0658;1.634222;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-1235.658,313.305;Float;False;Property;_TimeScale;TimeScale;0;0;Create;True;0;0;True;0;1;120.99;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.InstanceIdNode;12;-1057.917,-48.65916;Float;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1137.823,85.97485;Float;False;Property;_IDSHift;IDSHift;3;0;Create;True;0;0;True;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1;-1071.658,246.305;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-886.823,2.974854;Float;False;2;2;0;INT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1013.658,407.3049;Float;False;Property;_SInScale;SInScale;1;0;Create;True;0;0;True;0;1;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-848.823,132.9749;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-718.6577,231.305;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-691.6577,436.3049;Float;False;Property;_Length;Length;2;0;Create;True;0;0;True;0;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-437.6577,138.305;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;-212.2334,-147.9416;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;4;-273.6578,125.305;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-373.1828,345.1373;Float;False;Property;_Float0;Float 0;4;0;Create;True;0;0;True;0;0.5;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;2;-580.4578,74.00507;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-2.253344,-171.9261;Float;True;Property;_TextureSample0;Texture Sample 0;5;0;Create;True;0;0;False;0;None;61c0b9c0523734e0e91bc6043c72a490;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;332.6,-124.8;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;LineWavesByTex;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;0;6;0
WireConnection;13;0;12;0
WireConnection;13;1;15;0
WireConnection;14;0;13;0
WireConnection;14;1;1;0
WireConnection;8;0;14;0
WireConnection;8;1;7;0
WireConnection;3;0;8;0
WireConnection;3;1;9;0
WireConnection;10;1;3;0
WireConnection;4;0;3;0
WireConnection;2;0;8;0
WireConnection;11;1;10;0
WireConnection;0;2;11;0
ASEEND*/
//CHKSM=54064265C52713ADAB79670EAE3A1C0C5663948E