// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EndBuild"
{
	Properties
	{
		_PosScale("PosScale", Float) = 1
		_WaveTiling("WaveTiling", Float) = 1
		_TimeScale("TimeScale", Float) = 1
		_SinOffset("SinOffset", Float) = 0
		_Color0("Color 0", Color) = (1,0.4323716,0,0)
		_PanelEmi6("PanelEmi6", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform sampler2D _PanelEmi6;
		uniform float4 _PanelEmi6_ST;
		uniform float4 _Color0;
		uniform float _TimeScale;
		uniform float _WaveTiling;
		uniform float _PosScale;
		uniform float _SinOffset;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_PanelEmi6 = i.uv_texcoord * _PanelEmi6_ST.xy + _PanelEmi6_ST.zw;
			float4 tex2DNode1 = tex2D( _PanelEmi6, uv_PanelEmi6 );
			o.Albedo = tex2DNode1.rgb;
			float4 temp_cast_1 = (0.5).xxxx;
			float mulTime17 = _Time.y * _TimeScale;
			float3 ase_worldPos = i.worldPos;
			float4 temp_cast_2 = (( ( sin( ( mulTime17 + ( ase_worldPos.y * _WaveTiling ) ) ) * _PosScale ) + _SinOffset )).xxxx;
			float4 clampResult53 = clamp( ( ( 2 * ( tex2DNode1 - temp_cast_1 ) ) * _Color0 ) , float4( 0,0,0,0 ) , temp_cast_2 );
			o.Emission = clampResult53.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
905;73;1014;926;786.9145;1220.618;2.059952;True;False
Node;AmplifyShaderEditor.RangedFloatNode;15;-1061.095,-279.7075;Float;False;Property;_TimeScale;TimeScale;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-885.2947,284.3609;Float;False;Property;_WaveTiling;WaveTiling;1;0;Create;True;0;0;0;False;0;False;1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;14;-1015.782,90.69654;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;17;-884.7007,-267.8747;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-693.6553,83.29013;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;2;-520.0947,-4.707496;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-271.2299,-269.0415;Inherit;True;Property;_PanelEmi6;PanelEmi6;5;0;Create;True;0;0;0;False;0;False;-1;dc30695a376754046b323647f182f140;6c21d722db0e21d45afbf0f273821017;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;41;-115.0917,-525.5634;Inherit;False;Constant;_Float0;Float 0;6;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;4;-379.4724,102.0356;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-377.3495,345.4951;Float;False;Property;_PosScale;PosScale;0;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;40;94.18691,-549.9407;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.IntNode;43;43.88141,-650.4282;Inherit;False;Constant;_Int0;Int 0;6;0;Create;True;0;0;0;False;0;False;2;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-210.987,91.1216;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-209.2954,313.54;Float;False;Property;_SinOffset;SinOffset;3;0;Create;True;0;0;0;False;0;False;0;3.09;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;263.9083,-646.5634;Inherit;False;2;2;0;INT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;7;-343.8005,-941.9603;Inherit;False;Property;_Color0;Color 0;4;0;Create;True;0;0;0;False;0;False;1,0.4323716,0,0;1,0.009313963,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-51.21613,130.3401;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;456.6533,-728.96;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-905.0352,492.9427;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;53;595.3158,-95.88437;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1097.738,-485.5395;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;EndBuild;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;17;0;15;0
WireConnection;16;0;14;2
WireConnection;16;1;13;0
WireConnection;2;0;17;0
WireConnection;2;1;16;0
WireConnection;4;0;2;0
WireConnection;40;0;1;0
WireConnection;40;1;41;0
WireConnection;5;0;4;0
WireConnection;5;1;3;0
WireConnection;42;0;43;0
WireConnection;42;1;40;0
WireConnection;8;0;5;0
WireConnection;8;1;6;0
WireConnection;44;0;42;0
WireConnection;44;1;7;0
WireConnection;53;0;44;0
WireConnection;53;2;8;0
WireConnection;0;0;1;0
WireConnection;0;2;53;0
ASEEND*/
//CHKSM=47518A166542C2E16C31066873109395CFF2F2ED