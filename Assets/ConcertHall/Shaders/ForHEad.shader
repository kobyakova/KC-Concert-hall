// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ForHEad"
{
	Properties
	{
		_Head_ao("Head_ao", 2D) = "white" {}
		_MaskTex("_MaskTex", 2D) = "gray" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _MaskTex;
		uniform float4 _MaskTex_ST;
		uniform sampler2D _Head_ao;
		uniform float4 _Head_ao_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MaskTex = i.uv_texcoord * _MaskTex_ST.xy + _MaskTex_ST.zw;
			o.Albedo = tex2D( _MaskTex, uv_MaskTex ).rgb;
			float2 uv_Head_ao = i.uv_texcoord * _Head_ao_ST.xy + _Head_ao_ST.zw;
			o.Occlusion = tex2D( _Head_ao, uv_Head_ao ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
830;81;1081;910;1250.636;364.2012;3.245488;False;False
Node;AmplifyShaderEditor.ScreenPosInputsNode;12;-1147.995,-54.13623;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;5;-1248,364;Half;False;Property;_RotScale;RotScale;1;0;Create;True;0;0;0;False;0;False;1;-0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1225.995,122.8638;Half;False;Property;_TexScale;TexScale;2;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;4;-1038,420;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;7;-1111,211;Half;False;Property;_Ancor;Ancor;3;0;Create;True;0;0;0;False;0;False;0,0;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-879.9946,70.86377;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RotatorNode;3;-761,175;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-583,-43;Inherit;True;Property;_amanitamushroomsseamlesspatternredpoisonousmushroomabstractbackgroundillustrationautumnmushroomcollectionseasonvector;amanita-mushrooms-seamless-pattern-red-poisonous-mushroom-abstract-background-illustration-autumn-mushroom-collection-season-vector;0;0;Create;True;0;0;0;False;0;False;-1;121581bffb4cb1c40bd6392c0adaabdb;121581bffb4cb1c40bd6392c0adaabdb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;15;-209.0178,-20.91296;Inherit;True;Property;_Head_normal;Head_normal;5;0;Create;True;0;0;0;False;0;False;-1;192d44b3c7afa0548a8805d087f8bfcc;192d44b3c7afa0548a8805d087f8bfcc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;14;-205.0178,228.087;Inherit;True;Property;_Head_ao;Head_ao;4;0;Create;True;0;0;0;False;0;False;-1;b52c609d699b68842af3b834d5655e73;b52c609d699b68842af3b834d5655e73;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;16;-289.0178,-326.913;Inherit;True;Property;_MaskTex;_MaskTex;6;0;Create;True;0;0;0;False;0;False;-1;192d44b3c7afa0548a8805d087f8bfcc;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;184,-142;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ForHEad;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;5;0
WireConnection;11;0;12;0
WireConnection;11;1;13;0
WireConnection;3;0;11;0
WireConnection;3;1;7;0
WireConnection;3;2;4;0
WireConnection;1;1;3;0
WireConnection;0;0;16;0
WireConnection;0;5;14;0
ASEEND*/
//CHKSM=84B6A393DA446207C1C6936834DE5D4419717ECD