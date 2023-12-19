// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "PostProcSInSIty"
{
	Properties
	{
		_MainTex ( "Screen", 2D ) = "black" {}
		_Color("Color", Range( 0 , 1)) = 0
		_Diapazone("Diapazone", Range( 0 , 1)) = 0
		_Posterization("Posterization", Range( 1 , 256)) = 1
	}

	SubShader
	{
		
		
		ZTest Always
		Cull Off
		ZWrite Off

		GrabPass{ }

		Pass
		{ 
			CGPROGRAM 

			#pragma vertex vert_img_custom 
			#pragma fragment frag
			#pragma target 3.0
			#include "UnityCG.cginc"
			

			struct appdata_img_custom
			{
				float4 vertex : POSITION;
				half2 texcoord : TEXCOORD0;
				
			};

			struct v2f_img_custom
			{
				float4 pos : SV_POSITION;
				half2 uv   : TEXCOORD0;
				half2 stereoUV : TEXCOORD2;
		#if UNITY_UV_STARTS_AT_TOP
				half4 uv2 : TEXCOORD1;
				half4 stereoUV2 : TEXCOORD3;
		#endif
				float4 ase_texcoord4 : TEXCOORD4;
			};

			uniform sampler2D _MainTex;
			uniform half4 _MainTex_TexelSize;
			uniform half4 _MainTex_ST;
			
			uniform float _Diapazone;
			uniform float _Color;
			uniform float _Posterization;
			UNITY_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
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
			

			v2f_img_custom vert_img_custom ( appdata_img_custom v  )
			{
				v2f_img_custom o;
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord4 = screenPos;
				
				o.pos = UnityObjectToClipPos ( v.vertex );
				o.uv = float4( v.texcoord.xy, 1, 1 );

				#if UNITY_UV_STARTS_AT_TOP
					o.uv2 = float4( v.texcoord.xy, 1, 1 );
					o.stereoUV2 = UnityStereoScreenSpaceUVAdjust ( o.uv2, _MainTex_ST );

					if ( _MainTex_TexelSize.y < 0.0 )
						o.uv.y = 1.0 - o.uv.y;
				#endif
				o.stereoUV = UnityStereoScreenSpaceUVAdjust ( o.uv, _MainTex_ST );
				return o;
			}

			half4 frag ( v2f_img_custom i ) : SV_Target
			{
				#ifdef UNITY_UV_STARTS_AT_TOP
					half2 uv = i.uv2;
					half2 stereoUV = i.stereoUV2;
				#else
					half2 uv = i.uv;
					half2 stereoUV = i.stereoUV;
				#endif	
				
				half4 finalColor;

				// ase common template code
				float4 screenPos = i.ase_texcoord4;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 screenColor5 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,ase_grabScreenPosNorm.xy);
				float div87=256.0/float((int)_Posterization);
				float4 posterize87 = ( floor( screenColor5 * div87 ) / div87 );
				float3 hsvTorgb31 = RGBToHSV( posterize87.rgb );
				float temp_output_72_0 = ( _Diapazone * 0.5 );
				float temp_output_73_0 = ( _Color - temp_output_72_0 );
				float3 hsvTorgb33 = HSVToRGB( float3(hsvTorgb31.x,( ( hsvTorgb31.y * (( hsvTorgb31.x < temp_output_73_0 ) ? 0.0 :  1.0 ) ) * (( hsvTorgb31.x > ( _Color + temp_output_72_0 ) ) ? 0.0 :  1.0 ) ),hsvTorgb31.z) );
				float4 appendResult47 = (float4(hsvTorgb33.x , hsvTorgb33.y , hsvTorgb33.z , 0.0));
				float4 clampResult14 = clamp( appendResult47 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				

				finalColor = clampResult14;

				return finalColor;
			} 
			ENDCG 
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=16800
959;81;952;910;1512.593;864.6531;1;True;False
Node;AmplifyShaderEditor.GrabScreenPosition;6;-2043.612,187.3464;Float;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;62;-1782.067,-308.9138;Float;False;Property;_Diapazone;Diapazone;2;0;Create;True;0;0;True;0;0;0.156;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-1938.351,422.2313;Float;False;Property;_Posterization;Posterization;3;0;Create;True;0;0;True;0;1;1;1;256;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;5;-1779.9,161.7605;Float;False;Global;_GrabScreen0;Grab Screen 0;0;0;Create;True;0;0;False;0;Object;-1;False;False;1;0;FLOAT2;0,0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-1430.234,-381.7827;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-1735.64,-539.2975;Float;False;Property;_Color;Color;1;0;Create;True;0;0;True;0;0;0.471;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosterizeNode;87;-1491.36,221.5367;Float;False;256;2;1;COLOR;0,0,0,0;False;0;INT;256;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;73;-1216.364,-559.7578;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;31;-1279.393,-163.6559;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;74;-1213.963,-383.7576;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareLower;54;-755.1595,-591.3466;Float;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;57;-548.356,-147.5047;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCCompareGreater;55;-446.2426,-470.9668;Float;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;-315.1515,-196.3424;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;33;-116.2466,-341.5933;Float;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;47;1066.974,-104.2502;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-282.5038,132.3462;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;-249.2647,251.0576;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-301.8896,13.82679;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;46;-1040.872,240.6366;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleAddOpNode;53;558.5351,416.2881;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;44;-1253.321,241.8299;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;82;1138.262,149.0101;Float;False;Constant;_Float1;Float 1;3;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-547.4675,421.808;Float;False;Constant;_Float0;Float 0;3;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;557.1982,306.0547;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;14;1260.174,-189.0166;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;51;556.4986,178.3818;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;92;-1008.106,-618.1555;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;86;1441.802,-201.0673;Float;False;True;2;Float;ASEMaterialInspector;0;2;PostProcSInSIty;c71b220b631b6344493ea3cf87110c93;True;SubShader 0 Pass 0;0;0;SubShader 0 Pass 0;1;False;False;False;True;2;False;-1;False;False;True;2;False;-1;True;7;False;-1;False;True;0;False;0;False;False;False;False;False;False;False;False;False;False;True;2;0;;0;0;Standard;0;0;1;True;False;1;0;FLOAT4;0,0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;72;0;62;0
WireConnection;87;1;5;0
WireConnection;87;0;91;0
WireConnection;73;0;49;0
WireConnection;73;1;72;0
WireConnection;31;0;87;0
WireConnection;74;0;49;0
WireConnection;74;1;72;0
WireConnection;54;0;31;1
WireConnection;54;1;73;0
WireConnection;57;0;31;2
WireConnection;57;1;54;0
WireConnection;55;0;31;1
WireConnection;55;1;74;0
WireConnection;58;0;57;0
WireConnection;58;1;55;0
WireConnection;33;0;31;1
WireConnection;33;1;58;0
WireConnection;33;2;31;3
WireConnection;47;0;33;1
WireConnection;47;1;33;2
WireConnection;47;2;33;3
WireConnection;79;0;46;1
WireConnection;79;1;81;0
WireConnection;80;0;46;2
WireConnection;80;1;81;0
WireConnection;78;0;46;0
WireConnection;78;1;81;0
WireConnection;46;0;44;0
WireConnection;53;0;33;3
WireConnection;53;1;80;0
WireConnection;44;0;87;0
WireConnection;52;0;33;2
WireConnection;52;1;79;0
WireConnection;14;0;47;0
WireConnection;51;0;33;1
WireConnection;51;1;78;0
WireConnection;92;0;73;0
WireConnection;86;0;14;0
ASEEND*/
//CHKSM=E4AB93B9895DC56E8B31FBD4C5EE5B3FF84A6672