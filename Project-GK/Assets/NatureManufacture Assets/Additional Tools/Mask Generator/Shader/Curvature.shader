Shader "NatureManufacture Shaders/Debug/Curvature" {
    Properties {
        _MainTex ("Normal Map", 2D) = "white" {}
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;

            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target {
                float3 normal = UnpackNormal(tex2D(_MainTex, i.uv));
                float2 derivative = ddx(normal.rg) + ddy(normal.rg);
                float curvature = length(derivative);
                return curvature;
            }
            ENDCG
        }
    }
}