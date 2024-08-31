Shader "NatureManufacture/URP/Lit/Top Cover Shape"
{
    Properties
    {
        _Alpha_Clip_Threshold("Alpha Clip Threshold", Float) = 0.5
        _BaseColor("Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_BaseColorMap("Base Map", 2D) = "white" {}
        [ToggleUI]_BaseUsePlanarUV("Base Use Planar UV", Float) = 0
        [ToggleUI]_UV0_UV2("Base UV0 (T) UV2 (F)", Float) = 1
        _BaseTilingOffset("Base Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_BaseNormalMap("Base Normal Map", 2D) = "bump" {}
        _BaseNormalScale("Base Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_BaseMaskMap("Base Mask Map MT(R) AO(G) SM(A)", 2D) = "white" {}
        _BaseMetallic("Base Metallic", Range(0, 1)) = 1
        _BaseAORemapMin("Base AO Remap Min", Range(0, 1)) = 0
        _BaseAORemapMax("Base AO Remap Max", Range(0, 1)) = 1
        _BaseSmoothnessRemapMin("Base Smoothness Remap Min", Range(0, 1)) = 0
        _BaseSmoothnessRemapMax("Base Smoothness Remap Max", Range(0, 1)) = 1
        [ToggleUI]_USEDYNAMICCOVERTSTATICMASKF("Use Dynamic Cover (T) Static Mask (F)", Float) = 1
        [ToggleUI]_USECoverHeightT("Use Cover Height (T)", Float) = 1
        [NoScaleOffset]_CoverMaskA("Cover Mask (A)", 2D) = "white" {}
        _CoverMaskPower("Cover Mask Power", Range(0, 10)) = 1
        _Cover_Amount("Cover Amount", Range(0, 2)) = 2
        _Cover_Amount_Grow_Speed("Cover Amount Grow Speed", Range(0, 3)) = 3
        _Cover_Max_Angle("Cover Max Angle", Range(0.001, 90)) = 35
        _CoverHardness("Cover Hardness", Range(0, 10)) = 5
        _Cover_Min_Height("Cover Min Height", Float) = -10000
        _Cover_Min_Height_Blending("Cover Min Height Blending", Range(0, 500)) = 1
        _CoverNormalBlendHardness("Cover Normal Blend Hardness", Range(0, 8)) = 1
        _Shape_Normal_Blend_Hardness("Shape Normal Blend Hardness", Range(0, 8)) = 1
        _VertexColorGBlendStrenght("Vertex Color (G) Blend Strenght", Range(0, 100)) = 10
        _VertexColorBBlendStrenght("Vertex Color (B) Blend Strenght", Range(0, 100)) = 10
        _CoverBaseColor("Cover Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_CoverBaseColorMap("Cover Base Map", 2D) = "white" {}
        [ToggleUI]_CoverUsePlanarUV("Cover Use Planar UV", Float) = 1
        [ToggleUI]_Cover_UV0_UV2("Cover UV0 (T) UV2 (F)", Float) = 1
        _CoverTilingOffset("Cover Tiling Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_CoverNormalMap("Cover Normal Map", 2D) = "bump" {}
        _CoverNormalScale("Cover Normal Scale", Range(0, 8)) = 1
        _CoverHeightMapMin("Cover Height Map Min", Float) = 0
        _CoverHeightMapMax("Cover Height Map Max", Float) = 1
        _CoverHeightMapOffset("Cover Height Map Offset", Float) = 0
        [NoScaleOffset]_CoverMaskMap("Cover Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _CoverMetallic("Cover Metallic", Range(0, 1)) = 1
        _CoverAORemapMin("Cover AO Remap Min", Range(0, 1)) = 0
        _CoverAORemapMax("Cover AO Remap Max", Range(0, 1)) = 1
        _CoverSmoothnessRemapMin("Cover Smoothness Remap Min", Range(0, 1)) = 0
        _CoverSmoothnessRemapMax("Cover Smoothness Remap Max", Range(0, 1)) = 1
        [ToggleUI]_Use_ShapeHeightBT_Static_MaskF("Use Shape Height (B) (T) Cover Mask (F)", Float) = 0
        [ToggleUI]_Shape_UsePlanarUV("Shape Use Planar UV", Float) = 0
        [ToggleUI]_Shape_UV0_UV2("Shape UV0 (T) UV2 (F)", Float) = 1
        _ShapeTilingOffset("Shape Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_ShapeNormal("Shape Normal", 2D) = "bump" {}
        _ShapeNormalStrenght("Shape Normal Strenght Base", Float) = 1
        _ShapeNormalStrenght_1("Shape Normal Strenght Cover", Float) = 0.3
        [NoScaleOffset]_ShapeCurvAOHLeaksMask("Shape Curv (R) AO (G) H (B) Leaks Mask (A)", 2D) = "white" {}
        _CurvatureBlend("Curvature Power", Range(0, 1)) = 0
        _Shape_AO_Curvature_Reduction("Shape AO Curvature Reduction", Range(0, 1)) = 0
        _ShapeAORemapMin("Base Shape AO Remap Min", Range(0, 1)) = 0
        _ShapeAORemapMax("Base Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeAORemapMin_1("Cover Shape AO Remap Min", Range(0, 1)) = 1
        _ShapeAORemapMax_1("Cover Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeHeightMapMin("Shape Height Map Min", Float) = 0
        _ShapeHeightMapMax("Shape Height Map Max", Float) = 1
        _ShapeHeightMapOffset("Shape Height Map Offset", Float) = 0
        [ToggleUI]Leaks_UV0_UV2_1("Leaks UV0 (T) UV2 (F)", Float) = 1
        [NoScaleOffset]_LeaksR("Leaks (R)", 2D) = "white" {}
        _BaseLeaksColorMultiply("Base Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        _CoverLeaksColorMultiply("Cover Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        _LeaksTilingOffset("Leaks Tiling and Offset", Vector) = (1, 1, 0, 0)
        _LeaksSmoothnessMultiply("Base Leaks Smoothness Multiply", Range(0, 2)) = 1
        _LeaksSmoothnessMultiply_1("Cover Leaks Smoothness Multiply", Range(0, 2)) = 1
        [ToggleUI]_Wetness_T_Heat_F("Wetness (T) Heat (F)", Float) = 1
        _WetColor("Wet Color Vertex(R)", Color) = (0.7735849, 0.7735849, 0.7735849, 0)
        _WetSmoothness("Wet Smoothness Vertex(R)", Range(0, 1)) = 1
        [HDR]_LavaEmissionColor("Emission Color", Color) = (766.9961, 12.04706, 0, 0)
        _BaseEmissionMaskIntensivity("Base Emission Mask Intensivity", Range(0, 100)) = 0
        _BaseEmissionMaskTreshold("Base Emission Mask Treshold", Range(0.01, 100)) = 1
        _CoverEmissionMaskIntensivity("Cover Emission Mask Intensivity", Range(0, 100)) = 0
        _CoverEmissionMaskTreshold("Cover Emission Mask Treshold", Range(0.01, 100)) = 1
        _BaseEmissionMaskIntensivity_1("Shape Emission Mask Intensivity", Range(0, 100)) = 0
        _BaseEmissionMaskTreshold_1("Shape Emission Mask Treshold", Range(0.01, 100)) = 1
        [HDR]_RimColor("Rim Color", Color) = (1, 0, 0, 0)
        _RimLightPower("Rim Light Power", Float) = 4
        [NoScaleOffset]_Noise("Emission Noise", 2D) = "white" {}
        _NoiseTiling("Emission Noise Tiling", Vector) = (1, 1, 0, 0)
        _EmissionNoiseMultiply("Emission Noise Multiply", Range(0, 10)) = 1
        _EmissionNoisePower("Emission Noise Power", Range(0, 10)) = 2.71
        _NoiseSpeed("Emission Noise Speed", Vector) = (0.001, 0.005, 0, 0)
        [ToggleUI]_Dynamic_Flow("Dynamic Flow", Float) = 0
        _Dynamic_Shape_Speed("Dynamic Shape Speed", Range(0, 10)) = 0.1
        _Dynamic_Reaction_Offset("Dynamic Reaction Offset", Float) = 0
        _Dynamic_Start_Position_Offset("Dynamic Start Position Offset", Float) = 0
        _Dynamic_Shape_V_Curve_Power("Dynamic Shape V Curve Power", Range(-8, 8)) = 1.5
        [HideInInspector]_WorkflowMode("_WorkflowMode", Float) = 1
        [HideInInspector]_CastShadows("_CastShadows", Float) = 1
        [HideInInspector]_ReceiveShadows("_ReceiveShadows", Float) = 1
        [HideInInspector]_Surface("_Surface", Float) = 0
        [HideInInspector]_Blend("_Blend", Float) = 0
        [HideInInspector]_AlphaClip("_AlphaClip", Float) = 0
        [HideInInspector]_BlendModePreserveSpecular("_BlendModePreserveSpecular", Float) = 0
        [HideInInspector]_SrcBlend("_SrcBlend", Float) = 1
        [HideInInspector]_DstBlend("_DstBlend", Float) = 0
        [HideInInspector][ToggleUI]_ZWrite("_ZWrite", Float) = 1
        [HideInInspector]_ZWriteControl("_ZWriteControl", Float) = 0
        [HideInInspector]_ZTest("_ZTest", Float) = 4
        [HideInInspector]_Cull("_Cull", Float) = 2
        [HideInInspector]_AlphaToMask("_AlphaToMask", Float) = 0
        [HideInInspector]_QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector]_QueueControl("_QueueControl", Float) = -1
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader
    {
        Tags
        {
            "RenderPipeline"="UniversalPipeline"
            "RenderType"="Opaque"
            "UniversalMaterialType" = "Lit"
            "Queue"="Geometry"
            "DisableBatching"="False"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalLitSubTarget"
        }
        Pass
        {
            Name "Universal Forward"
            Tags
            {
                "LightMode" = "UniversalForward"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        AlphaToMask [_AlphaToMask]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _LIGHT_LAYERS
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma multi_compile_fragment _ _LIGHT_COOKIES
        #pragma multi_compile _ _FORWARD_PLUS
        #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
        #pragma shader_feature_fragment _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local_fragment _ _ALPHAPREMULTIPLY_ON
        #pragma shader_feature_local_fragment _ _ALPHAMODULATE_ON
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local_fragment _ _SPECULAR_SETUP
        #pragma shader_feature_local _ _RECEIVE_SHADOWS_OFF
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #define VARYINGS_NEED_SHADOW_COORD
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_FORWARD
        #define _FOG_FRAGMENT 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh;
            #endif
             float4 fogFactorAndVertexLight;
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 TangentSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpaceViewDirection;
             float3 TangentSpaceViewDirection;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV : INTERP0;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh : INTERP2;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord : INTERP3;
            #endif
             float4 tangentWS : INTERP4;
             float4 texCoord0 : INTERP5;
             float4 texCoord2 : INTERP6;
             float4 color : INTERP7;
             float4 fogFactorAndVertexLight : INTERP8;
             float3 positionWS : INTERP9;
             float3 normalWS : INTERP10;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(1, _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_CrossProduct_float(float3 A, float3 B, out float3 Out)
        {
            Out = cross(A, B);
        }
        
        void Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_MatrixConstruction_Column_float (float4 M0, float4 M1, float4 M2, float4 M3, out float4x4 Out4x4, out float3x3 Out3x3, out float2x2 Out2x2)
        {
        Out4x4 = float4x4(M0.x, M1.x, M2.x, M3.x, M0.y, M1.y, M2.y, M3.y, M0.z, M1.z, M2.z, M3.z, M0.w, M1.w, M2.w, M3.w);
        Out3x3 = float3x3(M0.x, M1.x, M2.x, M0.y, M1.y, M2.y, M0.z, M1.z, M2.z);
        Out2x2 = float2x2(M0.x, M1.x, M0.y, M1.y);
        }
        
        void Unity_Multiply_float3x3_float3(float3x3 A, float3 B, out float3 Out)
        {
        Out = mul(A, B);
        }
        
        struct Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv2;
        };
        
        void SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(float3 _Vector3, Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float IN, out float3 OutVector3_1)
        {
        float3 _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3;
        Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(IN.AbsoluteWorldSpacePosition, _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3);
        float3 _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3;
        Unity_CrossProduct_float(_DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3, IN.WorldSpaceNormal, _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3);
        float4 _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4 = IN.uv2;
        float _Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[0];
        float _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[1];
        float _Split_99c92b6260e6490ea7a39eb613456b77_B_3_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[2];
        float _Split_99c92b6260e6490ea7a39eb613456b77_A_4_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[3];
        float2 _Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2 = float2(_Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float, _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float);
        float2 _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2;
        Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2);
        float _Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[0];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[1];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_B_3_Float = 0;
        float _Split_03c55994216049a3b33e5a5dbbdd692d_A_4_Float = 0;
        float3 _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float.xxx), _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3);
        float3 _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3;
        Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(IN.AbsoluteWorldSpacePosition, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3);
        float3 _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3;
        Unity_CrossProduct_float(IN.WorldSpaceNormal, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3, _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3);
        float2 _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2;
        Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2);
        float _Split_487845396d594ea6b15fc953f598ece2_R_1_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[0];
        float _Split_487845396d594ea6b15fc953f598ece2_G_2_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[1];
        float _Split_487845396d594ea6b15fc953f598ece2_B_3_Float = 0;
        float _Split_487845396d594ea6b15fc953f598ece2_A_4_Float = 0;
        float3 _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_R_1_Float.xxx), _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3);
        float3 _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3;
        Unity_Add_float3(_Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3, _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3);
        float _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float;
        Unity_DotProduct_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float);
        float3 _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float.xxx), _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3);
        float3 _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_G_2_Float.xxx), _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3);
        float3 _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3;
        Unity_Add_float3(_Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3, _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3);
        float _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float;
        Unity_DotProduct_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float);
        float _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float;
        Unity_Maximum_float(_DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float, _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float);
        float _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float;
        Unity_SquareRoot_float(_Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float);
        float _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float;
        Unity_Divide_float(1, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float, _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float);
        float3 _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3);
        float3 _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3);
        float4x4 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4;
        float3x3 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3;
        float2x2 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2;
        Unity_MatrixConstruction_Column_float((float4(_Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3, 1.0)), (float4(_Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3, 1.0)), (float4(IN.WorldSpaceNormal, 1.0)), float4 (0, 0, 0, 0), _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2);
        float3 _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3 = _Vector3;
        float3 _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3;
        Unity_Multiply_float3x3_float3(_MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3, _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3);
        float3 _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3 = TransformWorldToTangent(_Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3);
        OutVector3_1 = _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Minimum_float(float A, float B, out float Out)
        {
            Out = min(A, B);
        };
        
        void Unity_Clamp_float4(float4 In, float4 Min, float4 Max, out float4 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 NormalTS;
            float3 Emission;
            float Metallic;
            float3 Specular;
            float Smoothness;
            float Occlusion;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_cb7ded32e6af3382bbe06b62977afab6;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv0 = IN.uv0;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv2 = IN.uv2;
            float4 _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4 = IN.uv0;
            float4 _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4 = IN.uv2;
            float4 _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4;
            Unity_Branch_float4(_Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean, _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4, _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4, _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4);
            float4 _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[0];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[1];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[2];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[3];
            float2 _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float);
            float2 _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float);
            float2 _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4.xy), _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2, _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2, _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2);
            float4 _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.tex, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.samplerstate, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2) );
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.r;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_G_5_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.g;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_B_6_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.b;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_A_7_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.a;
            float _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float);
            float4 _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float.xxxx), _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4, _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4);
            float4 _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4);
            float4 _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4);
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_A_4_Float, _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float);
            float _Split_1176033144b640c6ba683d9125e797cb_R_1_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[0];
            float _Split_1176033144b640c6ba683d9125e797cb_G_2_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[1];
            float _Split_1176033144b640c6ba683d9125e797cb_B_3_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[2];
            float _Split_1176033144b640c6ba683d9125e797cb_A_4_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[3];
            float _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float;
            Unity_Saturate_float(_Split_1176033144b640c6ba683d9125e797cb_A_4_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float);
            float _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float, _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float);
            float _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float;
            Unity_Clamp_float(_Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float, 0, 1, _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float);
            float4 _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4, (_Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float.xxxx), _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4);
            float _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float);
            float _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float;
            Unity_Subtract_float(_OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float, 0.5, _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float);
            float4 _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, (_Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float.xxxx), _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4);
            float _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float;
            Unity_Subtract_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, 0.5, _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float);
            float4 _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4;
            Unity_Add_float4(_Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4, (_Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float.xxxx), _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4);
            float4 _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4;
            Unity_Saturate_float4(_Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4, _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4);
            float _Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float = _ShapeAORemapMin;
            float _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2 = float2(_Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float, _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float);
            float _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, float2 (0, 1), _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2, _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float);
            float _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4, (_Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float.xxxx), _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float);
            float _Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, (_Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float.xxxx), _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv0 = IN.uv0;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv2 = IN.uv2;
            float4 _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float);
            float4 _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float.xxxx), _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4, _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4);
            float4 _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4);
            float4 _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4);
            float _Split_01bd73a39ba6425699e8b16f120dda41_R_1_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[0];
            float _Split_01bd73a39ba6425699e8b16f120dda41_G_2_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[1];
            float _Split_01bd73a39ba6425699e8b16f120dda41_B_3_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[2];
            float _Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[3];
            float _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float;
            Unity_Saturate_float(_Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float);
            float _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float, _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float);
            float _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float;
            Unity_Clamp_float(_Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float, 0, 1, _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float);
            float4 _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4, (_Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float.xxxx), _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4);
            float _Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float = _ShapeHeightMapMin;
            float _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2 = float2(_Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float, _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float);
            float _Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2;
            Unity_Add_float2(_Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2, (_Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float.xx), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2);
            float _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, float2 (0, 1), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float);
            UnityTexture2D _Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv0 = IN.uv0;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv2 = IN.uv2;
            float4 _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4);
            float _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3);
            float3 _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3);
            float3 _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3, _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv0 = IN.uv0;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv2 = IN.uv2;
            float4 _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3);
            float3 _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3;
            Unity_Branch_float3(_Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3);
            float3 _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3;
            Unity_Branch_float3(_Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3);
            float3 _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_690e893d26999680a5cea3604ed0ce16;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv0 = IN.uv0;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv2 = IN.uv2;
            float4 _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNMn_690e893d26999680a5cea3604ed0ce16, _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4);
            float _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3);
            float3 _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3);
            float3 _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3);
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_R_1_Float = IN.WorldSpaceNormal[0];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float = IN.WorldSpaceNormal[1];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_B_3_Float = IN.WorldSpaceNormal[2];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_A_4_Float = 0;
            float _Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float = _Cover_Amount;
            float _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float;
            Unity_Subtract_float(4, _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float);
            float _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float;
            Unity_Divide_float(_Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float);
            float _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.99, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
            float _Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float = _Cover_Max_Angle;
            float _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float;
            Unity_Divide_float(_Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float, 45, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float);
            float _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float;
            Unity_OneMinus_float(_Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float);
            float _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float;
            Unity_Subtract_float(_Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float, _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float);
            float _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float;
            Unity_Clamp_float(_Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float, 0, 2, _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float);
            float _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float;
            Unity_Divide_float(1, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float);
            float _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_2b888688983edd82ac250226d9378893_Out_3_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float, _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float);
            float _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
            float _Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float;
            Unity_OneMinus_float(_Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float, _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float);
            float _Split_ae16de7cacf9d0878aba1467f193d681_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_ae16de7cacf9d0878aba1467f193d681_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_ae16de7cacf9d0878aba1467f193d681_A_4_Float = 0;
            float _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float;
            Unity_Add_float(_OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float, _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float);
            float _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, 1, _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float);
            float _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float;
            Unity_Clamp_float(_Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float, 0, 1, _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float);
            float _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float, _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float);
            float _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float;
            Unity_Divide_float(_Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float);
            float _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float;
            Unity_OneMinus_float(_Divide_bacd243000beaa86b28174bd47716791_Out_2_Float, _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float);
            float _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float;
            Unity_Add_float(_OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float, -0.5, _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float);
            float _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float;
            Unity_Clamp_float(_Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float, 0, 1, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float);
            float _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float;
            Unity_Add_float(_Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float, _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float);
            float _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float;
            Unity_Clamp_float(_Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float, 0, 1, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float);
            float _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float;
            Unity_Multiply_float_float(_Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float);
            float _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float);
            float3 _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float);
            float _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float;
            Unity_Multiply_float_float(_Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float, _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float);
            float _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float;
            Unity_Clamp_float(_Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float, 0, 1, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float);
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            UnityTexture2D _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.tex, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.samplerstate, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float);
            float _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float;
            Unity_Clamp_float(_Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float, 0, 1, _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float);
            float _Split_478c00f7a374463b955f05a768c471e5_R_1_Float = IN.VertexColor[0];
            float _Split_478c00f7a374463b955f05a768c471e5_G_2_Float = IN.VertexColor[1];
            float _Split_478c00f7a374463b955f05a768c471e5_B_3_Float = IN.VertexColor[2];
            float _Split_478c00f7a374463b955f05a768c471e5_A_4_Float = IN.VertexColor[3];
            float _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_2217ca3c12141a8cb1e0c7235b369601;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv0 = IN.uv0;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv2 = IN.uv2;
            float4 _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4);
            float _Split_2f45bca363698c859e51492899bc58f8_R_1_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[0];
            float _Split_2f45bca363698c859e51492899bc58f8_G_2_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[1];
            float _Split_2f45bca363698c859e51492899bc58f8_B_3_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[2];
            float _Split_2f45bca363698c859e51492899bc58f8_A_4_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[3];
            float _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean = _USECoverHeightT;
            float _Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float = _CoverHeightMapMin;
            float _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2 = float2(_Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float, _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float);
            float _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2;
            Unity_Add_float2(_Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2, (_Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float.xx), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2);
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a;
            float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_478c00f7a374463b955f05a768c471e5_B_3_Float, _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float);
            float _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_B_3_Float, float2 (0, 1), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float);
            float _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float;
            Unity_Add_float(_Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float, _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float);
            float _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float;
            Unity_Branch_float(_Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float);
            float _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float);
            float _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float;
            Unity_Clamp_float(_Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float, 0, 1, _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float);
            float _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float);
            float _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float;
            Unity_Saturate_float(_Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float);
            float _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float);
            float _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float;
            Unity_Branch_float(_Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float, _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float);
            float4 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4);
            float _Split_5b2299b48b10138ea40c141b79bfe90e_R_1_Float = IN.VertexColor[0];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float = IN.VertexColor[1];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_B_3_Float = IN.VertexColor[2];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_A_4_Float = IN.VertexColor[3];
            float _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_191760c0269841999e1203612316c3e2;
            float _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float, _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblend_191760c0269841999e1203612316c3e2, _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float);
            float4 _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxxx), _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4);
            float4 _Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4 = _WetColor;
            float4 _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4);
            float _Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_fbe0940e837e4d60897851822bb2478a_R_1_Float = IN.VertexColor[0];
            float _Split_fbe0940e837e4d60897851822bb2478a_G_2_Float = IN.VertexColor[1];
            float _Split_fbe0940e837e4d60897851822bb2478a_B_3_Float = IN.VertexColor[2];
            float _Split_fbe0940e837e4d60897851822bb2478a_A_4_Float = IN.VertexColor[3];
            float _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float;
            Unity_OneMinus_float(_Split_fbe0940e837e4d60897851822bb2478a_R_1_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float);
            float _Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_4455ba68b9564224b288be35609a562d_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float;
            Time_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float);
            float _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float, _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float);
            float _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float;
            Unity_Add_float(_Property_4455ba68b9564224b288be35609a562d_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float);
            float _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float;
            Unity_Add_float(_Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float);
            float _Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float;
            Unity_Add_float(_Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float);
            float4 _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4 = IN.uv2;
            float _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[0];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_G_2_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[1];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_B_3_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[2];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_A_4_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[3];
            float _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float;
            Unity_Smoothstep_float(_Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float, _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float, _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float);
            float _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float, _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float);
            float _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float;
            Unity_Clamp_float(_OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float, 0, 1, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float);
            float _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float);
            float _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float);
            float4 _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4, (_Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float.xxxx), _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4);
            float4 _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4);
            float _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3);
            float3 _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3);
            float3 _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3, _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3);
            float3 _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3);
            float _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3);
            float3 _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3);
            float3 _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3, _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3);
            float3 _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3);
            float3 _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3);
            float3 _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3);
            float3 _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxx), _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3);
            float3 _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxx), _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3);
            float4 Color_a00178231fee4f2282a1897e49ce9144 = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            float _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float);
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_R_1_Float = IN.VertexColor[0];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_G_2_Float = IN.VertexColor[1];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_B_3_Float = IN.VertexColor[2];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_A_4_Float = IN.VertexColor[3];
            float _Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float;
            Unity_Clamp_float(_Split_a91a48b076b34ce9b3510a0bb9d1b59a_R_1_Float, 0, 1, _Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float);
            float _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float;
            Unity_OneMinus_float(_Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float, _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float);
            float _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float);
            float _Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float);
            float _Property_9d25835a7f5949dab1577c31f4add270_Out_0_Float = _BaseEmissionMaskIntensivity_1;
            float _Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float, _Property_9d25835a7f5949dab1577c31f4add270_Out_0_Float, _Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float);
            float _Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float;
            Unity_Absolute_float(_Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float, _Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float);
            float _Property_bb3f61b2a3354ce1b20553e363c5ffd6_Out_0_Float = _BaseEmissionMaskTreshold_1;
            float _Power_42b827d609f14804948ece536aad57bc_Out_2_Float;
            Unity_Power_float(_Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float, _Property_bb3f61b2a3354ce1b20553e363c5ffd6_Out_0_Float, _Power_42b827d609f14804948ece536aad57bc_Out_2_Float);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.uv0 = IN.uv0;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.uv2 = IN.uv2;
            float4 _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f, _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4);
            float _Split_218e1cfd00b30984921b5fc0ec63de60_R_1_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[0];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[1];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_B_3_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[2];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_A_4_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[3];
            float _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float;
            Unity_OneMinus_float(_Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float, _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float);
            float _Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float);
            float _Property_4fd9dff18d2b45919922c1b0192de38b_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float, _Property_4fd9dff18d2b45919922c1b0192de38b_Out_0_Float, _Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float);
            float _Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float;
            Unity_Absolute_float(_Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float, _Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float);
            float _Property_2aa6a59a50f8487c9e33450b5233feaa_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float;
            Unity_Power_float(_Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float, _Property_2aa6a59a50f8487c9e33450b5233feaa_Out_0_Float, _Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float);
            float _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float;
            Unity_OneMinus_float(_Split_2f45bca363698c859e51492899bc58f8_G_2_Float, _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float);
            float _Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float);
            float _Property_efda3c93360149b1ba2ff929571ddbc8_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float, _Property_efda3c93360149b1ba2ff929571ddbc8_Out_0_Float, _Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float);
            float _Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float;
            Unity_Absolute_float(_Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float, _Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float);
            float _Property_50e7bafa1234470e943dac3a542d987e_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float;
            Unity_Power_float(_Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float, _Property_50e7bafa1234470e943dac3a542d987e_Out_0_Float, _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float);
            float _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float;
            Unity_Clamp_float(_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float, 0, 1, _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float);
            float _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float;
            Unity_Lerp_float(_Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float, _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float, _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float, _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float);
            float _Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float;
            Unity_Maximum_float(_Power_42b827d609f14804948ece536aad57bc_Out_2_Float, _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float, _Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float);
            float4 _Property_687b631aa7ff4050b442f1d4ab0df5a7_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float.xxxx), _Property_687b631aa7ff4050b442f1d4ab0df5a7_Out_0_Vector4, _Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4);
            UnityTexture2D _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float2 _Property_4b50c931f2854fc594f86015cfaf0518_Out_0_Vector2 = _NoiseTiling;
            float4 _UV_e02ab42e6a8e44d49fbad51bb7330682_Out_0_Vector4 = IN.uv0;
            float2 _Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_4b50c931f2854fc594f86015cfaf0518_Out_0_Vector2, (_UV_e02ab42e6a8e44d49fbad51bb7330682_Out_0_Vector4.xy), _Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2);
            float2 _Property_b5e141ebd466479f983fae5772389c4e_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float;
            Time_float(_TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float);
            float2 _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_b5e141ebd466479f983fae5772389c4e_Out_0_Vector2, (_TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float.xx), _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2);
            float2 _Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2;
            Unity_Add_float2(_Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2, _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2, _Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2);
            float4 _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.tex, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.samplerstate, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.GetTransformedUV(_Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2) );
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_R_4_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.r;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_G_5_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.g;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_B_6_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.b;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_A_7_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.a;
            float2 _Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2);
            float2 _Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2;
            Unity_Add_float2(_Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2, float2(0.5, 0.5), _Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2);
            float4 _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.tex, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.samplerstate, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.GetTransformedUV(_Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2) );
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_R_4_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.r;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_G_5_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.g;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_B_6_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.b;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_A_7_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.a;
            float _Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_A_7_Float, _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_A_7_Float, _Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float);
            float _Property_78c8f587a1aa40c8bde462a067c88169_Out_0_Float = _EmissionNoiseMultiply;
            float _Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float;
            Unity_Multiply_float_float(_Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float, _Property_78c8f587a1aa40c8bde462a067c88169_Out_0_Float, _Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float);
            float _Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float;
            Unity_Clamp_float(_Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float, 0, 1, _Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float);
            float _Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float;
            Unity_Absolute_float(_Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float, _Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float);
            float _Property_37c5e5c6920648299ae9d083a948fcf5_Out_0_Float = _EmissionNoisePower;
            float _Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float;
            Unity_Power_float(_Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float, _Property_37c5e5c6920648299ae9d083a948fcf5_Out_0_Float, _Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float);
            float _Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float;
            Unity_Multiply_float_float(_Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float, 20, _Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float);
            float _Clamp_0749760111b441aaad255dac506c0480_Out_3_Float;
            Unity_Clamp_float(_Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float, 0.05, 1.2, _Clamp_0749760111b441aaad255dac506c0480_Out_3_Float);
            float4 _Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4, (_Clamp_0749760111b441aaad255dac506c0480_Out_3_Float.xxxx), _Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4);
            float4 _Property_266c9174110f410fb8a1cdd7988b2a7b_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float3 _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3);
            float _DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3, _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3, _DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float);
            float _Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float;
            Unity_Saturate_float(_DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float, _Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float);
            float _OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float;
            Unity_OneMinus_float(_Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float, _OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float);
            float _Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float;
            Unity_Absolute_float(_OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float, _Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float);
            float _Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float;
            Unity_Power_float(_Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float, 10, _Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float);
            float4 _Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_266c9174110f410fb8a1cdd7988b2a7b_Out_0_Vector4, (_Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float.xxxx), _Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4);
            float _Property_5e6002ec35c1440181016786d184ea1c_Out_0_Float = _RimLightPower;
            float4 _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4, (_Property_5e6002ec35c1440181016786d184ea1c_Out_0_Float.xxxx), _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4);
            float4 _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float.xxxx), _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4, _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4);
            float4 _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4;
            Unity_Add_float4(_Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4, _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4, _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4);
            float4 _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4;
            Unity_Clamp_float4(_Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4, float4(0, 0, 0, 0), _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4, _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4);
            float4 _Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, Color_a00178231fee4f2282a1897e49ce9144, _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4, _Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4);
            float _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float = _BaseMetallic;
            float _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float;
            Unity_Multiply_float_float(_Split_218e1cfd00b30984921b5fc0ec63de60_R_1_Float, _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float, _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float);
            float _Property_8142f12b781ad08680220297dab56f14_Out_0_Float = _BaseAORemapMin;
            float _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float = _BaseAORemapMax;
            float2 _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2 = float2(_Property_8142f12b781ad08680220297dab56f14_Out_0_Float, _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float);
            float _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float;
            Unity_Remap_float(_Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float, float2 (0, 1), _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float);
            float _Multiply_48b61242b94a49758881317df2c2514e_Out_2_Float;
            Unity_Multiply_float_float(_Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float, _Multiply_48b61242b94a49758881317df2c2514e_Out_2_Float);
            float _Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2 = float2(_Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float, _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float);
            float _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float;
            Unity_Remap_float(_Split_218e1cfd00b30984921b5fc0ec63de60_A_4_Float, float2 (0, 1), _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float);
            float _Property_f8645c0ed78449b1b7fcfe684d81741f_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_76b39e0823e74973a808f758eaf1ec1e_Out_2_Float;
            Unity_Multiply_float_float(_Property_f8645c0ed78449b1b7fcfe684d81741f_Out_0_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Multiply_76b39e0823e74973a808f758eaf1ec1e_Out_2_Float);
            float _Lerp_4cdc4988affe45fdb7ff22d366e72855_Out_3_Float;
            Unity_Lerp_float(_Multiply_76b39e0823e74973a808f758eaf1ec1e_Out_2_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _Lerp_4cdc4988affe45fdb7ff22d366e72855_Out_3_Float);
            float _Lerp_fb5e03799613459f91041eceb925d598_Out_3_Float;
            Unity_Lerp_float(_Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Lerp_4cdc4988affe45fdb7ff22d366e72855_Out_3_Float, _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float, _Lerp_fb5e03799613459f91041eceb925d598_Out_3_Float);
            float _Clamp_50431261615a4278b72a3136fde15146_Out_3_Float;
            Unity_Clamp_float(_Lerp_fb5e03799613459f91041eceb925d598_Out_3_Float, 0, 1, _Clamp_50431261615a4278b72a3136fde15146_Out_3_Float);
            float3 _Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3 = float3(_Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float, _Multiply_48b61242b94a49758881317df2c2514e_Out_2_Float, _Clamp_50431261615a4278b72a3136fde15146_Out_3_Float);
            float _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float = _CoverMetallic;
            float _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float;
            Unity_Multiply_float_float(_Split_2f45bca363698c859e51492899bc58f8_R_1_Float, _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float, _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float);
            float _Property_5101ca6f3e754f7ca2e43177db6a6ead_Out_0_Float = _ShapeAORemapMin_1;
            float _Property_3a4df3d7a3ed439aa98ad93a2e18937e_Out_0_Float = _ShapeAORemapMax_1;
            float2 _Vector2_e4cd00667c5943d4b84a846a188996ab_Out_0_Vector2 = float2(_Property_5101ca6f3e754f7ca2e43177db6a6ead_Out_0_Float, _Property_3a4df3d7a3ed439aa98ad93a2e18937e_Out_0_Float);
            float _Remap_626c76078c2e4330a1b3789ac23552a2_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, float2 (0, 1), _Vector2_e4cd00667c5943d4b84a846a188996ab_Out_0_Vector2, _Remap_626c76078c2e4330a1b3789ac23552a2_Out_3_Float);
            float _Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float = _CoverAORemapMin;
            float _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float = _CoverAORemapMax;
            float2 _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2 = float2(_Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float, _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float);
            float _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_G_2_Float, float2 (0, 1), _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float);
            float _Multiply_1abdb1e4731441c2b9829db686917bd5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_626c76078c2e4330a1b3789ac23552a2_Out_3_Float, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float, _Multiply_1abdb1e4731441c2b9829db686917bd5_Out_2_Float);
            float _Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2 = float2(_Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float, _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float);
            float _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_A_4_Float, float2 (0, 1), _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float);
            float _Property_a9c4706e2fa14279b355bf328e7ad220_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_3ff06ec49d8a4c5fbf0757424ff6b45f_Out_2_Float;
            Unity_Multiply_float_float(_Property_a9c4706e2fa14279b355bf328e7ad220_Out_0_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Multiply_3ff06ec49d8a4c5fbf0757424ff6b45f_Out_2_Float);
            float _Lerp_4581a1e5d8c64e82b4e8000e28918554_Out_3_Float;
            Unity_Lerp_float(_Multiply_3ff06ec49d8a4c5fbf0757424ff6b45f_Out_2_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _Lerp_4581a1e5d8c64e82b4e8000e28918554_Out_3_Float);
            float _Lerp_45ea1fc32bdf48b29c071f6d6e45a86c_Out_3_Float;
            Unity_Lerp_float(_Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Lerp_4581a1e5d8c64e82b4e8000e28918554_Out_3_Float, _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float, _Lerp_45ea1fc32bdf48b29c071f6d6e45a86c_Out_3_Float);
            float _Clamp_9a5ee8189830402e9f7a0557859ae26f_Out_3_Float;
            Unity_Clamp_float(_Lerp_45ea1fc32bdf48b29c071f6d6e45a86c_Out_3_Float, 0, 1, _Clamp_9a5ee8189830402e9f7a0557859ae26f_Out_3_Float);
            float3 _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3 = float3(_Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float, _Multiply_1abdb1e4731441c2b9829db686917bd5_Out_2_Float, _Clamp_9a5ee8189830402e9f7a0557859ae26f_Out_3_Float);
            float3 _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxx), _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3);
            float3 _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxx), _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3);
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float = _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3[0];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float = _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3[1];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float = _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3[2];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_A_4_Float = 0;
            float _Property_006bb9304a39f5808cf13865f8c36ad4_Out_0_Float = _WetSmoothness;
            float _Lerp_02403a8fb24f4c8fb8bd6dbe84811d9a_Out_3_Float;
            Unity_Lerp_float(_Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Property_006bb9304a39f5808cf13865f8c36ad4_Out_0_Float, _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float, _Lerp_02403a8fb24f4c8fb8bd6dbe84811d9a_Out_3_Float);
            float _Branch_93d3d524b48e49089c6a7f1867e5bda5_Out_3_Float;
            Unity_Branch_float(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, _Lerp_02403a8fb24f4c8fb8bd6dbe84811d9a_Out_3_Float, _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Branch_93d3d524b48e49089c6a7f1867e5bda5_Out_3_Float);
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.BaseColor = (_Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4.xyz);
            surface.NormalTS = _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            surface.Emission = (_Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4.xyz);
            surface.Metallic = _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Branch_93d3d524b48e49089c6a7f1867e5bda5_Out_3_Float;
            surface.Occlusion = _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
            output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpaceViewDirection = GetWorldSpaceNormalizeViewDir(input.positionWS);
            float3x3 tangentSpaceTransform = float3x3(output.WorldSpaceTangent, output.WorldSpaceBiTangent, output.WorldSpaceNormal);
            output.TangentSpaceViewDirection = mul(tangentSpaceTransform, output.WorldSpaceViewDirection);
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "GBuffer"
            Tags
            {
                "LightMode" = "UniversalGBuffer"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 4.5
        #pragma exclude_renderers gles gles3 glcore
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
        #pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma shader_feature_fragment _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local_fragment _ _ALPHAPREMULTIPLY_ON
        #pragma shader_feature_local_fragment _ _ALPHAMODULATE_ON
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local_fragment _ _SPECULAR_SETUP
        #pragma shader_feature_local _ _RECEIVE_SHADOWS_OFF
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #define VARYINGS_NEED_SHADOW_COORD
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_GBUFFER
        #define _FOG_FRAGMENT 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh;
            #endif
             float4 fogFactorAndVertexLight;
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 TangentSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpaceViewDirection;
             float3 TangentSpaceViewDirection;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV : INTERP0;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh : INTERP2;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord : INTERP3;
            #endif
             float4 tangentWS : INTERP4;
             float4 texCoord0 : INTERP5;
             float4 texCoord2 : INTERP6;
             float4 color : INTERP7;
             float4 fogFactorAndVertexLight : INTERP8;
             float3 positionWS : INTERP9;
             float3 normalWS : INTERP10;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(1, _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_CrossProduct_float(float3 A, float3 B, out float3 Out)
        {
            Out = cross(A, B);
        }
        
        void Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_MatrixConstruction_Column_float (float4 M0, float4 M1, float4 M2, float4 M3, out float4x4 Out4x4, out float3x3 Out3x3, out float2x2 Out2x2)
        {
        Out4x4 = float4x4(M0.x, M1.x, M2.x, M3.x, M0.y, M1.y, M2.y, M3.y, M0.z, M1.z, M2.z, M3.z, M0.w, M1.w, M2.w, M3.w);
        Out3x3 = float3x3(M0.x, M1.x, M2.x, M0.y, M1.y, M2.y, M0.z, M1.z, M2.z);
        Out2x2 = float2x2(M0.x, M1.x, M0.y, M1.y);
        }
        
        void Unity_Multiply_float3x3_float3(float3x3 A, float3 B, out float3 Out)
        {
        Out = mul(A, B);
        }
        
        struct Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv2;
        };
        
        void SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(float3 _Vector3, Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float IN, out float3 OutVector3_1)
        {
        float3 _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3;
        Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(IN.AbsoluteWorldSpacePosition, _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3);
        float3 _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3;
        Unity_CrossProduct_float(_DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3, IN.WorldSpaceNormal, _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3);
        float4 _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4 = IN.uv2;
        float _Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[0];
        float _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[1];
        float _Split_99c92b6260e6490ea7a39eb613456b77_B_3_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[2];
        float _Split_99c92b6260e6490ea7a39eb613456b77_A_4_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[3];
        float2 _Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2 = float2(_Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float, _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float);
        float2 _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2;
        Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2);
        float _Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[0];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[1];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_B_3_Float = 0;
        float _Split_03c55994216049a3b33e5a5dbbdd692d_A_4_Float = 0;
        float3 _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float.xxx), _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3);
        float3 _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3;
        Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(IN.AbsoluteWorldSpacePosition, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3);
        float3 _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3;
        Unity_CrossProduct_float(IN.WorldSpaceNormal, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3, _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3);
        float2 _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2;
        Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2);
        float _Split_487845396d594ea6b15fc953f598ece2_R_1_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[0];
        float _Split_487845396d594ea6b15fc953f598ece2_G_2_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[1];
        float _Split_487845396d594ea6b15fc953f598ece2_B_3_Float = 0;
        float _Split_487845396d594ea6b15fc953f598ece2_A_4_Float = 0;
        float3 _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_R_1_Float.xxx), _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3);
        float3 _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3;
        Unity_Add_float3(_Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3, _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3);
        float _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float;
        Unity_DotProduct_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float);
        float3 _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float.xxx), _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3);
        float3 _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_G_2_Float.xxx), _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3);
        float3 _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3;
        Unity_Add_float3(_Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3, _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3);
        float _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float;
        Unity_DotProduct_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float);
        float _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float;
        Unity_Maximum_float(_DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float, _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float);
        float _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float;
        Unity_SquareRoot_float(_Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float);
        float _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float;
        Unity_Divide_float(1, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float, _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float);
        float3 _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3);
        float3 _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3);
        float4x4 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4;
        float3x3 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3;
        float2x2 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2;
        Unity_MatrixConstruction_Column_float((float4(_Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3, 1.0)), (float4(_Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3, 1.0)), (float4(IN.WorldSpaceNormal, 1.0)), float4 (0, 0, 0, 0), _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2);
        float3 _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3 = _Vector3;
        float3 _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3;
        Unity_Multiply_float3x3_float3(_MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3, _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3);
        float3 _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3 = TransformWorldToTangent(_Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3);
        OutVector3_1 = _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Minimum_float(float A, float B, out float Out)
        {
            Out = min(A, B);
        };
        
        void Unity_Clamp_float4(float4 In, float4 Min, float4 Max, out float4 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 NormalTS;
            float3 Emission;
            float Metallic;
            float3 Specular;
            float Smoothness;
            float Occlusion;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_cb7ded32e6af3382bbe06b62977afab6;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv0 = IN.uv0;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv2 = IN.uv2;
            float4 _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4 = IN.uv0;
            float4 _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4 = IN.uv2;
            float4 _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4;
            Unity_Branch_float4(_Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean, _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4, _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4, _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4);
            float4 _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[0];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[1];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[2];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[3];
            float2 _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float);
            float2 _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float);
            float2 _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4.xy), _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2, _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2, _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2);
            float4 _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.tex, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.samplerstate, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2) );
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.r;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_G_5_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.g;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_B_6_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.b;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_A_7_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.a;
            float _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float);
            float4 _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float.xxxx), _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4, _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4);
            float4 _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4);
            float4 _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4);
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_A_4_Float, _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float);
            float _Split_1176033144b640c6ba683d9125e797cb_R_1_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[0];
            float _Split_1176033144b640c6ba683d9125e797cb_G_2_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[1];
            float _Split_1176033144b640c6ba683d9125e797cb_B_3_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[2];
            float _Split_1176033144b640c6ba683d9125e797cb_A_4_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[3];
            float _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float;
            Unity_Saturate_float(_Split_1176033144b640c6ba683d9125e797cb_A_4_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float);
            float _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float, _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float);
            float _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float;
            Unity_Clamp_float(_Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float, 0, 1, _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float);
            float4 _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4, (_Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float.xxxx), _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4);
            float _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float);
            float _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float;
            Unity_Subtract_float(_OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float, 0.5, _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float);
            float4 _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, (_Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float.xxxx), _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4);
            float _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float;
            Unity_Subtract_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, 0.5, _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float);
            float4 _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4;
            Unity_Add_float4(_Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4, (_Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float.xxxx), _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4);
            float4 _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4;
            Unity_Saturate_float4(_Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4, _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4);
            float _Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float = _ShapeAORemapMin;
            float _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2 = float2(_Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float, _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float);
            float _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, float2 (0, 1), _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2, _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float);
            float _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4, (_Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float.xxxx), _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float);
            float _Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, (_Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float.xxxx), _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv0 = IN.uv0;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv2 = IN.uv2;
            float4 _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float);
            float4 _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float.xxxx), _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4, _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4);
            float4 _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4);
            float4 _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4);
            float _Split_01bd73a39ba6425699e8b16f120dda41_R_1_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[0];
            float _Split_01bd73a39ba6425699e8b16f120dda41_G_2_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[1];
            float _Split_01bd73a39ba6425699e8b16f120dda41_B_3_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[2];
            float _Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[3];
            float _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float;
            Unity_Saturate_float(_Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float);
            float _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float, _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float);
            float _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float;
            Unity_Clamp_float(_Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float, 0, 1, _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float);
            float4 _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4, (_Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float.xxxx), _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4);
            float _Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float = _ShapeHeightMapMin;
            float _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2 = float2(_Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float, _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float);
            float _Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2;
            Unity_Add_float2(_Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2, (_Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float.xx), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2);
            float _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, float2 (0, 1), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float);
            UnityTexture2D _Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv0 = IN.uv0;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv2 = IN.uv2;
            float4 _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4);
            float _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3);
            float3 _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3);
            float3 _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3, _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv0 = IN.uv0;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv2 = IN.uv2;
            float4 _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3);
            float3 _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3;
            Unity_Branch_float3(_Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3);
            float3 _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3;
            Unity_Branch_float3(_Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3);
            float3 _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_690e893d26999680a5cea3604ed0ce16;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv0 = IN.uv0;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv2 = IN.uv2;
            float4 _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNMn_690e893d26999680a5cea3604ed0ce16, _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4);
            float _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3);
            float3 _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3);
            float3 _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3);
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_R_1_Float = IN.WorldSpaceNormal[0];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float = IN.WorldSpaceNormal[1];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_B_3_Float = IN.WorldSpaceNormal[2];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_A_4_Float = 0;
            float _Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float = _Cover_Amount;
            float _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float;
            Unity_Subtract_float(4, _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float);
            float _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float;
            Unity_Divide_float(_Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float);
            float _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.99, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
            float _Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float = _Cover_Max_Angle;
            float _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float;
            Unity_Divide_float(_Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float, 45, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float);
            float _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float;
            Unity_OneMinus_float(_Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float);
            float _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float;
            Unity_Subtract_float(_Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float, _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float);
            float _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float;
            Unity_Clamp_float(_Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float, 0, 2, _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float);
            float _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float;
            Unity_Divide_float(1, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float);
            float _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_2b888688983edd82ac250226d9378893_Out_3_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float, _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float);
            float _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
            float _Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float;
            Unity_OneMinus_float(_Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float, _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float);
            float _Split_ae16de7cacf9d0878aba1467f193d681_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_ae16de7cacf9d0878aba1467f193d681_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_ae16de7cacf9d0878aba1467f193d681_A_4_Float = 0;
            float _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float;
            Unity_Add_float(_OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float, _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float);
            float _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, 1, _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float);
            float _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float;
            Unity_Clamp_float(_Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float, 0, 1, _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float);
            float _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float, _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float);
            float _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float;
            Unity_Divide_float(_Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float);
            float _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float;
            Unity_OneMinus_float(_Divide_bacd243000beaa86b28174bd47716791_Out_2_Float, _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float);
            float _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float;
            Unity_Add_float(_OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float, -0.5, _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float);
            float _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float;
            Unity_Clamp_float(_Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float, 0, 1, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float);
            float _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float;
            Unity_Add_float(_Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float, _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float);
            float _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float;
            Unity_Clamp_float(_Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float, 0, 1, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float);
            float _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float;
            Unity_Multiply_float_float(_Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float);
            float _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float);
            float3 _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float);
            float _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float;
            Unity_Multiply_float_float(_Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float, _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float);
            float _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float;
            Unity_Clamp_float(_Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float, 0, 1, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float);
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            UnityTexture2D _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.tex, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.samplerstate, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float);
            float _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float;
            Unity_Clamp_float(_Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float, 0, 1, _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float);
            float _Split_478c00f7a374463b955f05a768c471e5_R_1_Float = IN.VertexColor[0];
            float _Split_478c00f7a374463b955f05a768c471e5_G_2_Float = IN.VertexColor[1];
            float _Split_478c00f7a374463b955f05a768c471e5_B_3_Float = IN.VertexColor[2];
            float _Split_478c00f7a374463b955f05a768c471e5_A_4_Float = IN.VertexColor[3];
            float _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_2217ca3c12141a8cb1e0c7235b369601;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv0 = IN.uv0;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv2 = IN.uv2;
            float4 _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4);
            float _Split_2f45bca363698c859e51492899bc58f8_R_1_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[0];
            float _Split_2f45bca363698c859e51492899bc58f8_G_2_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[1];
            float _Split_2f45bca363698c859e51492899bc58f8_B_3_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[2];
            float _Split_2f45bca363698c859e51492899bc58f8_A_4_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[3];
            float _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean = _USECoverHeightT;
            float _Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float = _CoverHeightMapMin;
            float _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2 = float2(_Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float, _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float);
            float _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2;
            Unity_Add_float2(_Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2, (_Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float.xx), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2);
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a;
            float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_478c00f7a374463b955f05a768c471e5_B_3_Float, _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float);
            float _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_B_3_Float, float2 (0, 1), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float);
            float _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float;
            Unity_Add_float(_Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float, _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float);
            float _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float;
            Unity_Branch_float(_Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float);
            float _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float);
            float _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float;
            Unity_Clamp_float(_Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float, 0, 1, _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float);
            float _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float);
            float _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float;
            Unity_Saturate_float(_Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float);
            float _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float);
            float _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float;
            Unity_Branch_float(_Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float, _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float);
            float4 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4);
            float _Split_5b2299b48b10138ea40c141b79bfe90e_R_1_Float = IN.VertexColor[0];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float = IN.VertexColor[1];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_B_3_Float = IN.VertexColor[2];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_A_4_Float = IN.VertexColor[3];
            float _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_191760c0269841999e1203612316c3e2;
            float _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float, _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblend_191760c0269841999e1203612316c3e2, _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float);
            float4 _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxxx), _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4);
            float4 _Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4 = _WetColor;
            float4 _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4);
            float _Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_fbe0940e837e4d60897851822bb2478a_R_1_Float = IN.VertexColor[0];
            float _Split_fbe0940e837e4d60897851822bb2478a_G_2_Float = IN.VertexColor[1];
            float _Split_fbe0940e837e4d60897851822bb2478a_B_3_Float = IN.VertexColor[2];
            float _Split_fbe0940e837e4d60897851822bb2478a_A_4_Float = IN.VertexColor[3];
            float _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float;
            Unity_OneMinus_float(_Split_fbe0940e837e4d60897851822bb2478a_R_1_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float);
            float _Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_4455ba68b9564224b288be35609a562d_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float;
            Time_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float);
            float _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float, _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float);
            float _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float;
            Unity_Add_float(_Property_4455ba68b9564224b288be35609a562d_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float);
            float _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float;
            Unity_Add_float(_Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float);
            float _Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float;
            Unity_Add_float(_Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float);
            float4 _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4 = IN.uv2;
            float _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[0];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_G_2_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[1];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_B_3_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[2];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_A_4_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[3];
            float _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float;
            Unity_Smoothstep_float(_Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float, _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float, _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float);
            float _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float, _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float);
            float _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float;
            Unity_Clamp_float(_OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float, 0, 1, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float);
            float _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float);
            float _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float);
            float4 _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4, (_Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float.xxxx), _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4);
            float4 _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4);
            float _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3);
            float3 _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3);
            float3 _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3, _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3);
            float3 _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3);
            float _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3);
            float3 _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3);
            float3 _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3, _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3);
            float3 _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3);
            float3 _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3);
            float3 _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3);
            float3 _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxx), _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3);
            float3 _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxx), _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3);
            float4 Color_a00178231fee4f2282a1897e49ce9144 = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            float _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float);
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_R_1_Float = IN.VertexColor[0];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_G_2_Float = IN.VertexColor[1];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_B_3_Float = IN.VertexColor[2];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_A_4_Float = IN.VertexColor[3];
            float _Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float;
            Unity_Clamp_float(_Split_a91a48b076b34ce9b3510a0bb9d1b59a_R_1_Float, 0, 1, _Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float);
            float _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float;
            Unity_OneMinus_float(_Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float, _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float);
            float _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float);
            float _Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float);
            float _Property_9d25835a7f5949dab1577c31f4add270_Out_0_Float = _BaseEmissionMaskIntensivity_1;
            float _Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float, _Property_9d25835a7f5949dab1577c31f4add270_Out_0_Float, _Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float);
            float _Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float;
            Unity_Absolute_float(_Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float, _Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float);
            float _Property_bb3f61b2a3354ce1b20553e363c5ffd6_Out_0_Float = _BaseEmissionMaskTreshold_1;
            float _Power_42b827d609f14804948ece536aad57bc_Out_2_Float;
            Unity_Power_float(_Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float, _Property_bb3f61b2a3354ce1b20553e363c5ffd6_Out_0_Float, _Power_42b827d609f14804948ece536aad57bc_Out_2_Float);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.uv0 = IN.uv0;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.uv2 = IN.uv2;
            float4 _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f, _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4);
            float _Split_218e1cfd00b30984921b5fc0ec63de60_R_1_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[0];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[1];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_B_3_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[2];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_A_4_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[3];
            float _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float;
            Unity_OneMinus_float(_Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float, _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float);
            float _Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float);
            float _Property_4fd9dff18d2b45919922c1b0192de38b_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float, _Property_4fd9dff18d2b45919922c1b0192de38b_Out_0_Float, _Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float);
            float _Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float;
            Unity_Absolute_float(_Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float, _Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float);
            float _Property_2aa6a59a50f8487c9e33450b5233feaa_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float;
            Unity_Power_float(_Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float, _Property_2aa6a59a50f8487c9e33450b5233feaa_Out_0_Float, _Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float);
            float _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float;
            Unity_OneMinus_float(_Split_2f45bca363698c859e51492899bc58f8_G_2_Float, _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float);
            float _Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float);
            float _Property_efda3c93360149b1ba2ff929571ddbc8_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float, _Property_efda3c93360149b1ba2ff929571ddbc8_Out_0_Float, _Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float);
            float _Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float;
            Unity_Absolute_float(_Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float, _Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float);
            float _Property_50e7bafa1234470e943dac3a542d987e_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float;
            Unity_Power_float(_Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float, _Property_50e7bafa1234470e943dac3a542d987e_Out_0_Float, _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float);
            float _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float;
            Unity_Clamp_float(_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float, 0, 1, _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float);
            float _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float;
            Unity_Lerp_float(_Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float, _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float, _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float, _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float);
            float _Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float;
            Unity_Maximum_float(_Power_42b827d609f14804948ece536aad57bc_Out_2_Float, _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float, _Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float);
            float4 _Property_687b631aa7ff4050b442f1d4ab0df5a7_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float.xxxx), _Property_687b631aa7ff4050b442f1d4ab0df5a7_Out_0_Vector4, _Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4);
            UnityTexture2D _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float2 _Property_4b50c931f2854fc594f86015cfaf0518_Out_0_Vector2 = _NoiseTiling;
            float4 _UV_e02ab42e6a8e44d49fbad51bb7330682_Out_0_Vector4 = IN.uv0;
            float2 _Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_4b50c931f2854fc594f86015cfaf0518_Out_0_Vector2, (_UV_e02ab42e6a8e44d49fbad51bb7330682_Out_0_Vector4.xy), _Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2);
            float2 _Property_b5e141ebd466479f983fae5772389c4e_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float;
            Time_float(_TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float);
            float2 _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_b5e141ebd466479f983fae5772389c4e_Out_0_Vector2, (_TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float.xx), _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2);
            float2 _Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2;
            Unity_Add_float2(_Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2, _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2, _Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2);
            float4 _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.tex, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.samplerstate, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.GetTransformedUV(_Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2) );
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_R_4_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.r;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_G_5_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.g;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_B_6_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.b;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_A_7_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.a;
            float2 _Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2);
            float2 _Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2;
            Unity_Add_float2(_Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2, float2(0.5, 0.5), _Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2);
            float4 _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.tex, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.samplerstate, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.GetTransformedUV(_Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2) );
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_R_4_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.r;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_G_5_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.g;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_B_6_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.b;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_A_7_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.a;
            float _Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_A_7_Float, _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_A_7_Float, _Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float);
            float _Property_78c8f587a1aa40c8bde462a067c88169_Out_0_Float = _EmissionNoiseMultiply;
            float _Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float;
            Unity_Multiply_float_float(_Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float, _Property_78c8f587a1aa40c8bde462a067c88169_Out_0_Float, _Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float);
            float _Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float;
            Unity_Clamp_float(_Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float, 0, 1, _Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float);
            float _Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float;
            Unity_Absolute_float(_Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float, _Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float);
            float _Property_37c5e5c6920648299ae9d083a948fcf5_Out_0_Float = _EmissionNoisePower;
            float _Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float;
            Unity_Power_float(_Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float, _Property_37c5e5c6920648299ae9d083a948fcf5_Out_0_Float, _Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float);
            float _Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float;
            Unity_Multiply_float_float(_Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float, 20, _Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float);
            float _Clamp_0749760111b441aaad255dac506c0480_Out_3_Float;
            Unity_Clamp_float(_Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float, 0.05, 1.2, _Clamp_0749760111b441aaad255dac506c0480_Out_3_Float);
            float4 _Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4, (_Clamp_0749760111b441aaad255dac506c0480_Out_3_Float.xxxx), _Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4);
            float4 _Property_266c9174110f410fb8a1cdd7988b2a7b_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float3 _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3);
            float _DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3, _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3, _DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float);
            float _Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float;
            Unity_Saturate_float(_DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float, _Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float);
            float _OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float;
            Unity_OneMinus_float(_Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float, _OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float);
            float _Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float;
            Unity_Absolute_float(_OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float, _Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float);
            float _Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float;
            Unity_Power_float(_Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float, 10, _Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float);
            float4 _Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_266c9174110f410fb8a1cdd7988b2a7b_Out_0_Vector4, (_Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float.xxxx), _Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4);
            float _Property_5e6002ec35c1440181016786d184ea1c_Out_0_Float = _RimLightPower;
            float4 _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4, (_Property_5e6002ec35c1440181016786d184ea1c_Out_0_Float.xxxx), _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4);
            float4 _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float.xxxx), _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4, _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4);
            float4 _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4;
            Unity_Add_float4(_Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4, _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4, _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4);
            float4 _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4;
            Unity_Clamp_float4(_Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4, float4(0, 0, 0, 0), _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4, _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4);
            float4 _Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, Color_a00178231fee4f2282a1897e49ce9144, _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4, _Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4);
            float _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float = _BaseMetallic;
            float _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float;
            Unity_Multiply_float_float(_Split_218e1cfd00b30984921b5fc0ec63de60_R_1_Float, _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float, _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float);
            float _Property_8142f12b781ad08680220297dab56f14_Out_0_Float = _BaseAORemapMin;
            float _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float = _BaseAORemapMax;
            float2 _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2 = float2(_Property_8142f12b781ad08680220297dab56f14_Out_0_Float, _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float);
            float _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float;
            Unity_Remap_float(_Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float, float2 (0, 1), _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float);
            float _Multiply_48b61242b94a49758881317df2c2514e_Out_2_Float;
            Unity_Multiply_float_float(_Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float, _Multiply_48b61242b94a49758881317df2c2514e_Out_2_Float);
            float _Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2 = float2(_Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float, _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float);
            float _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float;
            Unity_Remap_float(_Split_218e1cfd00b30984921b5fc0ec63de60_A_4_Float, float2 (0, 1), _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float);
            float _Property_f8645c0ed78449b1b7fcfe684d81741f_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_76b39e0823e74973a808f758eaf1ec1e_Out_2_Float;
            Unity_Multiply_float_float(_Property_f8645c0ed78449b1b7fcfe684d81741f_Out_0_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Multiply_76b39e0823e74973a808f758eaf1ec1e_Out_2_Float);
            float _Lerp_4cdc4988affe45fdb7ff22d366e72855_Out_3_Float;
            Unity_Lerp_float(_Multiply_76b39e0823e74973a808f758eaf1ec1e_Out_2_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _Lerp_4cdc4988affe45fdb7ff22d366e72855_Out_3_Float);
            float _Lerp_fb5e03799613459f91041eceb925d598_Out_3_Float;
            Unity_Lerp_float(_Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Lerp_4cdc4988affe45fdb7ff22d366e72855_Out_3_Float, _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float, _Lerp_fb5e03799613459f91041eceb925d598_Out_3_Float);
            float _Clamp_50431261615a4278b72a3136fde15146_Out_3_Float;
            Unity_Clamp_float(_Lerp_fb5e03799613459f91041eceb925d598_Out_3_Float, 0, 1, _Clamp_50431261615a4278b72a3136fde15146_Out_3_Float);
            float3 _Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3 = float3(_Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float, _Multiply_48b61242b94a49758881317df2c2514e_Out_2_Float, _Clamp_50431261615a4278b72a3136fde15146_Out_3_Float);
            float _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float = _CoverMetallic;
            float _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float;
            Unity_Multiply_float_float(_Split_2f45bca363698c859e51492899bc58f8_R_1_Float, _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float, _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float);
            float _Property_5101ca6f3e754f7ca2e43177db6a6ead_Out_0_Float = _ShapeAORemapMin_1;
            float _Property_3a4df3d7a3ed439aa98ad93a2e18937e_Out_0_Float = _ShapeAORemapMax_1;
            float2 _Vector2_e4cd00667c5943d4b84a846a188996ab_Out_0_Vector2 = float2(_Property_5101ca6f3e754f7ca2e43177db6a6ead_Out_0_Float, _Property_3a4df3d7a3ed439aa98ad93a2e18937e_Out_0_Float);
            float _Remap_626c76078c2e4330a1b3789ac23552a2_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, float2 (0, 1), _Vector2_e4cd00667c5943d4b84a846a188996ab_Out_0_Vector2, _Remap_626c76078c2e4330a1b3789ac23552a2_Out_3_Float);
            float _Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float = _CoverAORemapMin;
            float _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float = _CoverAORemapMax;
            float2 _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2 = float2(_Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float, _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float);
            float _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_G_2_Float, float2 (0, 1), _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float);
            float _Multiply_1abdb1e4731441c2b9829db686917bd5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_626c76078c2e4330a1b3789ac23552a2_Out_3_Float, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float, _Multiply_1abdb1e4731441c2b9829db686917bd5_Out_2_Float);
            float _Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2 = float2(_Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float, _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float);
            float _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_A_4_Float, float2 (0, 1), _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float);
            float _Property_a9c4706e2fa14279b355bf328e7ad220_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_3ff06ec49d8a4c5fbf0757424ff6b45f_Out_2_Float;
            Unity_Multiply_float_float(_Property_a9c4706e2fa14279b355bf328e7ad220_Out_0_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Multiply_3ff06ec49d8a4c5fbf0757424ff6b45f_Out_2_Float);
            float _Lerp_4581a1e5d8c64e82b4e8000e28918554_Out_3_Float;
            Unity_Lerp_float(_Multiply_3ff06ec49d8a4c5fbf0757424ff6b45f_Out_2_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _Lerp_4581a1e5d8c64e82b4e8000e28918554_Out_3_Float);
            float _Lerp_45ea1fc32bdf48b29c071f6d6e45a86c_Out_3_Float;
            Unity_Lerp_float(_Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Lerp_4581a1e5d8c64e82b4e8000e28918554_Out_3_Float, _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float, _Lerp_45ea1fc32bdf48b29c071f6d6e45a86c_Out_3_Float);
            float _Clamp_9a5ee8189830402e9f7a0557859ae26f_Out_3_Float;
            Unity_Clamp_float(_Lerp_45ea1fc32bdf48b29c071f6d6e45a86c_Out_3_Float, 0, 1, _Clamp_9a5ee8189830402e9f7a0557859ae26f_Out_3_Float);
            float3 _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3 = float3(_Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float, _Multiply_1abdb1e4731441c2b9829db686917bd5_Out_2_Float, _Clamp_9a5ee8189830402e9f7a0557859ae26f_Out_3_Float);
            float3 _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxx), _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3);
            float3 _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxx), _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3);
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float = _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3[0];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float = _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3[1];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float = _Lerp_cd48faee6b304c20832ce296ba7daa7f_Out_3_Vector3[2];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_A_4_Float = 0;
            float _Property_006bb9304a39f5808cf13865f8c36ad4_Out_0_Float = _WetSmoothness;
            float _Lerp_02403a8fb24f4c8fb8bd6dbe84811d9a_Out_3_Float;
            Unity_Lerp_float(_Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Property_006bb9304a39f5808cf13865f8c36ad4_Out_0_Float, _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float, _Lerp_02403a8fb24f4c8fb8bd6dbe84811d9a_Out_3_Float);
            float _Branch_93d3d524b48e49089c6a7f1867e5bda5_Out_3_Float;
            Unity_Branch_float(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, _Lerp_02403a8fb24f4c8fb8bd6dbe84811d9a_Out_3_Float, _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Branch_93d3d524b48e49089c6a7f1867e5bda5_Out_3_Float);
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.BaseColor = (_Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4.xyz);
            surface.NormalTS = _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            surface.Emission = (_Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4.xyz);
            surface.Metallic = _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Branch_93d3d524b48e49089c6a7f1867e5bda5_Out_3_Float;
            surface.Occlusion = _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
            output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpaceViewDirection = GetWorldSpaceNormalizeViewDir(input.positionWS);
            float3x3 tangentSpaceTransform = float3x3(output.WorldSpaceTangent, output.WorldSpaceBiTangent, output.WorldSpaceNormal);
            output.TangentSpaceViewDirection = mul(tangentSpaceTransform, output.WorldSpaceViewDirection);
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask 0
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_SHADOWCASTER
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv2 : TEXCOORD2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 texCoord0;
             float4 texCoord2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0 : INTERP0;
             float4 texCoord2 : INTERP1;
             float3 positionWS : INTERP2;
             float3 normalWS : INTERP3;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags
            {
                "LightMode" = "DepthOnly"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask R
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv2 : TEXCOORD2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float4 texCoord0;
             float4 texCoord2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0 : INTERP0;
             float4 texCoord2 : INTERP1;
             float3 positionWS : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthNormals"
            Tags
            {
                "LightMode" = "DepthNormals"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHNORMALS
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 TangentSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 tangentWS : INTERP0;
             float4 texCoord0 : INTERP1;
             float4 texCoord2 : INTERP2;
             float4 color : INTERP3;
             float3 positionWS : INTERP4;
             float3 normalWS : INTERP5;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(1, _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_CrossProduct_float(float3 A, float3 B, out float3 Out)
        {
            Out = cross(A, B);
        }
        
        void Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_MatrixConstruction_Column_float (float4 M0, float4 M1, float4 M2, float4 M3, out float4x4 Out4x4, out float3x3 Out3x3, out float2x2 Out2x2)
        {
        Out4x4 = float4x4(M0.x, M1.x, M2.x, M3.x, M0.y, M1.y, M2.y, M3.y, M0.z, M1.z, M2.z, M3.z, M0.w, M1.w, M2.w, M3.w);
        Out3x3 = float3x3(M0.x, M1.x, M2.x, M0.y, M1.y, M2.y, M0.z, M1.z, M2.z);
        Out2x2 = float2x2(M0.x, M1.x, M0.y, M1.y);
        }
        
        void Unity_Multiply_float3x3_float3(float3x3 A, float3 B, out float3 Out)
        {
        Out = mul(A, B);
        }
        
        struct Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv2;
        };
        
        void SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(float3 _Vector3, Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float IN, out float3 OutVector3_1)
        {
        float3 _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3;
        Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(IN.AbsoluteWorldSpacePosition, _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3);
        float3 _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3;
        Unity_CrossProduct_float(_DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3, IN.WorldSpaceNormal, _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3);
        float4 _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4 = IN.uv2;
        float _Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[0];
        float _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[1];
        float _Split_99c92b6260e6490ea7a39eb613456b77_B_3_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[2];
        float _Split_99c92b6260e6490ea7a39eb613456b77_A_4_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[3];
        float2 _Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2 = float2(_Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float, _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float);
        float2 _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2;
        Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2);
        float _Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[0];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[1];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_B_3_Float = 0;
        float _Split_03c55994216049a3b33e5a5dbbdd692d_A_4_Float = 0;
        float3 _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float.xxx), _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3);
        float3 _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3;
        Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(IN.AbsoluteWorldSpacePosition, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3);
        float3 _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3;
        Unity_CrossProduct_float(IN.WorldSpaceNormal, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3, _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3);
        float2 _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2;
        Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2);
        float _Split_487845396d594ea6b15fc953f598ece2_R_1_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[0];
        float _Split_487845396d594ea6b15fc953f598ece2_G_2_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[1];
        float _Split_487845396d594ea6b15fc953f598ece2_B_3_Float = 0;
        float _Split_487845396d594ea6b15fc953f598ece2_A_4_Float = 0;
        float3 _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_R_1_Float.xxx), _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3);
        float3 _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3;
        Unity_Add_float3(_Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3, _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3);
        float _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float;
        Unity_DotProduct_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float);
        float3 _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float.xxx), _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3);
        float3 _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_G_2_Float.xxx), _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3);
        float3 _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3;
        Unity_Add_float3(_Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3, _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3);
        float _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float;
        Unity_DotProduct_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float);
        float _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float;
        Unity_Maximum_float(_DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float, _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float);
        float _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float;
        Unity_SquareRoot_float(_Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float);
        float _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float;
        Unity_Divide_float(1, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float, _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float);
        float3 _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3);
        float3 _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3);
        float4x4 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4;
        float3x3 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3;
        float2x2 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2;
        Unity_MatrixConstruction_Column_float((float4(_Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3, 1.0)), (float4(_Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3, 1.0)), (float4(IN.WorldSpaceNormal, 1.0)), float4 (0, 0, 0, 0), _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2);
        float3 _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3 = _Vector3;
        float3 _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3;
        Unity_Multiply_float3x3_float3(_MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3, _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3);
        float3 _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3 = TransformWorldToTangent(_Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3);
        OutVector3_1 = _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 NormalTS;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            UnityTexture2D _Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv0 = IN.uv0;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv2 = IN.uv2;
            float4 _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4);
            float _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3);
            float3 _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3);
            float3 _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3, _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3);
            float _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean = _UV0_UV2;
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean = _BaseUsePlanarUV;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv0 = IN.uv0;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv2 = IN.uv2;
            float4 _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3);
            float3 _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3;
            Unity_Branch_float3(_Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3);
            float3 _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3;
            Unity_Branch_float3(_Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3);
            float3 _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3);
            float _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3);
            float3 _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3);
            float3 _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3, _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3);
            float _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean = _CoverUsePlanarUV;
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_690e893d26999680a5cea3604ed0ce16;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv0 = IN.uv0;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv2 = IN.uv2;
            float4 _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNMn_690e893d26999680a5cea3604ed0ce16, _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3);
            float3 _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3);
            float3 _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3);
            float3 _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3);
            float _Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float = _ShapeHeightMapMin;
            float _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2 = float2(_Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float, _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float);
            float _Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2;
            Unity_Add_float2(_Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2, (_Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float.xx), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2);
            float _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, float2 (0, 1), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float);
            float _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3);
            float3 _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3);
            float3 _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3, _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3);
            float3 _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3);
            float _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3);
            float3 _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3);
            float3 _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3);
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_R_1_Float = IN.WorldSpaceNormal[0];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float = IN.WorldSpaceNormal[1];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_B_3_Float = IN.WorldSpaceNormal[2];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_A_4_Float = 0;
            float _Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float = _Cover_Amount;
            float _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float;
            Unity_Subtract_float(4, _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float);
            float _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float;
            Unity_Divide_float(_Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float);
            float _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.99, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
            float _Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float = _Cover_Max_Angle;
            float _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float;
            Unity_Divide_float(_Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float, 45, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float);
            float _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float;
            Unity_OneMinus_float(_Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float);
            float _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float;
            Unity_Subtract_float(_Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float, _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float);
            float _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float;
            Unity_Clamp_float(_Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float, 0, 2, _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float);
            float _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float;
            Unity_Divide_float(1, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float);
            float _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_2b888688983edd82ac250226d9378893_Out_3_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float, _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float);
            float _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
            float _Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float;
            Unity_OneMinus_float(_Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float, _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float);
            float _Split_ae16de7cacf9d0878aba1467f193d681_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_ae16de7cacf9d0878aba1467f193d681_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_ae16de7cacf9d0878aba1467f193d681_A_4_Float = 0;
            float _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float;
            Unity_Add_float(_OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float, _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float);
            float _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, 1, _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float);
            float _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float;
            Unity_Clamp_float(_Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float, 0, 1, _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float);
            float _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float, _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float);
            float _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float;
            Unity_Divide_float(_Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float);
            float _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float;
            Unity_OneMinus_float(_Divide_bacd243000beaa86b28174bd47716791_Out_2_Float, _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float);
            float _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float;
            Unity_Add_float(_OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float, -0.5, _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float);
            float _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float;
            Unity_Clamp_float(_Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float, 0, 1, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float);
            float _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float;
            Unity_Add_float(_Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float, _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float);
            float _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float;
            Unity_Clamp_float(_Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float, 0, 1, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float);
            float _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float;
            Unity_Multiply_float_float(_Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float);
            float _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float);
            float3 _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float);
            float _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float;
            Unity_Multiply_float_float(_Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float, _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float);
            float _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float;
            Unity_Clamp_float(_Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float, 0, 1, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float);
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            UnityTexture2D _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.tex, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.samplerstate, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float);
            float _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float;
            Unity_Clamp_float(_Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float, 0, 1, _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float);
            float _Split_478c00f7a374463b955f05a768c471e5_R_1_Float = IN.VertexColor[0];
            float _Split_478c00f7a374463b955f05a768c471e5_G_2_Float = IN.VertexColor[1];
            float _Split_478c00f7a374463b955f05a768c471e5_B_3_Float = IN.VertexColor[2];
            float _Split_478c00f7a374463b955f05a768c471e5_A_4_Float = IN.VertexColor[3];
            float _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_2217ca3c12141a8cb1e0c7235b369601;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv0 = IN.uv0;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv2 = IN.uv2;
            float4 _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4);
            float _Split_2f45bca363698c859e51492899bc58f8_R_1_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[0];
            float _Split_2f45bca363698c859e51492899bc58f8_G_2_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[1];
            float _Split_2f45bca363698c859e51492899bc58f8_B_3_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[2];
            float _Split_2f45bca363698c859e51492899bc58f8_A_4_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[3];
            float _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean = _USECoverHeightT;
            float _Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float = _CoverHeightMapMin;
            float _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2 = float2(_Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float, _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float);
            float _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2;
            Unity_Add_float2(_Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2, (_Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float.xx), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2);
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a;
            float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_478c00f7a374463b955f05a768c471e5_B_3_Float, _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float);
            float _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_B_3_Float, float2 (0, 1), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float);
            float _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float;
            Unity_Add_float(_Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float, _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float);
            float _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float;
            Unity_Branch_float(_Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float);
            float _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float);
            float _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float;
            Unity_Clamp_float(_Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float, 0, 1, _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float);
            float _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float);
            float _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float;
            Unity_Saturate_float(_Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float);
            float _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float);
            float _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float;
            Unity_Branch_float(_Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float, _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float);
            float3 _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxx), _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3);
            float _Split_5b2299b48b10138ea40c141b79bfe90e_R_1_Float = IN.VertexColor[0];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float = IN.VertexColor[1];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_B_3_Float = IN.VertexColor[2];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_A_4_Float = IN.VertexColor[3];
            float _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_191760c0269841999e1203612316c3e2;
            float _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float, _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblend_191760c0269841999e1203612316c3e2, _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float);
            float3 _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxx), _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3);
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.NormalTS = _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
            output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "Meta"
            Tags
            {
                "LightMode" = "Meta"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature _ EDITOR_VISUALIZATION
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD1
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_META
        #define _FOG_FRAGMENT 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord1;
             float4 texCoord2;
             float4 color;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpaceViewDirection;
             float3 TangentSpaceViewDirection;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 tangentWS : INTERP0;
             float4 texCoord0 : INTERP1;
             float4 texCoord1 : INTERP2;
             float4 texCoord2 : INTERP3;
             float4 color : INTERP4;
             float3 positionWS : INTERP5;
             float3 normalWS : INTERP6;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord1.xyzw = input.texCoord1;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord1 = input.texCoord1.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(1, _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_CrossProduct_float(float3 A, float3 B, out float3 Out)
        {
            Out = cross(A, B);
        }
        
        void Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_MatrixConstruction_Column_float (float4 M0, float4 M1, float4 M2, float4 M3, out float4x4 Out4x4, out float3x3 Out3x3, out float2x2 Out2x2)
        {
        Out4x4 = float4x4(M0.x, M1.x, M2.x, M3.x, M0.y, M1.y, M2.y, M3.y, M0.z, M1.z, M2.z, M3.z, M0.w, M1.w, M2.w, M3.w);
        Out3x3 = float3x3(M0.x, M1.x, M2.x, M0.y, M1.y, M2.y, M0.z, M1.z, M2.z);
        Out2x2 = float2x2(M0.x, M1.x, M0.y, M1.y);
        }
        
        void Unity_Multiply_float3x3_float3(float3x3 A, float3 B, out float3 Out)
        {
        Out = mul(A, B);
        }
        
        struct Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv2;
        };
        
        void SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(float3 _Vector3, Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float IN, out float3 OutVector3_1)
        {
        float3 _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3;
        Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(IN.AbsoluteWorldSpacePosition, _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3);
        float3 _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3;
        Unity_CrossProduct_float(_DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3, IN.WorldSpaceNormal, _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3);
        float4 _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4 = IN.uv2;
        float _Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[0];
        float _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[1];
        float _Split_99c92b6260e6490ea7a39eb613456b77_B_3_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[2];
        float _Split_99c92b6260e6490ea7a39eb613456b77_A_4_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[3];
        float2 _Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2 = float2(_Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float, _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float);
        float2 _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2;
        Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2);
        float _Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[0];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[1];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_B_3_Float = 0;
        float _Split_03c55994216049a3b33e5a5dbbdd692d_A_4_Float = 0;
        float3 _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float.xxx), _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3);
        float3 _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3;
        Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(IN.AbsoluteWorldSpacePosition, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3);
        float3 _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3;
        Unity_CrossProduct_float(IN.WorldSpaceNormal, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3, _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3);
        float2 _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2;
        Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2);
        float _Split_487845396d594ea6b15fc953f598ece2_R_1_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[0];
        float _Split_487845396d594ea6b15fc953f598ece2_G_2_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[1];
        float _Split_487845396d594ea6b15fc953f598ece2_B_3_Float = 0;
        float _Split_487845396d594ea6b15fc953f598ece2_A_4_Float = 0;
        float3 _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_R_1_Float.xxx), _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3);
        float3 _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3;
        Unity_Add_float3(_Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3, _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3);
        float _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float;
        Unity_DotProduct_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float);
        float3 _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float.xxx), _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3);
        float3 _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_G_2_Float.xxx), _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3);
        float3 _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3;
        Unity_Add_float3(_Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3, _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3);
        float _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float;
        Unity_DotProduct_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float);
        float _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float;
        Unity_Maximum_float(_DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float, _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float);
        float _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float;
        Unity_SquareRoot_float(_Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float);
        float _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float;
        Unity_Divide_float(1, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float, _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float);
        float3 _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3);
        float3 _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3);
        float4x4 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4;
        float3x3 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3;
        float2x2 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2;
        Unity_MatrixConstruction_Column_float((float4(_Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3, 1.0)), (float4(_Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3, 1.0)), (float4(IN.WorldSpaceNormal, 1.0)), float4 (0, 0, 0, 0), _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2);
        float3 _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3 = _Vector3;
        float3 _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3;
        Unity_Multiply_float3x3_float3(_MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3, _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3);
        float3 _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3 = TransformWorldToTangent(_Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3);
        OutVector3_1 = _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Minimum_float(float A, float B, out float Out)
        {
            Out = min(A, B);
        };
        
        void Unity_Clamp_float4(float4 In, float4 Min, float4 Max, out float4 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_cb7ded32e6af3382bbe06b62977afab6;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv0 = IN.uv0;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv2 = IN.uv2;
            float4 _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4 = IN.uv0;
            float4 _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4 = IN.uv2;
            float4 _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4;
            Unity_Branch_float4(_Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean, _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4, _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4, _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4);
            float4 _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[0];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[1];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[2];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[3];
            float2 _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float);
            float2 _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float);
            float2 _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4.xy), _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2, _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2, _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2);
            float4 _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.tex, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.samplerstate, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2) );
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.r;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_G_5_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.g;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_B_6_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.b;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_A_7_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.a;
            float _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float);
            float4 _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float.xxxx), _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4, _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4);
            float4 _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4);
            float4 _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4);
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_A_4_Float, _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float);
            float _Split_1176033144b640c6ba683d9125e797cb_R_1_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[0];
            float _Split_1176033144b640c6ba683d9125e797cb_G_2_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[1];
            float _Split_1176033144b640c6ba683d9125e797cb_B_3_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[2];
            float _Split_1176033144b640c6ba683d9125e797cb_A_4_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[3];
            float _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float;
            Unity_Saturate_float(_Split_1176033144b640c6ba683d9125e797cb_A_4_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float);
            float _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float, _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float);
            float _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float;
            Unity_Clamp_float(_Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float, 0, 1, _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float);
            float4 _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4, (_Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float.xxxx), _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4);
            float _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float);
            float _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float;
            Unity_Subtract_float(_OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float, 0.5, _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float);
            float4 _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, (_Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float.xxxx), _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4);
            float _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float;
            Unity_Subtract_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, 0.5, _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float);
            float4 _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4;
            Unity_Add_float4(_Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4, (_Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float.xxxx), _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4);
            float4 _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4;
            Unity_Saturate_float4(_Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4, _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4);
            float _Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float = _ShapeAORemapMin;
            float _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2 = float2(_Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float, _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float);
            float _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, float2 (0, 1), _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2, _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float);
            float _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4, (_Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float.xxxx), _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float);
            float _Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, (_Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float.xxxx), _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv0 = IN.uv0;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv2 = IN.uv2;
            float4 _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float);
            float4 _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float.xxxx), _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4, _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4);
            float4 _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4);
            float4 _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4);
            float _Split_01bd73a39ba6425699e8b16f120dda41_R_1_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[0];
            float _Split_01bd73a39ba6425699e8b16f120dda41_G_2_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[1];
            float _Split_01bd73a39ba6425699e8b16f120dda41_B_3_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[2];
            float _Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[3];
            float _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float;
            Unity_Saturate_float(_Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float);
            float _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float, _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float);
            float _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float;
            Unity_Clamp_float(_Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float, 0, 1, _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float);
            float4 _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4, (_Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float.xxxx), _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4);
            float _Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float = _ShapeHeightMapMin;
            float _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2 = float2(_Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float, _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float);
            float _Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2;
            Unity_Add_float2(_Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2, (_Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float.xx), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2);
            float _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, float2 (0, 1), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float);
            UnityTexture2D _Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv0 = IN.uv0;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv2 = IN.uv2;
            float4 _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4);
            float _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3);
            float3 _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3);
            float3 _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3, _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv0 = IN.uv0;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv2 = IN.uv2;
            float4 _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3);
            float3 _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3;
            Unity_Branch_float3(_Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3);
            float3 _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3;
            Unity_Branch_float3(_Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3);
            float3 _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_690e893d26999680a5cea3604ed0ce16;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv0 = IN.uv0;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv2 = IN.uv2;
            float4 _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNMn_690e893d26999680a5cea3604ed0ce16, _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4);
            float _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3);
            float3 _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3);
            float3 _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3);
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_R_1_Float = IN.WorldSpaceNormal[0];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float = IN.WorldSpaceNormal[1];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_B_3_Float = IN.WorldSpaceNormal[2];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_A_4_Float = 0;
            float _Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float = _Cover_Amount;
            float _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float;
            Unity_Subtract_float(4, _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float);
            float _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float;
            Unity_Divide_float(_Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float);
            float _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.99, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
            float _Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float = _Cover_Max_Angle;
            float _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float;
            Unity_Divide_float(_Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float, 45, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float);
            float _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float;
            Unity_OneMinus_float(_Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float);
            float _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float;
            Unity_Subtract_float(_Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float, _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float);
            float _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float;
            Unity_Clamp_float(_Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float, 0, 2, _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float);
            float _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float;
            Unity_Divide_float(1, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float);
            float _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_2b888688983edd82ac250226d9378893_Out_3_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float, _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float);
            float _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
            float _Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float;
            Unity_OneMinus_float(_Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float, _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float);
            float _Split_ae16de7cacf9d0878aba1467f193d681_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_ae16de7cacf9d0878aba1467f193d681_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_ae16de7cacf9d0878aba1467f193d681_A_4_Float = 0;
            float _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float;
            Unity_Add_float(_OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float, _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float);
            float _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, 1, _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float);
            float _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float;
            Unity_Clamp_float(_Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float, 0, 1, _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float);
            float _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float, _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float);
            float _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float;
            Unity_Divide_float(_Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float);
            float _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float;
            Unity_OneMinus_float(_Divide_bacd243000beaa86b28174bd47716791_Out_2_Float, _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float);
            float _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float;
            Unity_Add_float(_OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float, -0.5, _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float);
            float _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float;
            Unity_Clamp_float(_Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float, 0, 1, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float);
            float _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float;
            Unity_Add_float(_Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float, _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float);
            float _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float;
            Unity_Clamp_float(_Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float, 0, 1, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float);
            float _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float;
            Unity_Multiply_float_float(_Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float);
            float _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float);
            float3 _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float);
            float _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float;
            Unity_Multiply_float_float(_Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float, _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float);
            float _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float;
            Unity_Clamp_float(_Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float, 0, 1, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float);
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            UnityTexture2D _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.tex, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.samplerstate, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float);
            float _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float;
            Unity_Clamp_float(_Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float, 0, 1, _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float);
            float _Split_478c00f7a374463b955f05a768c471e5_R_1_Float = IN.VertexColor[0];
            float _Split_478c00f7a374463b955f05a768c471e5_G_2_Float = IN.VertexColor[1];
            float _Split_478c00f7a374463b955f05a768c471e5_B_3_Float = IN.VertexColor[2];
            float _Split_478c00f7a374463b955f05a768c471e5_A_4_Float = IN.VertexColor[3];
            float _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_2217ca3c12141a8cb1e0c7235b369601;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv0 = IN.uv0;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv2 = IN.uv2;
            float4 _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4);
            float _Split_2f45bca363698c859e51492899bc58f8_R_1_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[0];
            float _Split_2f45bca363698c859e51492899bc58f8_G_2_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[1];
            float _Split_2f45bca363698c859e51492899bc58f8_B_3_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[2];
            float _Split_2f45bca363698c859e51492899bc58f8_A_4_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[3];
            float _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean = _USECoverHeightT;
            float _Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float = _CoverHeightMapMin;
            float _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2 = float2(_Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float, _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float);
            float _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2;
            Unity_Add_float2(_Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2, (_Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float.xx), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2);
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a;
            float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_478c00f7a374463b955f05a768c471e5_B_3_Float, _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float);
            float _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_B_3_Float, float2 (0, 1), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float);
            float _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float;
            Unity_Add_float(_Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float, _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float);
            float _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float;
            Unity_Branch_float(_Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float);
            float _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float);
            float _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float;
            Unity_Clamp_float(_Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float, 0, 1, _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float);
            float _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float);
            float _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float;
            Unity_Saturate_float(_Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float);
            float _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float);
            float _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float;
            Unity_Branch_float(_Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float, _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float);
            float4 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4);
            float _Split_5b2299b48b10138ea40c141b79bfe90e_R_1_Float = IN.VertexColor[0];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float = IN.VertexColor[1];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_B_3_Float = IN.VertexColor[2];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_A_4_Float = IN.VertexColor[3];
            float _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_191760c0269841999e1203612316c3e2;
            float _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float, _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblend_191760c0269841999e1203612316c3e2, _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float);
            float4 _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxxx), _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4);
            float4 _Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4 = _WetColor;
            float4 _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4);
            float _Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_fbe0940e837e4d60897851822bb2478a_R_1_Float = IN.VertexColor[0];
            float _Split_fbe0940e837e4d60897851822bb2478a_G_2_Float = IN.VertexColor[1];
            float _Split_fbe0940e837e4d60897851822bb2478a_B_3_Float = IN.VertexColor[2];
            float _Split_fbe0940e837e4d60897851822bb2478a_A_4_Float = IN.VertexColor[3];
            float _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float;
            Unity_OneMinus_float(_Split_fbe0940e837e4d60897851822bb2478a_R_1_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float);
            float _Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_4455ba68b9564224b288be35609a562d_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float;
            Time_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float);
            float _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float, _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float);
            float _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float;
            Unity_Add_float(_Property_4455ba68b9564224b288be35609a562d_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float);
            float _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float;
            Unity_Add_float(_Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float);
            float _Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float;
            Unity_Add_float(_Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float);
            float4 _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4 = IN.uv2;
            float _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[0];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_G_2_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[1];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_B_3_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[2];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_A_4_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[3];
            float _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float;
            Unity_Smoothstep_float(_Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float, _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float, _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float);
            float _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float, _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float);
            float _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float;
            Unity_Clamp_float(_OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float, 0, 1, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float);
            float _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float);
            float _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float);
            float4 _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4, (_Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float.xxxx), _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4);
            float4 _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4);
            float4 Color_a00178231fee4f2282a1897e49ce9144 = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            float _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float);
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_R_1_Float = IN.VertexColor[0];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_G_2_Float = IN.VertexColor[1];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_B_3_Float = IN.VertexColor[2];
            float _Split_a91a48b076b34ce9b3510a0bb9d1b59a_A_4_Float = IN.VertexColor[3];
            float _Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float;
            Unity_Clamp_float(_Split_a91a48b076b34ce9b3510a0bb9d1b59a_R_1_Float, 0, 1, _Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float);
            float _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float;
            Unity_OneMinus_float(_Clamp_59ec374d0fb0467ab5bf3ad08c660716_Out_3_Float, _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float);
            float _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_9c94e97bad3946518d4b7af945dcb2bc_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float);
            float _Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_496f1d5416f44fdfac99c2920dfd8c4c_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float);
            float _Property_9d25835a7f5949dab1577c31f4add270_Out_0_Float = _BaseEmissionMaskIntensivity_1;
            float _Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_e3389801d77e491a8d631d39446168d0_Out_3_Float, _Property_9d25835a7f5949dab1577c31f4add270_Out_0_Float, _Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float);
            float _Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float;
            Unity_Absolute_float(_Multiply_87d94948255c45bc9723e08e423c59bd_Out_2_Float, _Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float);
            float _Property_bb3f61b2a3354ce1b20553e363c5ffd6_Out_0_Float = _BaseEmissionMaskTreshold_1;
            float _Power_42b827d609f14804948ece536aad57bc_Out_2_Float;
            Unity_Power_float(_Absolute_034d5b379ee7429bb21765efd9679f8a_Out_1_Float, _Property_bb3f61b2a3354ce1b20553e363c5ffd6_Out_0_Float, _Power_42b827d609f14804948ece536aad57bc_Out_2_Float);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.uv0 = IN.uv0;
            _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f.uv2 = IN.uv2;
            float4 _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f, _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4);
            float _Split_218e1cfd00b30984921b5fc0ec63de60_R_1_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[0];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[1];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_B_3_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[2];
            float _Split_218e1cfd00b30984921b5fc0ec63de60_A_4_Float = _PlanarNM_e51306c84cde8e84a1fb06a45d8d037f_XZ_2_Vector4[3];
            float _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float;
            Unity_OneMinus_float(_Split_218e1cfd00b30984921b5fc0ec63de60_G_2_Float, _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float);
            float _Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_aaf50a396c594edf8db214b99d7f6fb4_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float);
            float _Property_4fd9dff18d2b45919922c1b0192de38b_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_eefbdb617eb54be9aeff81e24191a7b7_Out_3_Float, _Property_4fd9dff18d2b45919922c1b0192de38b_Out_0_Float, _Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float);
            float _Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float;
            Unity_Absolute_float(_Multiply_78a1a7b60c9840cf8a53ec3374a73be5_Out_2_Float, _Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float);
            float _Property_2aa6a59a50f8487c9e33450b5233feaa_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float;
            Unity_Power_float(_Absolute_e12ab2b08d3c4607a2e28786e2679534_Out_1_Float, _Property_2aa6a59a50f8487c9e33450b5233feaa_Out_0_Float, _Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float);
            float _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float;
            Unity_OneMinus_float(_Split_2f45bca363698c859e51492899bc58f8_G_2_Float, _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float);
            float _Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_74d45231946646e9b5d9a5133f6203dc_Out_1_Float, _Branch_fda9bd987ddd4184abea950cf735e5bb_Out_3_Float, _Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float);
            float _Property_efda3c93360149b1ba2ff929571ddbc8_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_f07f32ff1d7d467bbc30849d28d662b1_Out_3_Float, _Property_efda3c93360149b1ba2ff929571ddbc8_Out_0_Float, _Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float);
            float _Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float;
            Unity_Absolute_float(_Multiply_f12b78b8b74346679b1626e82ee16a76_Out_2_Float, _Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float);
            float _Property_50e7bafa1234470e943dac3a542d987e_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float;
            Unity_Power_float(_Absolute_f21b69e186804f07bb73c8d62a64b689_Out_1_Float, _Property_50e7bafa1234470e943dac3a542d987e_Out_0_Float, _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float);
            float _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float;
            Unity_Clamp_float(_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float, 0, 1, _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float);
            float _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float;
            Unity_Lerp_float(_Power_26ab29264a3c419696211e6d032cbb58_Out_2_Float, _Power_3f9591ea85ec40809d0bc560469a6296_Out_2_Float, _Clamp_46d65c752d5b4550836921aedf9c45ed_Out_3_Float, _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float);
            float _Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float;
            Unity_Maximum_float(_Power_42b827d609f14804948ece536aad57bc_Out_2_Float, _Lerp_0b8d8ee83e614a4db9b657c783ed7d65_Out_3_Float, _Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float);
            float4 _Property_687b631aa7ff4050b442f1d4ab0df5a7_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float.xxxx), _Property_687b631aa7ff4050b442f1d4ab0df5a7_Out_0_Vector4, _Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4);
            UnityTexture2D _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float2 _Property_4b50c931f2854fc594f86015cfaf0518_Out_0_Vector2 = _NoiseTiling;
            float4 _UV_e02ab42e6a8e44d49fbad51bb7330682_Out_0_Vector4 = IN.uv0;
            float2 _Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_4b50c931f2854fc594f86015cfaf0518_Out_0_Vector2, (_UV_e02ab42e6a8e44d49fbad51bb7330682_Out_0_Vector4.xy), _Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2);
            float2 _Property_b5e141ebd466479f983fae5772389c4e_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float;
            Time_float(_TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float);
            float2 _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_b5e141ebd466479f983fae5772389c4e_Out_0_Vector2, (_TimeCustomFunction_6c3725a260d6421b8e4c5e22e0d3c397_Out_0_Float.xx), _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2);
            float2 _Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2;
            Unity_Add_float2(_Multiply_39bf21f90b71426ab3b6b586bb02318b_Out_2_Vector2, _Multiply_2bd7d082ce6848b0979087d819d91e60_Out_2_Vector2, _Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2);
            float4 _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.tex, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.samplerstate, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.GetTransformedUV(_Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2) );
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_R_4_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.r;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_G_5_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.g;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_B_6_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.b;
            float _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_A_7_Float = _SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_RGBA_0_Vector4.a;
            float2 _Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_b67b57cf905d42d29a235e6badb03130_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2);
            float2 _Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2;
            Unity_Add_float2(_Multiply_68dde59815554bb1a456fba780567006_Out_2_Vector2, float2(0.5, 0.5), _Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2);
            float4 _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.tex, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.samplerstate, _Property_9c6d3164e3a94968ba987003987a25c9_Out_0_Texture2D.GetTransformedUV(_Add_2bf41552d44345b4b2f77d594374a1c7_Out_2_Vector2) );
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_R_4_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.r;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_G_5_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.g;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_B_6_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.b;
            float _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_A_7_Float = _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_RGBA_0_Vector4.a;
            float _Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_6fed19a5b4d34729a7f81e4a704d132d_A_7_Float, _SampleTexture2D_0fb3fc23b0334880bb8de65e8fd41738_A_7_Float, _Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float);
            float _Property_78c8f587a1aa40c8bde462a067c88169_Out_0_Float = _EmissionNoiseMultiply;
            float _Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float;
            Unity_Multiply_float_float(_Minimum_910fa6e8e7c243838bf2292a16c07fbd_Out_2_Float, _Property_78c8f587a1aa40c8bde462a067c88169_Out_0_Float, _Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float);
            float _Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float;
            Unity_Clamp_float(_Multiply_1d6392c6ed84436a8877fad656365f66_Out_2_Float, 0, 1, _Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float);
            float _Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float;
            Unity_Absolute_float(_Clamp_1c215122e54f46549e2d49f39ccb09c2_Out_3_Float, _Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float);
            float _Property_37c5e5c6920648299ae9d083a948fcf5_Out_0_Float = _EmissionNoisePower;
            float _Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float;
            Unity_Power_float(_Absolute_829cd229df604003ba5fe6cb7e51e3ff_Out_1_Float, _Property_37c5e5c6920648299ae9d083a948fcf5_Out_0_Float, _Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float);
            float _Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float;
            Unity_Multiply_float_float(_Power_4151ae28310a4b008887e4a17fae31c5_Out_2_Float, 20, _Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float);
            float _Clamp_0749760111b441aaad255dac506c0480_Out_3_Float;
            Unity_Clamp_float(_Multiply_b2ec62d9a1d044e2b79aa377a3c1f408_Out_2_Float, 0.05, 1.2, _Clamp_0749760111b441aaad255dac506c0480_Out_3_Float);
            float4 _Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_fc112126f74b44bc8805a79ed4677143_Out_2_Vector4, (_Clamp_0749760111b441aaad255dac506c0480_Out_3_Float.xxxx), _Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4);
            float4 _Property_266c9174110f410fb8a1cdd7988b2a7b_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_267330b43e3c48dab2d3fab66f59ede2_Out_0_Float, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3);
            float3 _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Uv2SupportNormalSubGraph_428a883d6f61403686f219752338b094_OutVector3_1_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3);
            float3 _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_a5ddaf34e6d44a60a87f508c32a5fd22_Out_2_Vector3, _Branch_12258f3186854b278ed954987e88a935_Out_3_Vector3, _Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3);
            float3 _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7846d4e146ed43f89077a3f9c6f1f8e7_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3);
            float _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_0c77686fc9684e24849e21e4699655da_Out_0_Float, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3);
            float3 _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Uv2SupportNormalSubGraph_9f1a77e79b454f8b9e9a0413a6a59332_OutVector3_1_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3);
            float3 _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_28023890cece41bd9cc663447211ee9c_Out_2_Vector3, _Branch_0189ce9687684dfeab3b5ae446af7762_Out_3_Vector3, _Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3);
            float3 _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_5a356008a30e4382a53bfd83efa9c7e0_OutVector3_1_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3);
            float3 _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Branch_67f5c7638d5e4778bd364fdef7988198_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3);
            float3 _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_e5b5e9060517469081f385d5805197cc_Out_3_Vector3, _Branch_ca61477dd86d49a7b382a2776a0f764a_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3);
            float3 _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_8e777d136ad445ea96ef907f5a619ecf_Out_2_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxx), _Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3);
            float3 _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_0c748b7e69244126b6a11c3a9311a89c_Out_3_Vector3, _NormalBlend_ad88cb011aee478d815c87fc070c4174_Out_2_Vector3, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxx), _Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3);
            float3 _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3);
            float _DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_cd69dbf6beec4ea3bea20a1fc1a2517e_Out_3_Vector3, _Normalize_daeb6c6e415741b5b56f7e88671230e4_Out_1_Vector3, _DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float);
            float _Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float;
            Unity_Saturate_float(_DotProduct_6fbbd6c3114b4c4b83b0a78b94db84f1_Out_2_Float, _Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float);
            float _OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float;
            Unity_OneMinus_float(_Saturate_130783877c7540f6829ce2e194bdd738_Out_1_Float, _OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float);
            float _Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float;
            Unity_Absolute_float(_OneMinus_87ddd892608f485bacd37f96d0e33775_Out_1_Float, _Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float);
            float _Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float;
            Unity_Power_float(_Absolute_4849e556824a41a3879776a71c26c41d_Out_1_Float, 10, _Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float);
            float4 _Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_266c9174110f410fb8a1cdd7988b2a7b_Out_0_Vector4, (_Power_bb5b6b42cbae467c8e4bbee02e8ae6f9_Out_2_Float.xxxx), _Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4);
            float _Property_5e6002ec35c1440181016786d184ea1c_Out_0_Float = _RimLightPower;
            float4 _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_7ecc35a118214fd6bef931ca5329092e_Out_2_Vector4, (_Property_5e6002ec35c1440181016786d184ea1c_Out_0_Float.xxxx), _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4);
            float4 _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_643bb3e222804c56984ddd1d79847ca8_Out_2_Float.xxxx), _Multiply_c966ac4478a149bba1138ce96159960c_Out_2_Vector4, _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4);
            float4 _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4;
            Unity_Add_float4(_Multiply_ae9dbd4047b149c7b088b8609101a0cc_Out_2_Vector4, _Multiply_722294d20ca14ed3b6b2853e5e081213_Out_2_Vector4, _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4);
            float4 _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4;
            Unity_Clamp_float4(_Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4, float4(0, 0, 0, 0), _Add_fccbf086ae9c49219efac9205ce05321_Out_2_Vector4, _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4);
            float4 _Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, Color_a00178231fee4f2282a1897e49ce9144, _Clamp_5c4af3b29b4f4d85875d69564eba86d6_Out_3_Vector4, _Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4);
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.BaseColor = (_Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4.xyz);
            surface.Emission = (_Branch_4054341b6f7245628ac8718afc5e37a6_Out_3_Vector4.xyz);
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpaceViewDirection = GetWorldSpaceNormalizeViewDir(input.positionWS);
            float3x3 tangentSpaceTransform = float3x3(output.WorldSpaceTangent, output.WorldSpaceBiTangent, output.WorldSpaceNormal);
            output.TangentSpaceViewDirection = mul(tangentSpaceTransform, output.WorldSpaceViewDirection);
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "SceneSelectionPass"
            Tags
            {
                "LightMode" = "SceneSelectionPass"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENESELECTIONPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv2 : TEXCOORD2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float4 texCoord0;
             float4 texCoord2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0 : INTERP0;
             float4 texCoord2 : INTERP1;
             float3 positionWS : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ScenePickingPass"
            Tags
            {
                "LightMode" = "Picking"
            }
        
        // Render State
        Cull [_Cull]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENEPICKINGPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv2 : TEXCOORD2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float4 texCoord0;
             float4 texCoord2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 texCoord0 : INTERP0;
             float4 texCoord2 : INTERP1;
             float3 positionWS : INTERP2;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            // Name: <None>
            Tags
            {
                "LightMode" = "Universal2D"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_2D
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 tangentWS : INTERP0;
             float4 texCoord0 : INTERP1;
             float4 texCoord2 : INTERP2;
             float4 color : INTERP3;
             float3 positionWS : INTERP4;
             float3 normalWS : INTERP5;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _Shape_AO_Curvature_Reduction;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _VertexColorBBlendStrenght;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _RimLightPower;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _VertexColorGBlendStrenght;
        float4 _BaseColor;
        float _ShapeNormalStrenght_1;
        float _LeaksSmoothnessMultiply_1;
        float _BaseEmissionMaskIntensivity;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float4 _BaseColorMap_TexelSize;
        float _Shape_UV0_UV2;
        float _BaseUsePlanarUV;
        float _Cover_UV0_UV2;
        float _UV0_UV2;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _CoverLeaksColorMultiply;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float _CoverUsePlanarUV;
        float4 _CoverTilingOffset;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _WetColor;
        float _WetSmoothness;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _USECoverHeightT;
        float _LeaksSmoothnessMultiply;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _Alpha_Clip_Threshold;
        float _Shape_Normal_Blend_Hardness;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(1, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(1, _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_CrossProduct_float(float3 A, float3 B, out float3 Out)
        {
            Out = cross(A, B);
        }
        
        void Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(float3 In, out float3 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDY' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddy(In);
        }
        
        void Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(float2 In, out float2 Out)
        {
            
                    #if defined(SHADER_STAGE_RAY_TRACING) && defined(RAYTRACING_SHADER_GRAPH_DEFAULT)
                    #error 'DDX' node is not supported in ray tracing, please provide an alternate implementation, relying for instance on the 'Raytracing Quality' keyword
                    #endif
            Out = ddx(In);
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_MatrixConstruction_Column_float (float4 M0, float4 M1, float4 M2, float4 M3, out float4x4 Out4x4, out float3x3 Out3x3, out float2x2 Out2x2)
        {
        Out4x4 = float4x4(M0.x, M1.x, M2.x, M3.x, M0.y, M1.y, M2.y, M3.y, M0.z, M1.z, M2.z, M3.z, M0.w, M1.w, M2.w, M3.w);
        Out3x3 = float3x3(M0.x, M1.x, M2.x, M0.y, M1.y, M2.y, M0.z, M1.z, M2.z);
        Out2x2 = float2x2(M0.x, M1.x, M0.y, M1.y);
        }
        
        void Unity_Multiply_float3x3_float3(float3x3 A, float3 B, out float3 Out)
        {
        Out = mul(A, B);
        }
        
        struct Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv2;
        };
        
        void SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(float3 _Vector3, Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float IN, out float3 OutVector3_1)
        {
        float3 _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3;
        Unity_DDX_b639a5b8b788400bb3c2f0d8eb430e35_float3(IN.AbsoluteWorldSpacePosition, _DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3);
        float3 _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3;
        Unity_CrossProduct_float(_DDX_b639a5b8b788400bb3c2f0d8eb430e35_Out_1_Vector3, IN.WorldSpaceNormal, _CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3);
        float4 _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4 = IN.uv2;
        float _Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[0];
        float _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[1];
        float _Split_99c92b6260e6490ea7a39eb613456b77_B_3_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[2];
        float _Split_99c92b6260e6490ea7a39eb613456b77_A_4_Float = _UV_d9a70ccd5fcf4e4990413f02e8fe26ab_Out_0_Vector4[3];
        float2 _Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2 = float2(_Split_99c92b6260e6490ea7a39eb613456b77_R_1_Float, _Split_99c92b6260e6490ea7a39eb613456b77_G_2_Float);
        float2 _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2;
        Unity_DDY_533b824504ca4050af721a2d2b333ff2_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2);
        float _Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[0];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float = _DDY_533b824504ca4050af721a2d2b333ff2_Out_1_Vector2[1];
        float _Split_03c55994216049a3b33e5a5dbbdd692d_B_3_Float = 0;
        float _Split_03c55994216049a3b33e5a5dbbdd692d_A_4_Float = 0;
        float3 _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_R_1_Float.xxx), _Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3);
        float3 _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3;
        Unity_DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_float3(IN.AbsoluteWorldSpacePosition, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3);
        float3 _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3;
        Unity_CrossProduct_float(IN.WorldSpaceNormal, _DDY_4e5366aaa0904cbfa0963d6b1b24d5f5_Out_1_Vector3, _CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3);
        float2 _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2;
        Unity_DDX_e551097cc15f4eb2978922a7d64e94c8_float2(_Vector2_08aff95e212d43e79a3560ce0348d464_Out_0_Vector2, _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2);
        float _Split_487845396d594ea6b15fc953f598ece2_R_1_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[0];
        float _Split_487845396d594ea6b15fc953f598ece2_G_2_Float = _DDX_e551097cc15f4eb2978922a7d64e94c8_Out_1_Vector2[1];
        float _Split_487845396d594ea6b15fc953f598ece2_B_3_Float = 0;
        float _Split_487845396d594ea6b15fc953f598ece2_A_4_Float = 0;
        float3 _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_R_1_Float.xxx), _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3);
        float3 _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3;
        Unity_Add_float3(_Multiply_434364a578a44f0d89d1fea7937cf71b_Out_2_Vector3, _Multiply_e84e3b6ecc514f7fae7e6288057d00c8_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3);
        float _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float;
        Unity_DotProduct_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, _DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float);
        float3 _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_7b9679576d6d4c99a4444ee3fa8d39b1_Out_2_Vector3, (_Split_03c55994216049a3b33e5a5dbbdd692d_G_2_Float.xxx), _Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3);
        float3 _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3;
        Unity_Multiply_float3_float3(_CrossProduct_76e5f8d57c0a476eacd5646d4085237e_Out_2_Vector3, (_Split_487845396d594ea6b15fc953f598ece2_G_2_Float.xxx), _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3);
        float3 _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3;
        Unity_Add_float3(_Multiply_21eefb1e582e4093babc08d017a219e5_Out_2_Vector3, _Multiply_90326461593c43d1b391b8fef73656fa_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3);
        float _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float;
        Unity_DotProduct_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float);
        float _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float;
        Unity_Maximum_float(_DotProduct_fb3837ce5f5a4b588a0b7a85d1027c50_Out_2_Float, _DotProduct_1b62249bf0d644d3bcd5462e4a3d27a0_Out_2_Float, _Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float);
        float _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float;
        Unity_SquareRoot_float(_Maximum_4adfb7073c534696b393b532b4c14061_Out_2_Float, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float);
        float _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float;
        Unity_Divide_float(1, _SquareRoot_af8c759cdeef4a94909961beeabc6741_Out_1_Float, _Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float);
        float3 _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_6a02c663b2024a4fb597aa5bbe8b9676_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3);
        float3 _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Add_502656c461634de882d7eee2512f51ba_Out_2_Vector3, (_Divide_373d5df36b68407a8d57622a88c7a988_Out_2_Float.xxx), _Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3);
        float4x4 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4;
        float3x3 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3;
        float2x2 _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2;
        Unity_MatrixConstruction_Column_float((float4(_Multiply_0b4da502b7d94702878580d297ad84f3_Out_2_Vector3, 1.0)), (float4(_Multiply_0e64f4d4a90747c7bf60e6db28bd99e3_Out_2_Vector3, 1.0)), (float4(IN.WorldSpaceNormal, 1.0)), float4 (0, 0, 0, 0), _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var4x4_4_Matrix4, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var2x2_6_Matrix2);
        float3 _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3 = _Vector3;
        float3 _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3;
        Unity_Multiply_float3x3_float3(_MatrixConstruction_d7aa76c40cce478bb51e14b889f85dec_var3x3_5_Matrix3, _Property_775d9e3b7eee474ba700c4e9f7bfc7f8_Out_0_Vector3, _Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3);
        float3 _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3 = TransformWorldToTangent(_Multiply_685f5c7593e54c278c66c636eaae0674_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_9a885d52d5ad49788843b84338183297_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3);
        OutVector3_1 = _Clamp_10a25164ac38440fb9fd6d4eaac42d2e_Out_3_Vector3;
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_cb7ded32e6af3382bbe06b62977afab6;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv0 = IN.uv0;
            _PlanarNM_cb7ded32e6af3382bbe06b62977afab6.uv2 = IN.uv2;
            float4 _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6, _PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_cb7ded32e6af3382bbe06b62977afab6_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4 = IN.uv0;
            float4 _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4 = IN.uv2;
            float4 _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4;
            Unity_Branch_float4(_Property_8273b0971e9d4b00bbe48b8503b939f8_Out_0_Boolean, _UV_47c2bbff8e4240399ceaf1e94bbb407d_Out_0_Vector4, _UV_0364eff85dda4e97a1a5eeb66d108ee2_Out_0_Vector4, _Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4);
            float4 _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[0];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[1];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[2];
            float _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float = _Property_6eca6e19c70c40089a34f00e2a10608d_Out_0_Vector4[3];
            float2 _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_R_1_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_G_2_Float);
            float2 _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2 = float2(_Split_4651b82d0f234f2eb6caf4849d5e3533_B_3_Float, _Split_4651b82d0f234f2eb6caf4849d5e3533_A_4_Float);
            float2 _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_30225d62b17447aa9ee649b43def1705_Out_3_Vector4.xy), _Vector2_2089990aa0d84302b74c3a7eb16c9567_Out_0_Vector2, _Vector2_c50d600d0ca4446ebb22785f1ab33120_Out_0_Vector2, _TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2);
            float4 _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.tex, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.samplerstate, _Property_bfd6d4b6a09b4e84ab93a4a8b7545496_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_202bd6a74e1c4de499c9922b82bb6ebb_Out_3_Vector2) );
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.r;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_G_5_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.g;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_B_6_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.b;
            float _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_A_7_Float = _SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_RGBA_0_Vector4.a;
            float _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float);
            float4 _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_c5de4d149b0d4790807e359338b3ba9a_Out_1_Float.xxxx), _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4, _Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4);
            float4 _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_77e0417661444d9e8d1613a4a00cb8b3_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4);
            float4 _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_d9d24002947a4e3691a916441de06fb8_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4);
            UnityTexture2D _Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_d6c21388867743cbb038354c682258cf;
            _PlanarNM_d6c21388867743cbb038354c682258cf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv0 = IN.uv0;
            _PlanarNM_d6c21388867743cbb038354c682258cf.uv2 = IN.uv2;
            float4 _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_6fa4b5c7484f4a56ba983981de35115a_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNM_d6c21388867743cbb038354c682258cf, _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4);
            float _Split_ad71421309d14972b06eed6283d64ef9_R_1_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[0];
            float _Split_ad71421309d14972b06eed6283d64ef9_G_2_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[1];
            float _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[2];
            float _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float = _PlanarNM_d6c21388867743cbb038354c682258cf_XZ_2_Vector4[3];
            float _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_A_4_Float, _OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float);
            float _Split_1176033144b640c6ba683d9125e797cb_R_1_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[0];
            float _Split_1176033144b640c6ba683d9125e797cb_G_2_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[1];
            float _Split_1176033144b640c6ba683d9125e797cb_B_3_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[2];
            float _Split_1176033144b640c6ba683d9125e797cb_A_4_Float = _Property_0c3ae1bc47bd4aeaa00582c504bb5e46_Out_0_Vector4[3];
            float _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float;
            Unity_Saturate_float(_Split_1176033144b640c6ba683d9125e797cb_A_4_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float);
            float _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_d8ac70d5dc9c4096a85e44a59bb06113_Out_1_Float, _Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float);
            float _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float;
            Unity_Clamp_float(_Multiply_fcfed9d37eaa45589c4469692e88cde0_Out_2_Float, 0, 1, _Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float);
            float4 _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_dec7cb1e2e334d9da9cc3c4a44f04b3b_Out_2_Vector4, (_Clamp_70f793fef74f42168f827d2a2c91757d_Out_3_Float.xxxx), _Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4);
            float _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float;
            Unity_OneMinus_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, _OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float);
            float _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float;
            Unity_Subtract_float(_OneMinus_e3f7e9a2912f4308a76360ae12e161db_Out_1_Float, 0.5, _Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float);
            float4 _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, (_Subtract_aa3abf2eaa9c4101bca7c4dc162a76ae_Out_2_Float.xxxx), _Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4);
            float _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float;
            Unity_Subtract_float(_Split_ad71421309d14972b06eed6283d64ef9_R_1_Float, 0.5, _Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float);
            float4 _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4;
            Unity_Add_float4(_Subtract_af8433866d284758b067bbffb91b8dac_Out_2_Vector4, (_Subtract_00fc567632c54e86b137dd96deaf61ec_Out_2_Float.xxxx), _Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4);
            float4 _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4;
            Unity_Saturate_float4(_Add_bcf16c628e7942feb3ddcffd8d42b11e_Out_2_Vector4, _Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4);
            float _Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float = _ShapeAORemapMin;
            float _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2 = float2(_Property_7bce2ecac26a4e60a9fc4e8f2202a9bf_Out_0_Float, _Property_f46d9b575a3e4031818d519ffd4894de_Out_0_Float);
            float _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_G_2_Float, float2 (0, 1), _Vector2_8c5ba7c9193a455998f52f64384d4869_Out_0_Vector2, _Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float);
            float _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_a2a2190d139c4db68819ba1abc0cbb47_Out_1_Vector4, (_Remap_90fcd5f2119148b6a12196c76c592899_Out_3_Float.xxxx), _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, _Property_8aac2a04e758424cbb50587b21ce85e2_Out_0_Float);
            float _Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_fbb5bd88378e4a43a5c31ac4426a0c4f_Out_3_Vector4, _Blend_f1634d6bf69f464aab063de7a6dcacf1_Out_2_Vector4, (_Property_bed2f9de6c3e4ad3bc7fb0c4aceab5ba_Out_0_Float.xxxx), _Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv0 = IN.uv0;
            _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b.uv2 = IN.uv2;
            float4 _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b, _PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_e00e057d3d7c4181b1c7775c6ebbab5b_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float, _OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float);
            float4 _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_9066d4a8795f4e8ab5f33c773e4ed33d_Out_1_Float.xxxx), _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4, _Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4);
            float4 _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_396b93fe15bb421db8a844b73d131b05_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_9eeace37a6e548078b33e3ecbcec4352_R_4_Float.xxxx), _Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4);
            float4 _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_a449ce1bb05647be899254bd9d8ad5c7_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4);
            float _Split_01bd73a39ba6425699e8b16f120dda41_R_1_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[0];
            float _Split_01bd73a39ba6425699e8b16f120dda41_G_2_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[1];
            float _Split_01bd73a39ba6425699e8b16f120dda41_B_3_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[2];
            float _Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float = _Property_d2533208d6034a15bc4b0c328670cdc1_Out_0_Vector4[3];
            float _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float;
            Unity_Saturate_float(_Split_01bd73a39ba6425699e8b16f120dda41_A_4_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float);
            float _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2f31d37aa2694d71aba289c04d679fa6_Out_1_Float, _Saturate_380b749757b44db48274b3374a60b590_Out_1_Float, _Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float);
            float _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float;
            Unity_Clamp_float(_Multiply_da006de978ff48e9bdbd68059dd44790_Out_2_Float, 0, 1, _Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float);
            float4 _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_9ca8347f96984744865e24bb87f05319_Out_2_Vector4, (_Clamp_7c8fef75ce59434d84cdeeddb24ec71b_Out_3_Float.xxxx), _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4);
            float _Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float = _ShapeHeightMapMin;
            float _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2 = float2(_Property_44eeecb9f2ab432db530c7541a1fed0d_Out_0_Float, _Property_8e617b4afd15425b86f0447954ce5d33_Out_0_Float);
            float _Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2;
            Unity_Add_float2(_Vector2_15e810fc7f924e04b3220dabc8c0b872_Out_0_Vector2, (_Property_a16c0306e71a4366a2c32f1ba11bab23_Out_0_Float.xx), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2);
            float _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float;
            Unity_Remap_float(_Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, float2 (0, 1), _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float);
            UnityTexture2D _Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv0 = IN.uv0;
            _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54.uv2 = IN.uv2;
            float4 _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1510944e73e34014a8a22cfeaf403666_Out_0_Texture2D, _Property_cf9bd633cdce48228dc78138080e2fcf_Out_0_Vector4, _Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54, _PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4);
            float _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_dcf240d90b5244dc8c51c8c8e1bf3e54_XZ_2_Vector4.xyz), _Property_eebbc024bf934c2992af03ee8ca81290_Out_0_Float, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3);
            float3 _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3;
            Unity_Branch_float3(_Property_87b4a66e84524103a8df53fcc9ba88ba_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Uv2SupportNormalSubGraph_71744464789847d991031eb7c00ff115_OutVector3_1_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3);
            float3 _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3;
            Unity_Branch_float3(_Property_23f4b71bc8224ce2971421243d91ed27_Out_0_Boolean, _NormalStrength_278d2a61a0e04ab18fc5edb9a7e1dede_Out_2_Vector3, _Branch_6e1396b821be4c74ae9bc8f939225cf5_Out_3_Vector3, _Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv0 = IN.uv0;
            _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf.uv2 = IN.uv2;
            float4 _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf, _PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_ecad9f1f260c6c8bbd0960b2a8976daf_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3);
            float3 _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3;
            Unity_Branch_float3(_Property_122c0f9ef0a1c4818a140c75e512abe4_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_f0943615ef0849bea143008b70790ce7_OutVector3_1_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3);
            float3 _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3;
            Unity_Branch_float3(_Property_679f0bf5492b4dbea1c9b2341095cde3_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_ffc7533c179e4764b75f2827fbc469f4_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3);
            float3 _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_7e97bd59a8bc47709b36dee04579b0d1_Out_3_Vector3, _Branch_dd16b85e4a36430aa92da36525550f44_Out_3_Vector3, _NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_690e893d26999680a5cea3604ed0ce16;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv0 = IN.uv0;
            _PlanarNMn_690e893d26999680a5cea3604ed0ce16.uv2 = IN.uv2;
            float4 _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNMn_690e893d26999680a5cea3604ed0ce16, _PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4);
            float _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_690e893d26999680a5cea3604ed0ce16_XZ_2_Vector4.xyz), _Property_0fd4d87ded104c829a6110c044eaa5f2_Out_0_Float, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3);
            float3 _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3;
            Unity_Branch_float3(_Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Uv2SupportNormalSubGraph_37867d8a0bde4c9ca9aad9f8305f0f7c_OutVector3_1_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3);
            float3 _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3;
            Unity_Branch_float3(_Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, _NormalStrength_c4639a6dd3dfde85b591971db2700eaf_Out_2_Vector3, _Branch_d8ea5c002be14d9d96c6b6572e338284_Out_3_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3);
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_R_1_Float = IN.WorldSpaceNormal[0];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float = IN.WorldSpaceNormal[1];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_B_3_Float = IN.WorldSpaceNormal[2];
            float _Split_8ff22a6bdd437780ac7ea5963e1c5bb4_A_4_Float = 0;
            float _Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float = _Cover_Amount;
            float _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float;
            Unity_Subtract_float(4, _Property_7749c0d5b28c14869ab3ba35d226788b_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float);
            float _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float;
            Unity_Divide_float(_Property_28052b023ac35c8e9a95b30327681cc5_Out_0_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float);
            float _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_c7499cf07bdd0582abd82adbf367b0fc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.99, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
            float _Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float = _Cover_Max_Angle;
            float _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float;
            Unity_Divide_float(_Property_58f42b34c7f0728f8c98e00a3e3a5726_Out_0_Float, 45, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float);
            float _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float;
            Unity_OneMinus_float(_Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float);
            float _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float;
            Unity_Subtract_float(_Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float, _OneMinus_8e6f5b1570dc8c8b8afb036328281675_Out_1_Float, _Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float);
            float _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float;
            Unity_Clamp_float(_Subtract_5348fb3702fea78d9ee10dbf81ede29c_Out_2_Float, 0, 2, _Clamp_2b888688983edd82ac250226d9378893_Out_3_Float);
            float _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float;
            Unity_Divide_float(1, _Divide_b785767ecc1928889893fa60eac4e5fb_Out_2_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float);
            float _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_2b888688983edd82ac250226d9378893_Out_3_Float, _Divide_5615f16c20214d888a2e727ff7c5f5ff_Out_2_Float, _Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float);
            float _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_b91ed8e326de8f88bf52e49cc5f641d4_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
            float _Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float;
            Unity_OneMinus_float(_Property_b66201e787ab7b83a55abc6ddd3fe1fd_Out_0_Float, _OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float);
            float _Split_ae16de7cacf9d0878aba1467f193d681_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_ae16de7cacf9d0878aba1467f193d681_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_ae16de7cacf9d0878aba1467f193d681_A_4_Float = 0;
            float _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float;
            Unity_Add_float(_OneMinus_87c740d245de388db4fe5f4958de0668_Out_1_Float, _Split_ae16de7cacf9d0878aba1467f193d681_G_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float);
            float _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, 1, _Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float);
            float _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float;
            Unity_Clamp_float(_Add_448f30a2cd792b868416a253a1c502bb_Out_2_Float, 0, 1, _Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float);
            float _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float;
            Unity_Add_float(_Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Property_98b8c0fc7e8f9b88b8d7d9dd28ed8aca_Out_0_Float, _Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float);
            float _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float;
            Unity_Divide_float(_Add_0edbe9f424de6d8089b453804bc6ec74_Out_2_Float, _Add_9d6e1dd03919c88bb01e77a9a2b6b59c_Out_2_Float, _Divide_bacd243000beaa86b28174bd47716791_Out_2_Float);
            float _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float;
            Unity_OneMinus_float(_Divide_bacd243000beaa86b28174bd47716791_Out_2_Float, _OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float);
            float _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float;
            Unity_Add_float(_OneMinus_dd51a0c56dbb9b8b8882c6d36bfadd50_Out_1_Float, -0.5, _Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float);
            float _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float;
            Unity_Clamp_float(_Add_58dd4a9dfd5655818255c74dd17921da_Out_2_Float, 0, 1, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float);
            float _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float;
            Unity_Add_float(_Clamp_53d91568d0627d8a9cac8deecdd003a8_Out_3_Float, _Clamp_5b36f07b81ef6f87a93aefa8fcb815b4_Out_3_Float, _Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float);
            float _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float;
            Unity_Clamp_float(_Add_5ef49a57de2cdf85b0e894bfa07f6f14_Out_2_Float, 0, 1, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float);
            float _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float;
            Unity_Multiply_float_float(_Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float, _Clamp_130844801cc2148bb64804d2328686eb_Out_3_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float);
            float _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float);
            float3 _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_349fa98b1b054be68f48b717b7664476_Out_2_Vector3, _Branch_ec95a44b38724f049de769441b12e9b0_Out_3_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_d583fb35b7a2838399ae5ff4e71be918_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float);
            float _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float;
            Unity_Multiply_float_float(_Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Saturate_7d9ef12c89ff4db0a5780075cd4387f2_Out_1_Float, _Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float);
            float _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float;
            Unity_Clamp_float(_Multiply_c6d2f2fe70a34cfab8c0588f986c3cbb_Out_2_Float, 0, 1, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float);
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            UnityTexture2D _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.tex, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.samplerstate, _Property_7bea2d9dd5651a8bbbd61ecde71faa54_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Clamp_eb64ae251f024ecbad9e7d58c610da09_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float);
            float _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float;
            Unity_Clamp_float(_Branch_a9b8c239ef7a47eb9253db4a8b825625_Out_3_Float, 0, 1, _Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float);
            float _Split_478c00f7a374463b955f05a768c471e5_R_1_Float = IN.VertexColor[0];
            float _Split_478c00f7a374463b955f05a768c471e5_G_2_Float = IN.VertexColor[1];
            float _Split_478c00f7a374463b955f05a768c471e5_B_3_Float = IN.VertexColor[2];
            float _Split_478c00f7a374463b955f05a768c471e5_A_4_Float = IN.VertexColor[3];
            float _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_2217ca3c12141a8cb1e0c7235b369601;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv0 = IN.uv0;
            _PlanarNM_2217ca3c12141a8cb1e0c7235b369601.uv2 = IN.uv2;
            float4 _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_bd9dfe8dd615798f9f2d72d139e56d61_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_6f1bc4021e9643b087d3d5cbe57affbf_Out_0_Boolean, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601, _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4);
            float _Split_2f45bca363698c859e51492899bc58f8_R_1_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[0];
            float _Split_2f45bca363698c859e51492899bc58f8_G_2_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[1];
            float _Split_2f45bca363698c859e51492899bc58f8_B_3_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[2];
            float _Split_2f45bca363698c859e51492899bc58f8_A_4_Float = _PlanarNM_2217ca3c12141a8cb1e0c7235b369601_XZ_2_Vector4[3];
            float _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean = _USECoverHeightT;
            float _Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float = _CoverHeightMapMin;
            float _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2 = float2(_Property_59393a9092253f85bdd6477bb48b97a3_Out_0_Float, _Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float);
            float _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2;
            Unity_Add_float2(_Vector2_cc07b5739195718a8f1abf758fd3895d_Out_0_Vector2, (_Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float.xx), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2);
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a;
            float _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_478c00f7a374463b955f05a768c471e5_B_3_Float, _Property_4cf411358e9e4391b9381b53d038d74f_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a, _ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float);
            float _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float;
            Unity_Remap_float(_Split_2f45bca363698c859e51492899bc58f8_B_3_Float, float2 (0, 1), _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float);
            float _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float;
            Unity_Add_float(_Property_5e9012169fcc4b8ba0afc11db3fcbc79_Out_0_Float, _Property_d0361fef25abd487bc2af0a037b790b0_Out_0_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float);
            float _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float;
            Unity_Branch_float(_Property_81f5c41993dc4c9399333692f76d4e5b_Out_0_Boolean, _Remap_9bc1ac14fd08c88d895af8a17f227b08_Out_3_Float, _Add_e9642a07198c4e58911d6f616f12583f_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_105bdfc3573f47d49b8ef4b525e5513a_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_19af4fca3ea944589040cd04e1ea9da5_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float);
            float _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float;
            Unity_Branch_float(_Property_8666b3dbbd8e4d74a2ee0584453e3113_Out_0_Boolean, _Remap_16ba595994a145c0b0e2c62499f4e590_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float);
            float _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float;
            Unity_Clamp_float(_Branch_6ff6ee54b38e438890d419d4429bc9b4_Out_3_Float, 0, 1, _Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float);
            float _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float;
            Unity_Multiply_float_float(_ShapeHeighblendCoverSlope_65a42319b43a4f2d832dddc150b1ed0a_OutVector1_1_Float, _Branch_264c3af0fd634c39a08fca5d8d6a557e_Out_3_Float, _Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float);
            float _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float;
            Unity_Saturate_float(_Multiply_5e2e77ea3f954c39a0e4152471f43f24_Out_2_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float);
            float _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1e6fa04cc341fd81a68153ee61690d70_Out_3_Float, _Saturate_b12f7d1ba62a416bbaf1689548fcd9d4_Out_1_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float);
            float _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float;
            Unity_Branch_float(_Property_c57c142968c97983b1272ffdf1faf5d0_Out_0_Boolean, _Clamp_558e0a14d98517859fa2c92783d07179_Out_3_Float, _Multiply_52f785fd41694386a7628427b61176be_Out_2_Float, _Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float);
            float4 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_1f4bc608d7774e49af7d228a63a8fb7b_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_Branch_58a3faa11016ed8eb7a35e1c2b560b6d_Out_3_Float.xxxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4);
            float _Split_5b2299b48b10138ea40c141b79bfe90e_R_1_Float = IN.VertexColor[0];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float = IN.VertexColor[1];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_B_3_Float = IN.VertexColor[2];
            float _Split_5b2299b48b10138ea40c141b79bfe90e_A_4_Float = IN.VertexColor[3];
            float _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_191760c0269841999e1203612316c3e2;
            float _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_5b2299b48b10138ea40c141b79bfe90e_G_2_Float, _Property_4cabe593bbb84c73843cdb4e573d029d_Out_0_Float, _Split_ad71421309d14972b06eed6283d64ef9_B_3_Float, _Property_cfb1e40f3d7b48d09e6c2a490d0af055_Out_0_Boolean, _Split_2f45bca363698c859e51492899bc58f8_B_3_Float, _Property_b50735b5f62b4d62a1f9d29711e84d25_Out_0_Boolean, _Add_56e0f1fcb2e5438f944bf69cddd63e73_Out_2_Vector2, _Add_e4dffd9fb9e31a86aead3b2aa9d072cb_Out_2_Vector2, _ShapeHeighblend_191760c0269841999e1203612316c3e2, _ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float);
            float4 _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector4, _Lerp_00bdae97ce9d4c35a5d5e499f57748d8_Out_3_Vector4, (_ShapeHeighblend_191760c0269841999e1203612316c3e2_OutVector1_1_Float.xxxx), _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4);
            float4 _Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4 = _WetColor;
            float4 _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_b3a0f629ac3f4c84be44eb113c15ef93_Out_0_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4);
            float _Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_fbe0940e837e4d60897851822bb2478a_R_1_Float = IN.VertexColor[0];
            float _Split_fbe0940e837e4d60897851822bb2478a_G_2_Float = IN.VertexColor[1];
            float _Split_fbe0940e837e4d60897851822bb2478a_B_3_Float = IN.VertexColor[2];
            float _Split_fbe0940e837e4d60897851822bb2478a_A_4_Float = IN.VertexColor[3];
            float _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float;
            Unity_OneMinus_float(_Split_fbe0940e837e4d60897851822bb2478a_R_1_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float);
            float _Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_4455ba68b9564224b288be35609a562d_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float;
            Time_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float);
            float _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_2ddb5757433f4763a8ae388a28e988ef_Out_0_Float, _Property_e668b45035d14d28bdece1edf1bc8671_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float);
            float _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float;
            Unity_Add_float(_Property_4455ba68b9564224b288be35609a562d_Out_0_Float, _Multiply_43314687099b40e38a1700ca12bb103e_Out_2_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float);
            float _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float;
            Unity_Add_float(_Property_1ee43bbd6bf84b3eb29d4848f1bb1788_Out_0_Float, _Add_cac7ddebab9246d1aec653c1b6485f67_Out_2_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float);
            float _Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float;
            Unity_Add_float(_Property_1c725a864a0f42738ac32db842fe0020_Out_0_Float, _Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float);
            float4 _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4 = IN.uv2;
            float _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[0];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_G_2_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[1];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_B_3_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[2];
            float _Split_15b914d9ff7e4bd9a02e925d46155555_A_4_Float = _UV_81e91adc24434a9382040cc54df64f61_Out_0_Vector4[3];
            float _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float;
            Unity_Smoothstep_float(_Add_e0ed9e248b7e47b099b8b17f28b43ea6_Out_2_Float, _Add_8706c286a9004b04b85ab5b4c29d3c2b_Out_2_Float, _Split_15b914d9ff7e4bd9a02e925d46155555_R_1_Float, _Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float);
            float _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_3fce21e9671c40fb97833e354343866d_Out_3_Float, _OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float);
            float _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float;
            Unity_Clamp_float(_OneMinus_3f578f1440d74c7fab7a69ac5139bf3f_Out_1_Float, 0, 1, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float);
            float _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Clamp_ae727643680c4cbc8973b0787eb72389_Out_3_Float, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float);
            float _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float;
            Unity_Branch_float(_Property_b9942c24973546af9ca7a09f264a440a_Out_0_Boolean, _Multiply_e77c1f6ba2284da99ee91424370e6ffb_Out_2_Float, _OneMinus_d2f95b5f775e4bf68e11094ba9552464_Out_1_Float, _Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float);
            float4 _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Multiply_388c575a3467b88ab4d3719bf2b02ad5_Out_2_Vector4, (_Branch_51436932c5e54581bfdaf6ae4d2d5f31_Out_3_Float.xxxx), _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4);
            float4 _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4;
            Unity_Branch_float4(_Property_445a0671afe54964a89ee782648ebfbc_Out_0_Boolean, _Lerp_9f334e8d59abc78798691219f06b2fdb_Out_3_Vector4, _Lerp_282251bb67974498bced9a1c831003c5_Out_3_Vector4, _Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4);
            float _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float = _Alpha_Clip_Threshold;
            surface.BaseColor = (_Branch_18e8b08358264e84937b820515c07a6f_Out_3_Vector4.xyz);
            surface.Alpha = _Split_ad71421309d14972b06eed6283d64ef9_A_4_Float;
            surface.AlphaClipThreshold = _Property_1196855d628c4d6398e6e127c68f40ea_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
    }
    CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
    CustomEditorForRenderPipeline "UnityEditor.ShaderGraphLitGUI" "UnityEngine.Rendering.Universal.UniversalRenderPipelineAsset"
    FallBack "Hidden/Shader Graph/FallbackError"
}