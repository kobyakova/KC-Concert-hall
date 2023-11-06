// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "PostProc"
{
	Properties
	{
		_EmissionColor("EmissionColor", Color) = (1,1,1,0)
		_Light("Light", Range( 0 , 10)) = 10
		_HueOffset("HueOffset", Range( 0 , 10)) = 10
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Overlay+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Front
		ZTest Always
		Blend SrcAlpha OneMinusSrcAlpha
		
		GrabPass{ }
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
		};

		uniform half _HueOffset;
		uniform half4 _EmissionColor;
		UNITY_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform half _Light;


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float4 screenColor5 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,ase_grabScreenPosNorm.xy);
			half4 temp_cast_1 = (_Light).xxxx;
			float4 clampResult14 = clamp( ( _EmissionColor * pow( screenColor5 , temp_cast_1 ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			o.Emission = clampResult14.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16800
1804;73;755;1286;676.1107;400.0758;1.077234;False;False
Node;AmplifyShaderEditor.GrabScreenPosition;6;-750.075,38.66904;Float;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;5;-486.3629,13.08309;Float;False;Global;_GrabScreen0;Grab Screen 0;0;0;Create;True;0;0;False;0;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;15;-648.5995,317.2356;Float;False;Property;_Light;Light;1;0;Create;True;0;0;True;0;10;10;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;13;-236.0795,53.03802;Float;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;9;-503.4562,-552.7245;Float;False;Property;_EmissionColor;EmissionColor;0;0;Create;True;0;0;True;0;1,1,1,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-6.585495,-79.19089;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-817.8386,-283.3866;Float;False;Constant;_Float1;Float 1;3;0;Create;True;0;0;False;0;11;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-983.014,-183.9796;Float;False;Property;_HueOffset;HueOffset;2;0;Create;True;0;0;True;0;10;10;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;29;-561.8386,-196.3867;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;30;-326.4163,-220.2707;Float;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-145.8079,-308.8487;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;14;150.8068,-20.81088;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;310.6141,-54.30522;Half;False;True;2;Half;ASEMaterialInspector;0;0;Standard;PostProc;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Front;0;False;-1;7;False;-1;False;0;False;-1;0;False;-1;False;2;Custom;0.5;True;True;0;True;Custom;;Overlay;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;3;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;13;0;5;0
WireConnection;13;1;15;0
WireConnection;8;0;9;0
WireConnection;8;1;13;0
WireConnection;29;0;27;0
WireConnection;29;1;28;0
WireConnection;30;0;5;0
WireConnection;30;1;29;0
WireConnection;24;1;30;0
WireConnection;14;0;8;0
WireConnection;0;2;14;0
ASEEND*/
//CHKSM=BA4A52F67F10DFCA3CB4D1DD1820BF1CFC271C22