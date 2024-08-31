Shader "NatureManufacture/URP/Layered/Layered Top Cover Shape"
{
    Properties
    {
        _BaseColor("Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_BaseColorMap("Base Map", 2D) = "white" {}
        [ToggleUI]_BaseUsePlanarUV("Base Use Planar UV", Float) = 0
        [ToggleUI]_UV0_UV2("Base UV0 (T) UV2 (F)", Float) = 1
        _BaseTilingOffset("Base Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_BaseNormalMap("Base Normal Map", 2D) = "bump" {}
        _BaseNormalScale("Base Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_BaseMaskMap("Base Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _BaseMetallic("Base Metallic", Range(0, 1)) = 1
        _BaseAORemapMin("Base AO Remap Min", Range(0, 1)) = 0
        _BaseAORemapMax("Base AO Remap Max", Range(0, 1)) = 1
        _HeightMin("Height Min", Float) = 0
        _HeightMax("Height Max", Float) = 1
        _HeightOffset("Height Offset", Float) = 0
        _BaseSmoothnessRemapMin("Base Smoothness Remap Min", Range(0, 1)) = 0
        _BaseSmoothnessRemapMax("Base Smoothness Remap Max", Range(0, 1)) = 1
        [NoScaleOffset]_LayerMask("Layer Mask (R)", 2D) = "black" {}
        [ToggleUI]_Invert_Layer_Mask("Invert Layer Mask", Float) = 0
        _Height_Transition("Height Blend Transition", Range(0.001, 1)) = 1
        _Base2Color("Base 2 Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_Base2ColorMap("Base 2 Map", 2D) = "white" {}
        [ToggleUI]_Base2UsePlanarUV("Base 2 Use Planar UV", Float) = 0
        [ToggleUI]_UV0_UV2_2("Base 2 UV0 (T) UV2 (F)", Float) = 1
        _Base2TilingOffset("Base 2 Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_Base2NormalMap("Base 2 Normal Map", 2D) = "bump" {}
        _Base2NormalScale("Base 2 Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_Base2MaskMap("Base 2 Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _Base2Metallic("Base 2 Metallic", Range(0, 1)) = 1
        _Base2AORemapMin("Base 2 AO Remap Min", Range(0, 1)) = 0
        _Base2AORemapMax("Base 2 AO Remap Max", Range(0, 1)) = 1
        _HeightMin2("Height 2 Min", Float) = 0
        _HeightMax2("Height 2 Max", Float) = 1
        _HeightOffset2("Height 2 Offset", Float) = 0
        _Base2SmoothnessRemapMin("Base 2 Smoothness Remap Min", Range(0, 1)) = 0
        _Base2SmoothnessRemapMax("Base 2 Smoothness Remap Max", Range(0, 1)) = 1
        [ToggleUI]_USEDYNAMICCOVERTSTATICMASKF("Use Dynamic Cover (T) Static Mask (F)", Float) = 1
        [ToggleUI]_USECoverHeightT("Use Cover Height (T)", Float) = 1
        [NoScaleOffset]_CoverMaskA("Cover Mask (A)", 2D) = "white" {}
        _CoverMaskPower("Cover Mask Power", Range(0, 10)) = 1
        _Cover_Amount("Cover Amount", Range(0, 2)) = 0
        _Cover_Amount_Grow_Speed("Cover Amount Grow Speed", Range(0, 3)) = 3
        _Cover_Max_Angle("Cover Max Angle", Range(0.001, 90)) = 35
        _CoverHardness("Cover Hardness", Range(0, 10)) = 5
        _Cover_Min_Height("Cover Min Height", Float) = -10000
        _Cover_Min_Height_Blending("Cover Min Height Blending", Range(0, 500)) = 1
        _CoverNormalBlendHardness("Cover Normal Blend Hardness", Range(0, 8)) = 1
        _Shape_Normal_Blend_Hardness("Shape Normal Blend Hardness", Range(0, 8)) = 1
        _VertexColorGBlendStrenght("Vertex Color (G) Blend Strenght", Range(0, 100)) = 10
        _CoverBaseColor("Cover Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_CoverBaseColorMap("Cover Base Map", 2D) = "white" {}
        [ToggleUI]_CoverUsePlanarUV("Cover Use Planar UV", Float) = 0
        [ToggleUI]_Cover_UV0_UV2("Cover UV0 (T) UV2 (F)", Float) = 1
        _CoverTilingOffset("Cover Tiling Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_CoverNormalMap("Cover Normal Map", 2D) = "bump" {}
        _CoverNormalScale("Cover Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_CoverMaskMap("Cover Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _CoverMetallic("Cover Metallic", Range(0, 1)) = 1
        _CoverAORemapMin("Cover AO Remap Min", Range(0, 1)) = 0
        _CoverAORemapMax("Cover AO Remap Max", Range(0, 1)) = 1
        _CoverHeightMapMin("Cover Height Map Min", Float) = 0
        _CoverHeightMapMax("Cover Height Map Max", Float) = 1
        _CoverHeightMapOffset("Cover Height Map Offset", Float) = 0
        _CoverSmoothnessRemapMin("Cover Smoothness Remap Min", Range(0, 1)) = 0
        _CoverSmoothnessRemapMax("Cover Smoothness Remap Max", Range(0, 1)) = 1
        [ToggleUI]_Use_ShapeHeightBT_Static_MaskF("Use Shape Height (B) (T) Cover Mask (F)", Float) = 0
        [ToggleUI]_Shape_UsePlanarUV("Shape Use Planar UV", Float) = 0
        [ToggleUI]_Shape_UV0_UV2("Shape UV0 (T) UV2 (F)", Float) = 1
        _ShapeTilingOffset("Shape Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_ShapeNormal("Shape Normal", 2D) = "bump" {}
        _ShapeNormalStrenght("Shape Normal Strenght Base", Float) = 1
        _ShapeNormalStrenght_2("Shape Normal Strenght Base 2", Float) = 1
        _ShapeNormalStrenght_1("Shape Normal Strenght Cover", Float) = 0.3
        [NoScaleOffset]_ShapeCurvAOHLeaksMask("Shape Curv (R) AO (G) H (B) Leaks Mask (A)", 2D) = "white" {}
        _CurvatureBlend("Curvature Power", Range(0, 1)) = 0
        _Shape_AO_Curvature_Reduction("Shape AO Curvature Reduction", Range(0, 1)) = 0
        _ShapeAORemapMin("Base Shape AO Remap Min", Range(0, 1)) = 0
        _ShapeAORemapMax("Base Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeAORemapMin_2("Base 2 Shape AO Remap Min", Range(0, 1)) = 0
        _ShapeAORemapMax_2("Base 2 Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeAORemapMin_1("Cover Shape AO Remap Min", Range(0, 1)) = 1
        _ShapeAORemapMax_1("Cover Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeHeightMapMin("Shape Height Map Min", Float) = 0
        _ShapeHeightMapMax("Shape Height Map Max", Float) = 1
        _ShapeHeightMapOffset("Shape Height Map Offset", Float) = 0
        [ToggleUI]Leaks_UV0_UV2_1("Leaks UV0 (T) UV2 (F)", Float) = 1
        [NoScaleOffset]_LeaksR("Leaks (R)", 2D) = "white" {}
        _BaseLeaksColorMultiply("Base Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        _BaseLeaksColorMultiply_1("Base 2 Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        _CoverLeaksColorMultiply("Cover Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        _LeaksTilingOffset("Leaks Tiling and Offset", Vector) = (1, 1, 0, 0)
        _LeaksSmoothnessMultiply_1("Cover Leaks Smoothness Multiply", Range(0, 2)) = 1
        _LeaksSmoothnessMultiply_2("Base 2 Leaks Smoothness Multiply", Range(0, 2)) = 1
        _LeaksSmoothnessMultiply("Base Leaks Smoothness Multiply", Range(0, 2)) = 1
        [ToggleUI]_Wetness_T_Heat_F("Wetness (T) Heat (F)", Float) = 1
        _WetColor("Wet Color Vertex(R)", Color) = (0.7735849, 0.7735849, 0.7735849, 0)
        _WetSmoothness("Wet Smoothness Vertex(R)", Range(0, 1)) = 1
        [HDR]_LavaEmissionColor("Emission Color", Color) = (766.9961, 12.04706, 0, 0)
        _BaseEmissionMaskIntensivity("Base Emission Mask Intensivity", Range(0, 100)) = 0
        _BaseEmissionMaskTreshold("Base Emission Mask Treshold", Range(0.01, 100)) = 1
        _Base2EmissionMaskIntensivity("Base 2 Emission Mask Intensivity", Range(0, 100)) = 0
        _Base2EmissionMaskTreshold("Base 2 Emission Mask Treshold", Range(0.01, 100)) = 1
        _CoverEmissionMaskIntensivity("Cover Emission Mask Intensivity", Range(0, 100)) = 0
        _CoverEmissionMaskTreshold("Cover Emission Mask Treshold", Range(0.01, 100)) = 1
        _BaseEmissionMaskIntensivity_1("Shape Emission Mask Intensivity", Range(0, 100)) = 0
        _BaseEmissionMaskTreshold_1("Shape Emission Mask Treshold", Range(0.01, 100)) = 1
        [HDR]_RimColor("Rim Color", Color) = (766.9961, 12.04706, 0, 0)
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, 0, _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, 0, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, 1E-05, _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Subtract_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float3(float3 In, out float3 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Blend_Multiply_float3(float3 Base, float3 Blend, out float3 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
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
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
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
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
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
            float _Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv0 = IN.uv0;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv2 = IN.uv2;
            float4 _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4 = IN.uv0;
            float4 _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4 = IN.uv2;
            float4 _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4;
            Unity_Branch_float4(_Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean, _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4, _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4, _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4);
            float4 _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_be87af2fe0f049138df84c43c16f6328_R_1_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[0];
            float _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[1];
            float _Split_be87af2fe0f049138df84c43c16f6328_B_3_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[2];
            float _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[3];
            float2 _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_R_1_Float, _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float);
            float2 _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_B_3_Float, _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float);
            float2 _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4.xy), _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2, _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2, _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2);
            float4 _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.tex, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.samplerstate, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2) );
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.r;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_G_5_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.g;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_B_6_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.b;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_A_7_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.a;
            float _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float);
            float4 _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float.xxxx), _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4, _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4);
            float4 _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4);
            float4 _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4);
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            float _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float, _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float);
            float _Split_519202708581470b82d2ab05ac7a68cf_R_1_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[0];
            float _Split_519202708581470b82d2ab05ac7a68cf_G_2_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[1];
            float _Split_519202708581470b82d2ab05ac7a68cf_B_3_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[2];
            float _Split_519202708581470b82d2ab05ac7a68cf_A_4_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[3];
            float _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float;
            Unity_Saturate_float(_Split_519202708581470b82d2ab05ac7a68cf_A_4_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float);
            float _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float, _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float);
            float _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float;
            Unity_Clamp_float(_Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float, 0, 1, _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float);
            float4 _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4, (_Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float.xxxx), _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b6bb43285f18e0838565e2920c32d293;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv0 = IN.uv0;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv2 = IN.uv2;
            float4 _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_b6bb43285f18e0838565e2920c32d293, _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4);
            float _Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[0];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[1];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[2];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[3];
            float _Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float = _HeightMin;
            float _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float = _HeightMax;
            float2 _Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2 = float2(_Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float, _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float);
            float _Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float = _HeightOffset;
            float2 _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2, (_Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float.xx), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2);
            float _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float, float2 (0, 1), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float);
            UnityTexture2D _Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            float4 _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4 = _Base2TilingOffset;
            float _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean = _Base2UsePlanarUV;
            float _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean = _UV0_UV2_2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c1bb923588566183a75a0e765556574f;
            _PlanarNM_c1bb923588566183a75a0e765556574f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv0 = IN.uv0;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv2 = IN.uv2;
            float4 _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_c1bb923588566183a75a0e765556574f, _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4);
            float4 _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4 = _Base2Color;
            float4 _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4, _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4);
            float _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float);
            float4 _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4 = _BaseLeaksColorMultiply_1;
            float4 _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float.xxxx), _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4, _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4);
            float4 _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4);
            float4 _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4);
            float _Split_0f03e5552d394642ad0e560fcb603c95_R_1_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[0];
            float _Split_0f03e5552d394642ad0e560fcb603c95_G_2_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[1];
            float _Split_0f03e5552d394642ad0e560fcb603c95_B_3_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[2];
            float _Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[3];
            float _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float;
            Unity_Saturate_float(_Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float);
            float _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float, _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float);
            float _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float;
            Unity_Clamp_float(_Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float, 0, 1, _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float);
            float4 _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4, (_Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float.xxxx), _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4);
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_R_1_Float = IN.VertexColor[0];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_G_2_Float = IN.VertexColor[1];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float = IN.VertexColor[2];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_A_4_Float = IN.VertexColor[3];
            float _Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean = _Invert_Layer_Mask;
            UnityTexture2D _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            float4 _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.tex, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.samplerstate, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.r;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_G_5_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.g;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_B_6_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.b;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_A_7_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.a;
            float _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float);
            float _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float;
            Unity_Branch_float(_Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float, _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float);
            UnityTexture2D _Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv0 = IN.uv0;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv2 = IN.uv2;
            float4 _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4);
            float _Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[0];
            float _Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[1];
            float _Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[2];
            float _Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[3];
            float _Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float = _HeightMin2;
            float _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float = _HeightMax2;
            float2 _Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2 = float2(_Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float, _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float);
            float _Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float = _HeightOffset2;
            float2 _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2, (_Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float.xx), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2);
            float _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float, float2 (0, 1), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float);
            float _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float;
            Unity_Multiply_float_float(_Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float);
            float _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float;
            Unity_Multiply_float_float(_Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float);
            float _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float = _Height_Transition;
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_709e53664a4175808a76121d09d25807;
            float3 _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4.xyz), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4.xyz), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_709e53664a4175808a76121d09d25807, _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3);
            float _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float);
            float _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float;
            Unity_Subtract_float(_OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float, 0.5, _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float);
            float3 _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3;
            Unity_Subtract_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, (_Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float.xxx), _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3);
            float _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float;
            Unity_Subtract_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, 0.5, _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float);
            float3 _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3;
            Unity_Add_float3(_Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3, (_Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float.xxx), _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3);
            float3 _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3;
            Unity_Saturate_float3(_Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3, _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3);
            float _Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float = _ShapeAORemapMin;
            float _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2 = float2(_Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float, _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float);
            float _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2, _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float);
            float _Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float = _ShapeAORemapMin_2;
            float _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float = _ShapeAORemapMax_2;
            float2 _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2 = float2(_Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float, _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float);
            float _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2, _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc;
            float3 _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Remap_1c754bb1be89471b968682c019c76795_Out_3_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3);
            float _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float3 _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3;
            Unity_Blend_Multiply_float3(_Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float);
            float _Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float = _CurvatureBlend;
            float3 _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, (_Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float.xxx), _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv0 = IN.uv0;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv2 = IN.uv2;
            float4 _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float);
            float4 _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float.xxxx), _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4, _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4);
            float4 _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4);
            float4 _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4);
            float _Split_d939850bd1f04161bc06637ccd78d716_R_1_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[0];
            float _Split_d939850bd1f04161bc06637ccd78d716_G_2_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[1];
            float _Split_d939850bd1f04161bc06637ccd78d716_B_3_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[2];
            float _Split_d939850bd1f04161bc06637ccd78d716_A_4_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[3];
            float _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float;
            Unity_Saturate_float(_Split_d939850bd1f04161bc06637ccd78d716_A_4_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float);
            float _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float, _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float);
            float _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float;
            Unity_Clamp_float(_Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float, 0, 1, _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float);
            float4 _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4, (_Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float.xxxx), _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4);
            float _Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float = _ShapeHeightMapMin;
            float _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2 = float2(_Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float, _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float);
            float _Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2;
            Unity_Add_float2(_Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2, (_Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float.xx), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2);
            float _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, float2 (0, 1), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float);
            UnityTexture2D _Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv0 = IN.uv0;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv2 = IN.uv2;
            float4 _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4);
            float _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3);
            float3 _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3);
            float3 _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3, _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_692960de14d47b8dbfb207b3e9f74790;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv0 = IN.uv0;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv2 = IN.uv2;
            float4 _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3);
            float3 _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3;
            Unity_Branch_float3(_Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3);
            float3 _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3;
            Unity_Branch_float3(_Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3);
            float3 _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3, _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3);
            float _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float = _ShapeNormalStrenght_2;
            float3 _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3);
            float3 _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3);
            float3 _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3, _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3);
            UnityTexture2D _Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv0 = IN.uv0;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv2 = IN.uv2;
            float4 _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4);
            float _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float = _Base2NormalScale;
            float3 _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4.xyz), _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3);
            float3 _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3;
            Unity_Branch_float3(_Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3);
            float3 _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3;
            Unity_Branch_float3(_Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3);
            float3 _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6;
            float3 _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3);
            float _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3);
            float3 _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3);
            float3 _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3, _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2e288bef98384580aaab10e906ca8004;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv0 = IN.uv0;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv2 = IN.uv2;
            float4 _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNMn_2e288bef98384580aaab10e906ca8004, _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4);
            float _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3);
            float3 _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3;
            Unity_Branch_float3(_Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3);
            float3 _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3);
            float3 _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3);
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
            float _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.9999, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
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
            float _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
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
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float);
            float _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float, _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float);
            float _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float;
            Unity_Clamp_float(_Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float, 0, 1, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float);
            UnityTexture2D _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.tex, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.samplerstate, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float);
            float _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float;
            Unity_Clamp_float(_Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float, 0, 1, _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float);
            float _Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv0 = IN.uv0;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv2 = IN.uv2;
            float4 _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4);
            float _Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[0];
            float _Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[1];
            float _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[2];
            float _Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[3];
            float _Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float = _CoverHeightMapMin;
            float _Property_2b4b16173941968fbecea0823b164445_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2 = float2(_Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float, _Property_2b4b16173941968fbecea0823b164445_Out_0_Float);
            float _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2;
            Unity_Add_float2(_Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2, (_Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float.xx), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2);
            float _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, float2 (0, 1), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float);
            float _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float;
            Unity_Add_float(_Property_2b4b16173941968fbecea0823b164445_Out_0_Float, _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float);
            float _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float;
            Unity_Branch_float(_Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float);
            float _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float);
            float _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float;
            Unity_Clamp_float(_Branch_c4f2625143cb430381042fc94963e665_Out_3_Float, 0, 1, _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float);
            float _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float;
            Unity_Saturate_float(_Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float);
            float _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float);
            float _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float;
            Unity_Branch_float(_Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float, _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float);
            float3 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3);
            float _Split_024016837c0544d9831785fe96f214ec_R_1_Float = IN.VertexColor[0];
            float _Split_024016837c0544d9831785fe96f214ec_G_2_Float = IN.VertexColor[1];
            float _Split_024016837c0544d9831785fe96f214ec_B_3_Float = IN.VertexColor[2];
            float _Split_024016837c0544d9831785fe96f214ec_A_4_Float = IN.VertexColor[3];
            float _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2;
            float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_024016837c0544d9831785fe96f214ec_G_2_Float, _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float, _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean, _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean, _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float);
            float3 _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3);
            float4 _Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4 = _WetColor;
            float3 _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4.xyz), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3);
            float _Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_84671236d01d4966adfadf83f8f1d569_R_1_Float = IN.VertexColor[0];
            float _Split_84671236d01d4966adfadf83f8f1d569_G_2_Float = IN.VertexColor[1];
            float _Split_84671236d01d4966adfadf83f8f1d569_B_3_Float = IN.VertexColor[2];
            float _Split_84671236d01d4966adfadf83f8f1d569_A_4_Float = IN.VertexColor[3];
            float _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float;
            Unity_OneMinus_float(_Split_84671236d01d4966adfadf83f8f1d569_R_1_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float);
            float _Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_687864922a2d431dae4d25eacc436e19_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float;
            Time_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float);
            float _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float, _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float);
            float _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float;
            Unity_Add_float(_Property_687864922a2d431dae4d25eacc436e19_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float);
            float _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float;
            Unity_Add_float(_Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float);
            float _Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float;
            Unity_Add_float(_Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float);
            float4 _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4 = IN.uv2;
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[0];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_G_2_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[1];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_B_3_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[2];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_A_4_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[3];
            float _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float;
            Unity_Smoothstep_float(_Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float, _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float, _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float);
            float _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float, _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float);
            float _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float;
            Unity_Clamp_float(_OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float, 0, 1, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float);
            float _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float);
            float _Branch_36c93485b10140698831d932acfa7872_Out_3_Float;
            Unity_Branch_float(_Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Branch_36c93485b10140698831d932acfa7872_Out_3_Float);
            float3 _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3, (_Branch_36c93485b10140698831d932acfa7872_Out_3_Float.xxx), _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3);
            float3 _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            Unity_Branch_float3(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3, _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3);
            float _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3);
            float3 _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3);
            float3 _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3, _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3);
            float3 _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3);
            float3 _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3);
            float3 _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3);
            float3 _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3);
            float4 Color_4c9d480c6fdc4700b27eec94efd6d196 = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            float _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float);
            float _Property_e07dff1106094ceab44e6dbb34bda247_Out_0_Boolean = _Dynamic_Flow;
            float _Split_1d57a23557e84aa19ebba5e059647482_R_1_Float = IN.VertexColor[0];
            float _Split_1d57a23557e84aa19ebba5e059647482_G_2_Float = IN.VertexColor[1];
            float _Split_1d57a23557e84aa19ebba5e059647482_B_3_Float = IN.VertexColor[2];
            float _Split_1d57a23557e84aa19ebba5e059647482_A_4_Float = IN.VertexColor[3];
            float _Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float;
            Unity_Clamp_float(_Split_1d57a23557e84aa19ebba5e059647482_R_1_Float, 0, 1, _Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float);
            float _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float;
            Unity_OneMinus_float(_Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float, _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float);
            float _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float;
            Unity_Branch_float(_Property_e07dff1106094ceab44e6dbb34bda247_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float);
            float _Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float);
            float _Property_7650c80e23dc4080b44f42e9b71348d7_Out_0_Float = _BaseEmissionMaskIntensivity_1;
            float _Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float, _Property_7650c80e23dc4080b44f42e9b71348d7_Out_0_Float, _Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float);
            float _Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float;
            Unity_Absolute_float(_Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float, _Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float);
            float _Property_30f2a823879844dd991358fa7be7decc_Out_0_Float = _BaseEmissionMaskTreshold_1;
            float _Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float;
            Unity_Power_float(_Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float, _Property_30f2a823879844dd991358fa7be7decc_Out_0_Float, _Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float);
            float _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float;
            Unity_OneMinus_float(_Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float, _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float);
            float _Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float);
            float _Property_20272825b13c4ee5b9ab9d9b2cef4bb5_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float, _Property_20272825b13c4ee5b9ab9d9b2cef4bb5_Out_0_Float, _Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float);
            float _Absolute_8515323330844f3798e658e697d35afb_Out_1_Float;
            Unity_Absolute_float(_Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float, _Absolute_8515323330844f3798e658e697d35afb_Out_1_Float);
            float _Property_e75cc24d4db5474fa1117e352224621d_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float;
            Unity_Power_float(_Absolute_8515323330844f3798e658e697d35afb_Out_1_Float, _Property_e75cc24d4db5474fa1117e352224621d_Out_0_Float, _Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float);
            float _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float;
            Unity_OneMinus_float(_Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float, _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float);
            float _Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float);
            float _Property_23d03330130e4faa9a3d035dee2f4d45_Out_0_Float = _Base2EmissionMaskIntensivity;
            float _Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float, _Property_23d03330130e4faa9a3d035dee2f4d45_Out_0_Float, _Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float);
            float _Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float;
            Unity_Absolute_float(_Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float, _Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float);
            float _Property_cde48fe2dd424af5950a89d86cc20ec5_Out_0_Float = _Base2EmissionMaskTreshold;
            float _Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float;
            Unity_Power_float(_Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float, _Property_cde48fe2dd424af5950a89d86cc20ec5_Out_0_Float, _Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8;
            float3 _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8, _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3);
            float _Split_e22e218cdaf04706be7068474156c218_R_1_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[0];
            float _Split_e22e218cdaf04706be7068474156c218_G_2_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[1];
            float _Split_e22e218cdaf04706be7068474156c218_B_3_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[2];
            float _Split_e22e218cdaf04706be7068474156c218_A_4_Float = 0;
            float _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float;
            Unity_OneMinus_float(_Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float, _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float);
            float _Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float);
            float _Property_5ec10b66097e41748f33013e6748e45d_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float, _Property_5ec10b66097e41748f33013e6748e45d_Out_0_Float, _Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float);
            float _Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float;
            Unity_Absolute_float(_Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float, _Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float);
            float _Property_1e8e0ff314144f9884b91c35d74ca756_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float;
            Unity_Power_float(_Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float, _Property_1e8e0ff314144f9884b91c35d74ca756_Out_0_Float, _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float);
            float _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float;
            Unity_Clamp_float(_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float, 0, 1, _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float);
            float _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float;
            Unity_Lerp_float(_Split_e22e218cdaf04706be7068474156c218_R_1_Float, _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float, _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float, _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float);
            float _Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float;
            Unity_Maximum_float(_Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float, _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float, _Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float);
            float4 _Property_95626aa497ae4b55a696d133e3806dea_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float.xxxx), _Property_95626aa497ae4b55a696d133e3806dea_Out_0_Vector4, _Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4);
            UnityTexture2D _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float2 _Property_8e8cf89cf9884e639ec374d24ad26848_Out_0_Vector2 = _NoiseTiling;
            float4 _UV_e33a05f22f6b4c96934c0915b9938219_Out_0_Vector4 = IN.uv0;
            float2 _Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_8e8cf89cf9884e639ec374d24ad26848_Out_0_Vector2, (_UV_e33a05f22f6b4c96934c0915b9938219_Out_0_Vector4.xy), _Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2);
            float2 _Property_2b5b2bf858ff4e35aa531627c7092e0e_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float;
            Time_float(_TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float);
            float2 _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_2b5b2bf858ff4e35aa531627c7092e0e_Out_0_Vector2, (_TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float.xx), _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2);
            float2 _Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2;
            Unity_Add_float2(_Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2, _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2, _Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2);
            float4 _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.tex, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.samplerstate, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.GetTransformedUV(_Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2) );
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_R_4_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.r;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_G_5_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.g;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_B_6_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.b;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_A_7_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.a;
            float2 _Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2);
            float2 _Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2;
            Unity_Add_float2(_Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2, float2(0.5, 0.5), _Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2);
            float4 _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.tex, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.samplerstate, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.GetTransformedUV(_Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2) );
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_R_4_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.r;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_G_5_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.g;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_B_6_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.b;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_A_7_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.a;
            float _Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_588289679644400f83f09ec5fba25364_A_7_Float, _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_A_7_Float, _Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float);
            float _Property_2040d95977684d38a0058cd31a6487f5_Out_0_Float = _EmissionNoiseMultiply;
            float _Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float;
            Unity_Multiply_float_float(_Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float, _Property_2040d95977684d38a0058cd31a6487f5_Out_0_Float, _Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float);
            float _Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float;
            Unity_Clamp_float(_Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float, 0, 1, _Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float);
            float _Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float;
            Unity_Absolute_float(_Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float, _Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float);
            float _Property_92aa60daa2db494582a55735afa367c1_Out_0_Float = _EmissionNoisePower;
            float _Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float;
            Unity_Power_float(_Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float, _Property_92aa60daa2db494582a55735afa367c1_Out_0_Float, _Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float);
            float _Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float;
            Unity_Multiply_float_float(_Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float, 20, _Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float);
            float _Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float;
            Unity_Clamp_float(_Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float, 0.05, 1.2, _Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float);
            float4 _Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4, (_Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float.xxxx), _Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4);
            float4 _Property_ffc0adc4f1d94087a4eac79b8fa7caa3_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float3 _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3);
            float _DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3, _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3, _DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float);
            float _Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float;
            Unity_Saturate_float(_DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float, _Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float);
            float _OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float;
            Unity_OneMinus_float(_Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float, _OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float);
            float _Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float;
            Unity_Absolute_float(_OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float, _Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float);
            float _Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float;
            Unity_Power_float(_Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float, 10, _Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float);
            float4 _Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_ffc0adc4f1d94087a4eac79b8fa7caa3_Out_0_Vector4, (_Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float.xxxx), _Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4);
            float _Property_f29cf33d2b734ccd9ad0e9b6ab6a63fa_Out_0_Float = _RimLightPower;
            float4 _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4, (_Property_f29cf33d2b734ccd9ad0e9b6ab6a63fa_Out_0_Float.xxxx), _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4);
            float4 _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float.xxxx), _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4, _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4);
            float4 _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4;
            Unity_Add_float4(_Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4, _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4, _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4);
            float4 _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4;
            Unity_Clamp_float4(_Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4, float4(0, 0, 0, 0), _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4, _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4);
            float4 _Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4;
            Unity_Branch_float4(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, Color_4c9d480c6fdc4700b27eec94efd6d196, _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4, _Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4);
            float _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float = _BaseMetallic;
            float _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float;
            Unity_Multiply_float_float(_Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float, _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float, _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float);
            float _Property_8142f12b781ad08680220297dab56f14_Out_0_Float = _BaseAORemapMin;
            float _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float = _BaseAORemapMax;
            float2 _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2 = float2(_Property_8142f12b781ad08680220297dab56f14_Out_0_Float, _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float);
            float _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float, float2 (0, 1), _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float);
            float _Multiply_a26583fddce74139b1403411aa709d30_Out_2_Float;
            Unity_Multiply_float_float(_Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float, _Multiply_a26583fddce74139b1403411aa709d30_Out_2_Float);
            float _Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2 = float2(_Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float, _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float);
            float _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float, float2 (0, 1), _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float);
            float _Property_d9e78bc9f13e457a84c3fc0552bbf035_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_6f9e06e350b247b6aa648200eb6c5080_Out_2_Float;
            Unity_Multiply_float_float(_Property_d9e78bc9f13e457a84c3fc0552bbf035_Out_0_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Multiply_6f9e06e350b247b6aa648200eb6c5080_Out_2_Float);
            float _Lerp_a8e9772181d644dc941043011feaf454_Out_3_Float;
            Unity_Lerp_float(_Multiply_6f9e06e350b247b6aa648200eb6c5080_Out_2_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _Lerp_a8e9772181d644dc941043011feaf454_Out_3_Float);
            float _Lerp_6db09c4125864215b3a94026f41f8191_Out_3_Float;
            Unity_Lerp_float(_Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Lerp_a8e9772181d644dc941043011feaf454_Out_3_Float, _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float, _Lerp_6db09c4125864215b3a94026f41f8191_Out_3_Float);
            float _Clamp_112222f0345b4a98b3f1ef9926c289d1_Out_3_Float;
            Unity_Clamp_float(_Lerp_6db09c4125864215b3a94026f41f8191_Out_3_Float, 0, 1, _Clamp_112222f0345b4a98b3f1ef9926c289d1_Out_3_Float);
            float3 _Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3 = float3(_Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float, _Multiply_a26583fddce74139b1403411aa709d30_Out_2_Float, _Clamp_112222f0345b4a98b3f1ef9926c289d1_Out_3_Float);
            float _Property_da25d24e4fd2108fa3e2cae8cf268ad1_Out_0_Float = _Base2Metallic;
            float _Multiply_1a54c23c25172e89acacc2ea32718ab1_Out_2_Float;
            Unity_Multiply_float_float(_Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float, _Property_da25d24e4fd2108fa3e2cae8cf268ad1_Out_0_Float, _Multiply_1a54c23c25172e89acacc2ea32718ab1_Out_2_Float);
            float _Property_02bd8e6a672d1f8ebd2c50b4d822d29c_Out_0_Float = _Base2AORemapMin;
            float _Property_7c7a0acfa72e4a8d9e89fd92eb4fde51_Out_0_Float = _Base2AORemapMax;
            float2 _Vector2_61efe41bd1ca5283ae09f418d56dce98_Out_0_Vector2 = float2(_Property_02bd8e6a672d1f8ebd2c50b4d822d29c_Out_0_Float, _Property_7c7a0acfa72e4a8d9e89fd92eb4fde51_Out_0_Float);
            float _Remap_09fcf6edbba96e8daee966084ddc87eb_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float, float2 (0, 1), _Vector2_61efe41bd1ca5283ae09f418d56dce98_Out_0_Vector2, _Remap_09fcf6edbba96e8daee966084ddc87eb_Out_3_Float);
            float _Multiply_93b25cda97334aae9401990a509dc99a_Out_2_Float;
            Unity_Multiply_float_float(_Remap_1c754bb1be89471b968682c019c76795_Out_3_Float, _Remap_09fcf6edbba96e8daee966084ddc87eb_Out_3_Float, _Multiply_93b25cda97334aae9401990a509dc99a_Out_2_Float);
            float _Property_e93e026149f1bb888d5c7f055f55d34c_Out_0_Float = _Base2SmoothnessRemapMin;
            float _Property_9e1d05a5f3bb4687bd2a9ef8e632a88c_Out_0_Float = _Base2SmoothnessRemapMax;
            float2 _Vector2_d434b3a98fac8f88a713affdbe931846_Out_0_Vector2 = float2(_Property_e93e026149f1bb888d5c7f055f55d34c_Out_0_Float, _Property_9e1d05a5f3bb4687bd2a9ef8e632a88c_Out_0_Float);
            float _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float, float2 (0, 1), _Vector2_d434b3a98fac8f88a713affdbe931846_Out_0_Vector2, _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float);
            float _Property_43e0160a49a745528e81cca242c02173_Out_0_Float = _LeaksSmoothnessMultiply_2;
            float _Multiply_3f001064558a4d14b0e1c1fe7105c7f5_Out_2_Float;
            Unity_Multiply_float_float(_Property_43e0160a49a745528e81cca242c02173_Out_0_Float, _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float, _Multiply_3f001064558a4d14b0e1c1fe7105c7f5_Out_2_Float);
            float _Lerp_7d993e7373b44a23b010964aff3b42c8_Out_3_Float;
            Unity_Lerp_float(_Multiply_3f001064558a4d14b0e1c1fe7105c7f5_Out_2_Float, _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float, _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _Lerp_7d993e7373b44a23b010964aff3b42c8_Out_3_Float);
            float _Lerp_1013be30f625441ea0c7370fefd04d16_Out_3_Float;
            Unity_Lerp_float(_Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float, _Lerp_7d993e7373b44a23b010964aff3b42c8_Out_3_Float, _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float, _Lerp_1013be30f625441ea0c7370fefd04d16_Out_3_Float);
            float _Clamp_6933072fa87144c88dad1b47ef69cb94_Out_3_Float;
            Unity_Clamp_float(_Lerp_1013be30f625441ea0c7370fefd04d16_Out_3_Float, 0, 1, _Clamp_6933072fa87144c88dad1b47ef69cb94_Out_3_Float);
            float3 _Vector3_f4a7e19d772ca88795286111ab15ccc1_Out_0_Vector3 = float3(_Multiply_1a54c23c25172e89acacc2ea32718ab1_Out_2_Float, _Multiply_93b25cda97334aae9401990a509dc99a_Out_2_Float, _Clamp_6933072fa87144c88dad1b47ef69cb94_Out_3_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c;
            float3 _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _Vector3_f4a7e19d772ca88795286111ab15ccc1_Out_0_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c, _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c_OutVector4_1_Vector3);
            float _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float = _CoverMetallic;
            float _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float;
            Unity_Multiply_float_float(_Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float, _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float, _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float);
            float _Property_cd1da6b994394f34873db373dc072246_Out_0_Float = _ShapeAORemapMin_1;
            float _Property_6b68a3da643f44caa49599ae08f0ff2f_Out_0_Float = _ShapeAORemapMax_1;
            float2 _Vector2_59f6f01fd51c4032837a491d5168de08_Out_0_Vector2 = float2(_Property_cd1da6b994394f34873db373dc072246_Out_0_Float, _Property_6b68a3da643f44caa49599ae08f0ff2f_Out_0_Float);
            float _Remap_177cb162183d40e3b7455b2a1c10deab_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_59f6f01fd51c4032837a491d5168de08_Out_0_Vector2, _Remap_177cb162183d40e3b7455b2a1c10deab_Out_3_Float);
            float _Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float = _CoverAORemapMin;
            float _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float = _CoverAORemapMax;
            float2 _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2 = float2(_Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float, _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float);
            float _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float, float2 (0, 1), _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float);
            float _Multiply_6ef975d55e994fbb89ea57d542c7dfb4_Out_2_Float;
            Unity_Multiply_float_float(_Remap_177cb162183d40e3b7455b2a1c10deab_Out_3_Float, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float, _Multiply_6ef975d55e994fbb89ea57d542c7dfb4_Out_2_Float);
            float _Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2 = float2(_Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float, _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float);
            float _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float, float2 (0, 1), _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float);
            float _Property_f679378d9bcc4bfe84da691a2516b06d_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_30832ed98e74422fb1100a9fed9b4b37_Out_2_Float;
            Unity_Multiply_float_float(_Property_f679378d9bcc4bfe84da691a2516b06d_Out_0_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Multiply_30832ed98e74422fb1100a9fed9b4b37_Out_2_Float);
            float _Lerp_8bb4fb2e45044f44b6203d819f1741dc_Out_3_Float;
            Unity_Lerp_float(_Multiply_30832ed98e74422fb1100a9fed9b4b37_Out_2_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _Lerp_8bb4fb2e45044f44b6203d819f1741dc_Out_3_Float);
            float _Lerp_1a2effa49ae14743b89c9fdc3447022d_Out_3_Float;
            Unity_Lerp_float(_Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Lerp_8bb4fb2e45044f44b6203d819f1741dc_Out_3_Float, _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float, _Lerp_1a2effa49ae14743b89c9fdc3447022d_Out_3_Float);
            float _Clamp_541159bf2bf44f5eb797e9c7936d1566_Out_3_Float;
            Unity_Clamp_float(_Lerp_1a2effa49ae14743b89c9fdc3447022d_Out_3_Float, 0, 1, _Clamp_541159bf2bf44f5eb797e9c7936d1566_Out_3_Float);
            float3 _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3 = float3(_Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float, _Multiply_6ef975d55e994fbb89ea57d542c7dfb4_Out_2_Float, _Clamp_541159bf2bf44f5eb797e9c7936d1566_Out_3_Float);
            float3 _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d3702ea647a00788a9589b6dd2f39e3c_OutVector4_1_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3);
            float3 _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3);
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float = _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3[0];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float = _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3[1];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float = _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3[2];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_A_4_Float = 0;
            float _Property_c2c14c6e59fff685aa34dd6b96e602b1_Out_0_Float = _WetSmoothness;
            float _Lerp_d69b881388ff3d87bbdb99ca85854182_Out_3_Float;
            Unity_Lerp_float(_Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Property_c2c14c6e59fff685aa34dd6b96e602b1_Out_0_Float, _Branch_36c93485b10140698831d932acfa7872_Out_3_Float, _Lerp_d69b881388ff3d87bbdb99ca85854182_Out_3_Float);
            float _Branch_4a92b328e7494dffb77036a49f8e3028_Out_3_Float;
            Unity_Branch_float(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, _Lerp_d69b881388ff3d87bbdb99ca85854182_Out_3_Float, _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Branch_4a92b328e7494dffb77036a49f8e3028_Out_3_Float);
            surface.BaseColor = _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            surface.NormalTS = _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            surface.Emission = (_Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4.xyz);
            surface.Metallic = _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Branch_4a92b328e7494dffb77036a49f8e3028_Out_3_Float;
            surface.Occlusion = _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float;
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, 0, _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, 0, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, 1E-05, _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Subtract_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float3(float3 In, out float3 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Blend_Multiply_float3(float3 Base, float3 Blend, out float3 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
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
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
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
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
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
            float _Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv0 = IN.uv0;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv2 = IN.uv2;
            float4 _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4 = IN.uv0;
            float4 _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4 = IN.uv2;
            float4 _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4;
            Unity_Branch_float4(_Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean, _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4, _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4, _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4);
            float4 _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_be87af2fe0f049138df84c43c16f6328_R_1_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[0];
            float _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[1];
            float _Split_be87af2fe0f049138df84c43c16f6328_B_3_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[2];
            float _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[3];
            float2 _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_R_1_Float, _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float);
            float2 _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_B_3_Float, _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float);
            float2 _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4.xy), _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2, _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2, _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2);
            float4 _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.tex, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.samplerstate, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2) );
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.r;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_G_5_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.g;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_B_6_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.b;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_A_7_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.a;
            float _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float);
            float4 _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float.xxxx), _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4, _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4);
            float4 _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4);
            float4 _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4);
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            float _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float, _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float);
            float _Split_519202708581470b82d2ab05ac7a68cf_R_1_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[0];
            float _Split_519202708581470b82d2ab05ac7a68cf_G_2_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[1];
            float _Split_519202708581470b82d2ab05ac7a68cf_B_3_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[2];
            float _Split_519202708581470b82d2ab05ac7a68cf_A_4_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[3];
            float _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float;
            Unity_Saturate_float(_Split_519202708581470b82d2ab05ac7a68cf_A_4_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float);
            float _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float, _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float);
            float _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float;
            Unity_Clamp_float(_Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float, 0, 1, _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float);
            float4 _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4, (_Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float.xxxx), _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b6bb43285f18e0838565e2920c32d293;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv0 = IN.uv0;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv2 = IN.uv2;
            float4 _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_b6bb43285f18e0838565e2920c32d293, _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4);
            float _Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[0];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[1];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[2];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[3];
            float _Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float = _HeightMin;
            float _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float = _HeightMax;
            float2 _Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2 = float2(_Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float, _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float);
            float _Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float = _HeightOffset;
            float2 _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2, (_Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float.xx), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2);
            float _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float, float2 (0, 1), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float);
            UnityTexture2D _Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            float4 _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4 = _Base2TilingOffset;
            float _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean = _Base2UsePlanarUV;
            float _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean = _UV0_UV2_2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c1bb923588566183a75a0e765556574f;
            _PlanarNM_c1bb923588566183a75a0e765556574f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv0 = IN.uv0;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv2 = IN.uv2;
            float4 _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_c1bb923588566183a75a0e765556574f, _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4);
            float4 _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4 = _Base2Color;
            float4 _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4, _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4);
            float _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float);
            float4 _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4 = _BaseLeaksColorMultiply_1;
            float4 _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float.xxxx), _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4, _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4);
            float4 _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4);
            float4 _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4);
            float _Split_0f03e5552d394642ad0e560fcb603c95_R_1_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[0];
            float _Split_0f03e5552d394642ad0e560fcb603c95_G_2_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[1];
            float _Split_0f03e5552d394642ad0e560fcb603c95_B_3_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[2];
            float _Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[3];
            float _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float;
            Unity_Saturate_float(_Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float);
            float _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float, _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float);
            float _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float;
            Unity_Clamp_float(_Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float, 0, 1, _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float);
            float4 _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4, (_Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float.xxxx), _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4);
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_R_1_Float = IN.VertexColor[0];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_G_2_Float = IN.VertexColor[1];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float = IN.VertexColor[2];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_A_4_Float = IN.VertexColor[3];
            float _Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean = _Invert_Layer_Mask;
            UnityTexture2D _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            float4 _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.tex, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.samplerstate, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.r;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_G_5_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.g;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_B_6_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.b;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_A_7_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.a;
            float _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float);
            float _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float;
            Unity_Branch_float(_Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float, _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float);
            UnityTexture2D _Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv0 = IN.uv0;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv2 = IN.uv2;
            float4 _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4);
            float _Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[0];
            float _Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[1];
            float _Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[2];
            float _Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[3];
            float _Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float = _HeightMin2;
            float _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float = _HeightMax2;
            float2 _Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2 = float2(_Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float, _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float);
            float _Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float = _HeightOffset2;
            float2 _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2, (_Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float.xx), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2);
            float _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float, float2 (0, 1), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float);
            float _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float;
            Unity_Multiply_float_float(_Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float);
            float _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float;
            Unity_Multiply_float_float(_Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float);
            float _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float = _Height_Transition;
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_709e53664a4175808a76121d09d25807;
            float3 _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4.xyz), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4.xyz), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_709e53664a4175808a76121d09d25807, _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3);
            float _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float);
            float _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float;
            Unity_Subtract_float(_OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float, 0.5, _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float);
            float3 _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3;
            Unity_Subtract_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, (_Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float.xxx), _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3);
            float _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float;
            Unity_Subtract_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, 0.5, _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float);
            float3 _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3;
            Unity_Add_float3(_Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3, (_Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float.xxx), _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3);
            float3 _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3;
            Unity_Saturate_float3(_Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3, _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3);
            float _Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float = _ShapeAORemapMin;
            float _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2 = float2(_Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float, _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float);
            float _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2, _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float);
            float _Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float = _ShapeAORemapMin_2;
            float _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float = _ShapeAORemapMax_2;
            float2 _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2 = float2(_Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float, _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float);
            float _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2, _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc;
            float3 _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Remap_1c754bb1be89471b968682c019c76795_Out_3_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3);
            float _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float3 _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3;
            Unity_Blend_Multiply_float3(_Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float);
            float _Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float = _CurvatureBlend;
            float3 _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, (_Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float.xxx), _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv0 = IN.uv0;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv2 = IN.uv2;
            float4 _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float);
            float4 _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float.xxxx), _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4, _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4);
            float4 _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4);
            float4 _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4);
            float _Split_d939850bd1f04161bc06637ccd78d716_R_1_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[0];
            float _Split_d939850bd1f04161bc06637ccd78d716_G_2_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[1];
            float _Split_d939850bd1f04161bc06637ccd78d716_B_3_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[2];
            float _Split_d939850bd1f04161bc06637ccd78d716_A_4_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[3];
            float _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float;
            Unity_Saturate_float(_Split_d939850bd1f04161bc06637ccd78d716_A_4_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float);
            float _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float, _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float);
            float _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float;
            Unity_Clamp_float(_Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float, 0, 1, _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float);
            float4 _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4, (_Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float.xxxx), _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4);
            float _Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float = _ShapeHeightMapMin;
            float _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2 = float2(_Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float, _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float);
            float _Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2;
            Unity_Add_float2(_Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2, (_Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float.xx), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2);
            float _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, float2 (0, 1), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float);
            UnityTexture2D _Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv0 = IN.uv0;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv2 = IN.uv2;
            float4 _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4);
            float _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3);
            float3 _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3);
            float3 _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3, _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_692960de14d47b8dbfb207b3e9f74790;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv0 = IN.uv0;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv2 = IN.uv2;
            float4 _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3);
            float3 _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3;
            Unity_Branch_float3(_Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3);
            float3 _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3;
            Unity_Branch_float3(_Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3);
            float3 _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3, _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3);
            float _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float = _ShapeNormalStrenght_2;
            float3 _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3);
            float3 _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3);
            float3 _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3, _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3);
            UnityTexture2D _Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv0 = IN.uv0;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv2 = IN.uv2;
            float4 _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4);
            float _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float = _Base2NormalScale;
            float3 _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4.xyz), _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3);
            float3 _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3;
            Unity_Branch_float3(_Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3);
            float3 _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3;
            Unity_Branch_float3(_Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3);
            float3 _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6;
            float3 _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3);
            float _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3);
            float3 _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3);
            float3 _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3, _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2e288bef98384580aaab10e906ca8004;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv0 = IN.uv0;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv2 = IN.uv2;
            float4 _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNMn_2e288bef98384580aaab10e906ca8004, _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4);
            float _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3);
            float3 _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3;
            Unity_Branch_float3(_Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3);
            float3 _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3);
            float3 _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3);
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
            float _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.9999, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
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
            float _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
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
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float);
            float _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float, _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float);
            float _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float;
            Unity_Clamp_float(_Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float, 0, 1, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float);
            UnityTexture2D _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.tex, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.samplerstate, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float);
            float _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float;
            Unity_Clamp_float(_Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float, 0, 1, _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float);
            float _Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv0 = IN.uv0;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv2 = IN.uv2;
            float4 _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4);
            float _Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[0];
            float _Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[1];
            float _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[2];
            float _Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[3];
            float _Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float = _CoverHeightMapMin;
            float _Property_2b4b16173941968fbecea0823b164445_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2 = float2(_Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float, _Property_2b4b16173941968fbecea0823b164445_Out_0_Float);
            float _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2;
            Unity_Add_float2(_Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2, (_Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float.xx), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2);
            float _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, float2 (0, 1), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float);
            float _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float;
            Unity_Add_float(_Property_2b4b16173941968fbecea0823b164445_Out_0_Float, _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float);
            float _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float;
            Unity_Branch_float(_Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float);
            float _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float);
            float _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float;
            Unity_Clamp_float(_Branch_c4f2625143cb430381042fc94963e665_Out_3_Float, 0, 1, _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float);
            float _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float;
            Unity_Saturate_float(_Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float);
            float _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float);
            float _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float;
            Unity_Branch_float(_Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float, _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float);
            float3 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3);
            float _Split_024016837c0544d9831785fe96f214ec_R_1_Float = IN.VertexColor[0];
            float _Split_024016837c0544d9831785fe96f214ec_G_2_Float = IN.VertexColor[1];
            float _Split_024016837c0544d9831785fe96f214ec_B_3_Float = IN.VertexColor[2];
            float _Split_024016837c0544d9831785fe96f214ec_A_4_Float = IN.VertexColor[3];
            float _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2;
            float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_024016837c0544d9831785fe96f214ec_G_2_Float, _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float, _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean, _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean, _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float);
            float3 _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3);
            float4 _Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4 = _WetColor;
            float3 _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4.xyz), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3);
            float _Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_84671236d01d4966adfadf83f8f1d569_R_1_Float = IN.VertexColor[0];
            float _Split_84671236d01d4966adfadf83f8f1d569_G_2_Float = IN.VertexColor[1];
            float _Split_84671236d01d4966adfadf83f8f1d569_B_3_Float = IN.VertexColor[2];
            float _Split_84671236d01d4966adfadf83f8f1d569_A_4_Float = IN.VertexColor[3];
            float _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float;
            Unity_OneMinus_float(_Split_84671236d01d4966adfadf83f8f1d569_R_1_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float);
            float _Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_687864922a2d431dae4d25eacc436e19_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float;
            Time_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float);
            float _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float, _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float);
            float _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float;
            Unity_Add_float(_Property_687864922a2d431dae4d25eacc436e19_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float);
            float _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float;
            Unity_Add_float(_Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float);
            float _Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float;
            Unity_Add_float(_Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float);
            float4 _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4 = IN.uv2;
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[0];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_G_2_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[1];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_B_3_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[2];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_A_4_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[3];
            float _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float;
            Unity_Smoothstep_float(_Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float, _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float, _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float);
            float _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float, _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float);
            float _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float;
            Unity_Clamp_float(_OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float, 0, 1, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float);
            float _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float);
            float _Branch_36c93485b10140698831d932acfa7872_Out_3_Float;
            Unity_Branch_float(_Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Branch_36c93485b10140698831d932acfa7872_Out_3_Float);
            float3 _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3, (_Branch_36c93485b10140698831d932acfa7872_Out_3_Float.xxx), _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3);
            float3 _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            Unity_Branch_float3(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3, _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3);
            float _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3);
            float3 _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3);
            float3 _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3, _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3);
            float3 _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3);
            float3 _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3);
            float3 _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3);
            float3 _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3);
            float4 Color_4c9d480c6fdc4700b27eec94efd6d196 = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            float _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float);
            float _Property_e07dff1106094ceab44e6dbb34bda247_Out_0_Boolean = _Dynamic_Flow;
            float _Split_1d57a23557e84aa19ebba5e059647482_R_1_Float = IN.VertexColor[0];
            float _Split_1d57a23557e84aa19ebba5e059647482_G_2_Float = IN.VertexColor[1];
            float _Split_1d57a23557e84aa19ebba5e059647482_B_3_Float = IN.VertexColor[2];
            float _Split_1d57a23557e84aa19ebba5e059647482_A_4_Float = IN.VertexColor[3];
            float _Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float;
            Unity_Clamp_float(_Split_1d57a23557e84aa19ebba5e059647482_R_1_Float, 0, 1, _Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float);
            float _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float;
            Unity_OneMinus_float(_Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float, _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float);
            float _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float;
            Unity_Branch_float(_Property_e07dff1106094ceab44e6dbb34bda247_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float);
            float _Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float);
            float _Property_7650c80e23dc4080b44f42e9b71348d7_Out_0_Float = _BaseEmissionMaskIntensivity_1;
            float _Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float, _Property_7650c80e23dc4080b44f42e9b71348d7_Out_0_Float, _Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float);
            float _Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float;
            Unity_Absolute_float(_Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float, _Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float);
            float _Property_30f2a823879844dd991358fa7be7decc_Out_0_Float = _BaseEmissionMaskTreshold_1;
            float _Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float;
            Unity_Power_float(_Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float, _Property_30f2a823879844dd991358fa7be7decc_Out_0_Float, _Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float);
            float _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float;
            Unity_OneMinus_float(_Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float, _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float);
            float _Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float);
            float _Property_20272825b13c4ee5b9ab9d9b2cef4bb5_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float, _Property_20272825b13c4ee5b9ab9d9b2cef4bb5_Out_0_Float, _Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float);
            float _Absolute_8515323330844f3798e658e697d35afb_Out_1_Float;
            Unity_Absolute_float(_Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float, _Absolute_8515323330844f3798e658e697d35afb_Out_1_Float);
            float _Property_e75cc24d4db5474fa1117e352224621d_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float;
            Unity_Power_float(_Absolute_8515323330844f3798e658e697d35afb_Out_1_Float, _Property_e75cc24d4db5474fa1117e352224621d_Out_0_Float, _Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float);
            float _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float;
            Unity_OneMinus_float(_Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float, _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float);
            float _Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float);
            float _Property_23d03330130e4faa9a3d035dee2f4d45_Out_0_Float = _Base2EmissionMaskIntensivity;
            float _Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float, _Property_23d03330130e4faa9a3d035dee2f4d45_Out_0_Float, _Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float);
            float _Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float;
            Unity_Absolute_float(_Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float, _Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float);
            float _Property_cde48fe2dd424af5950a89d86cc20ec5_Out_0_Float = _Base2EmissionMaskTreshold;
            float _Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float;
            Unity_Power_float(_Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float, _Property_cde48fe2dd424af5950a89d86cc20ec5_Out_0_Float, _Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8;
            float3 _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8, _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3);
            float _Split_e22e218cdaf04706be7068474156c218_R_1_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[0];
            float _Split_e22e218cdaf04706be7068474156c218_G_2_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[1];
            float _Split_e22e218cdaf04706be7068474156c218_B_3_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[2];
            float _Split_e22e218cdaf04706be7068474156c218_A_4_Float = 0;
            float _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float;
            Unity_OneMinus_float(_Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float, _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float);
            float _Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float);
            float _Property_5ec10b66097e41748f33013e6748e45d_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float, _Property_5ec10b66097e41748f33013e6748e45d_Out_0_Float, _Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float);
            float _Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float;
            Unity_Absolute_float(_Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float, _Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float);
            float _Property_1e8e0ff314144f9884b91c35d74ca756_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float;
            Unity_Power_float(_Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float, _Property_1e8e0ff314144f9884b91c35d74ca756_Out_0_Float, _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float);
            float _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float;
            Unity_Clamp_float(_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float, 0, 1, _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float);
            float _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float;
            Unity_Lerp_float(_Split_e22e218cdaf04706be7068474156c218_R_1_Float, _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float, _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float, _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float);
            float _Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float;
            Unity_Maximum_float(_Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float, _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float, _Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float);
            float4 _Property_95626aa497ae4b55a696d133e3806dea_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float.xxxx), _Property_95626aa497ae4b55a696d133e3806dea_Out_0_Vector4, _Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4);
            UnityTexture2D _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float2 _Property_8e8cf89cf9884e639ec374d24ad26848_Out_0_Vector2 = _NoiseTiling;
            float4 _UV_e33a05f22f6b4c96934c0915b9938219_Out_0_Vector4 = IN.uv0;
            float2 _Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_8e8cf89cf9884e639ec374d24ad26848_Out_0_Vector2, (_UV_e33a05f22f6b4c96934c0915b9938219_Out_0_Vector4.xy), _Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2);
            float2 _Property_2b5b2bf858ff4e35aa531627c7092e0e_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float;
            Time_float(_TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float);
            float2 _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_2b5b2bf858ff4e35aa531627c7092e0e_Out_0_Vector2, (_TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float.xx), _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2);
            float2 _Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2;
            Unity_Add_float2(_Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2, _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2, _Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2);
            float4 _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.tex, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.samplerstate, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.GetTransformedUV(_Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2) );
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_R_4_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.r;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_G_5_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.g;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_B_6_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.b;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_A_7_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.a;
            float2 _Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2);
            float2 _Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2;
            Unity_Add_float2(_Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2, float2(0.5, 0.5), _Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2);
            float4 _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.tex, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.samplerstate, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.GetTransformedUV(_Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2) );
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_R_4_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.r;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_G_5_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.g;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_B_6_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.b;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_A_7_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.a;
            float _Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_588289679644400f83f09ec5fba25364_A_7_Float, _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_A_7_Float, _Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float);
            float _Property_2040d95977684d38a0058cd31a6487f5_Out_0_Float = _EmissionNoiseMultiply;
            float _Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float;
            Unity_Multiply_float_float(_Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float, _Property_2040d95977684d38a0058cd31a6487f5_Out_0_Float, _Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float);
            float _Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float;
            Unity_Clamp_float(_Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float, 0, 1, _Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float);
            float _Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float;
            Unity_Absolute_float(_Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float, _Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float);
            float _Property_92aa60daa2db494582a55735afa367c1_Out_0_Float = _EmissionNoisePower;
            float _Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float;
            Unity_Power_float(_Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float, _Property_92aa60daa2db494582a55735afa367c1_Out_0_Float, _Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float);
            float _Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float;
            Unity_Multiply_float_float(_Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float, 20, _Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float);
            float _Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float;
            Unity_Clamp_float(_Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float, 0.05, 1.2, _Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float);
            float4 _Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4, (_Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float.xxxx), _Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4);
            float4 _Property_ffc0adc4f1d94087a4eac79b8fa7caa3_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float3 _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3);
            float _DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3, _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3, _DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float);
            float _Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float;
            Unity_Saturate_float(_DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float, _Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float);
            float _OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float;
            Unity_OneMinus_float(_Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float, _OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float);
            float _Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float;
            Unity_Absolute_float(_OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float, _Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float);
            float _Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float;
            Unity_Power_float(_Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float, 10, _Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float);
            float4 _Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_ffc0adc4f1d94087a4eac79b8fa7caa3_Out_0_Vector4, (_Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float.xxxx), _Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4);
            float _Property_f29cf33d2b734ccd9ad0e9b6ab6a63fa_Out_0_Float = _RimLightPower;
            float4 _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4, (_Property_f29cf33d2b734ccd9ad0e9b6ab6a63fa_Out_0_Float.xxxx), _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4);
            float4 _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float.xxxx), _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4, _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4);
            float4 _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4;
            Unity_Add_float4(_Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4, _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4, _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4);
            float4 _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4;
            Unity_Clamp_float4(_Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4, float4(0, 0, 0, 0), _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4, _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4);
            float4 _Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4;
            Unity_Branch_float4(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, Color_4c9d480c6fdc4700b27eec94efd6d196, _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4, _Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4);
            float _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float = _BaseMetallic;
            float _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float;
            Unity_Multiply_float_float(_Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float, _Property_bbb7f63dc018f9828732f80495a95444_Out_0_Float, _Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float);
            float _Property_8142f12b781ad08680220297dab56f14_Out_0_Float = _BaseAORemapMin;
            float _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float = _BaseAORemapMax;
            float2 _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2 = float2(_Property_8142f12b781ad08680220297dab56f14_Out_0_Float, _Property_48e1c5285b48c78e8af19e38f4bd77f9_Out_0_Float);
            float _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float, float2 (0, 1), _Vector2_344526038e228b85ad9c2d33f000c5ea_Out_0_Vector2, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float);
            float _Multiply_a26583fddce74139b1403411aa709d30_Out_2_Float;
            Unity_Multiply_float_float(_Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float, _Remap_f4684fae31257d82aa14c39233760e21_Out_3_Float, _Multiply_a26583fddce74139b1403411aa709d30_Out_2_Float);
            float _Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2 = float2(_Property_0682b9e13137ec8f8de23962e6db211c_Out_0_Float, _Property_0edea7916ed7a189a62b0faf2c274601_Out_0_Float);
            float _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float, float2 (0, 1), _Vector2_8d45bee64b64f087b44fb9b02317dfdd_Out_0_Vector2, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float);
            float _Property_d9e78bc9f13e457a84c3fc0552bbf035_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_6f9e06e350b247b6aa648200eb6c5080_Out_2_Float;
            Unity_Multiply_float_float(_Property_d9e78bc9f13e457a84c3fc0552bbf035_Out_0_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Multiply_6f9e06e350b247b6aa648200eb6c5080_Out_2_Float);
            float _Lerp_a8e9772181d644dc941043011feaf454_Out_3_Float;
            Unity_Lerp_float(_Multiply_6f9e06e350b247b6aa648200eb6c5080_Out_2_Float, _Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _Lerp_a8e9772181d644dc941043011feaf454_Out_3_Float);
            float _Lerp_6db09c4125864215b3a94026f41f8191_Out_3_Float;
            Unity_Lerp_float(_Remap_857d26677c8e8a809704b89dbca71045_Out_3_Float, _Lerp_a8e9772181d644dc941043011feaf454_Out_3_Float, _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float, _Lerp_6db09c4125864215b3a94026f41f8191_Out_3_Float);
            float _Clamp_112222f0345b4a98b3f1ef9926c289d1_Out_3_Float;
            Unity_Clamp_float(_Lerp_6db09c4125864215b3a94026f41f8191_Out_3_Float, 0, 1, _Clamp_112222f0345b4a98b3f1ef9926c289d1_Out_3_Float);
            float3 _Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3 = float3(_Multiply_ee089bb3595c0c8da7ca2ff054def6d5_Out_2_Float, _Multiply_a26583fddce74139b1403411aa709d30_Out_2_Float, _Clamp_112222f0345b4a98b3f1ef9926c289d1_Out_3_Float);
            float _Property_da25d24e4fd2108fa3e2cae8cf268ad1_Out_0_Float = _Base2Metallic;
            float _Multiply_1a54c23c25172e89acacc2ea32718ab1_Out_2_Float;
            Unity_Multiply_float_float(_Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float, _Property_da25d24e4fd2108fa3e2cae8cf268ad1_Out_0_Float, _Multiply_1a54c23c25172e89acacc2ea32718ab1_Out_2_Float);
            float _Property_02bd8e6a672d1f8ebd2c50b4d822d29c_Out_0_Float = _Base2AORemapMin;
            float _Property_7c7a0acfa72e4a8d9e89fd92eb4fde51_Out_0_Float = _Base2AORemapMax;
            float2 _Vector2_61efe41bd1ca5283ae09f418d56dce98_Out_0_Vector2 = float2(_Property_02bd8e6a672d1f8ebd2c50b4d822d29c_Out_0_Float, _Property_7c7a0acfa72e4a8d9e89fd92eb4fde51_Out_0_Float);
            float _Remap_09fcf6edbba96e8daee966084ddc87eb_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float, float2 (0, 1), _Vector2_61efe41bd1ca5283ae09f418d56dce98_Out_0_Vector2, _Remap_09fcf6edbba96e8daee966084ddc87eb_Out_3_Float);
            float _Multiply_93b25cda97334aae9401990a509dc99a_Out_2_Float;
            Unity_Multiply_float_float(_Remap_1c754bb1be89471b968682c019c76795_Out_3_Float, _Remap_09fcf6edbba96e8daee966084ddc87eb_Out_3_Float, _Multiply_93b25cda97334aae9401990a509dc99a_Out_2_Float);
            float _Property_e93e026149f1bb888d5c7f055f55d34c_Out_0_Float = _Base2SmoothnessRemapMin;
            float _Property_9e1d05a5f3bb4687bd2a9ef8e632a88c_Out_0_Float = _Base2SmoothnessRemapMax;
            float2 _Vector2_d434b3a98fac8f88a713affdbe931846_Out_0_Vector2 = float2(_Property_e93e026149f1bb888d5c7f055f55d34c_Out_0_Float, _Property_9e1d05a5f3bb4687bd2a9ef8e632a88c_Out_0_Float);
            float _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float, float2 (0, 1), _Vector2_d434b3a98fac8f88a713affdbe931846_Out_0_Vector2, _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float);
            float _Property_43e0160a49a745528e81cca242c02173_Out_0_Float = _LeaksSmoothnessMultiply_2;
            float _Multiply_3f001064558a4d14b0e1c1fe7105c7f5_Out_2_Float;
            Unity_Multiply_float_float(_Property_43e0160a49a745528e81cca242c02173_Out_0_Float, _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float, _Multiply_3f001064558a4d14b0e1c1fe7105c7f5_Out_2_Float);
            float _Lerp_7d993e7373b44a23b010964aff3b42c8_Out_3_Float;
            Unity_Lerp_float(_Multiply_3f001064558a4d14b0e1c1fe7105c7f5_Out_2_Float, _Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float, _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _Lerp_7d993e7373b44a23b010964aff3b42c8_Out_3_Float);
            float _Lerp_1013be30f625441ea0c7370fefd04d16_Out_3_Float;
            Unity_Lerp_float(_Remap_098b362070432e8e9aa6ed165b86b141_Out_3_Float, _Lerp_7d993e7373b44a23b010964aff3b42c8_Out_3_Float, _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float, _Lerp_1013be30f625441ea0c7370fefd04d16_Out_3_Float);
            float _Clamp_6933072fa87144c88dad1b47ef69cb94_Out_3_Float;
            Unity_Clamp_float(_Lerp_1013be30f625441ea0c7370fefd04d16_Out_3_Float, 0, 1, _Clamp_6933072fa87144c88dad1b47ef69cb94_Out_3_Float);
            float3 _Vector3_f4a7e19d772ca88795286111ab15ccc1_Out_0_Vector3 = float3(_Multiply_1a54c23c25172e89acacc2ea32718ab1_Out_2_Float, _Multiply_93b25cda97334aae9401990a509dc99a_Out_2_Float, _Clamp_6933072fa87144c88dad1b47ef69cb94_Out_3_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c;
            float3 _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_Vector3_1f83d62db7392b81beeecb62c44f56c5_Out_0_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _Vector3_f4a7e19d772ca88795286111ab15ccc1_Out_0_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c, _HeightBlend_d3702ea647a00788a9589b6dd2f39e3c_OutVector4_1_Vector3);
            float _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float = _CoverMetallic;
            float _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float;
            Unity_Multiply_float_float(_Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float, _Property_0187ddd5583a3d86a3c4c2444b45e777_Out_0_Float, _Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float);
            float _Property_cd1da6b994394f34873db373dc072246_Out_0_Float = _ShapeAORemapMin_1;
            float _Property_6b68a3da643f44caa49599ae08f0ff2f_Out_0_Float = _ShapeAORemapMax_1;
            float2 _Vector2_59f6f01fd51c4032837a491d5168de08_Out_0_Vector2 = float2(_Property_cd1da6b994394f34873db373dc072246_Out_0_Float, _Property_6b68a3da643f44caa49599ae08f0ff2f_Out_0_Float);
            float _Remap_177cb162183d40e3b7455b2a1c10deab_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_59f6f01fd51c4032837a491d5168de08_Out_0_Vector2, _Remap_177cb162183d40e3b7455b2a1c10deab_Out_3_Float);
            float _Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float = _CoverAORemapMin;
            float _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float = _CoverAORemapMax;
            float2 _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2 = float2(_Property_5cc07bc49e1bf582b5c1b52606eec56f_Out_0_Float, _Property_506cf024c6db098fbc150277952a7bee_Out_0_Float);
            float _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float, float2 (0, 1), _Vector2_ffa116a725445282a83acc70377ff4e1_Out_0_Vector2, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float);
            float _Multiply_6ef975d55e994fbb89ea57d542c7dfb4_Out_2_Float;
            Unity_Multiply_float_float(_Remap_177cb162183d40e3b7455b2a1c10deab_Out_3_Float, _Remap_02e4c7480ddeca88aa886be18ce15353_Out_3_Float, _Multiply_6ef975d55e994fbb89ea57d542c7dfb4_Out_2_Float);
            float _Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2 = float2(_Property_36782180ac25b489baf611efb6d0d9ed_Out_0_Float, _Property_6c0666df4add418b8e32b0e4275b1c27_Out_0_Float);
            float _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float, float2 (0, 1), _Vector2_b0c047c56338e78abcd740717a8d6900_Out_0_Vector2, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float);
            float _Property_f679378d9bcc4bfe84da691a2516b06d_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_30832ed98e74422fb1100a9fed9b4b37_Out_2_Float;
            Unity_Multiply_float_float(_Property_f679378d9bcc4bfe84da691a2516b06d_Out_0_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Multiply_30832ed98e74422fb1100a9fed9b4b37_Out_2_Float);
            float _Lerp_8bb4fb2e45044f44b6203d819f1741dc_Out_3_Float;
            Unity_Lerp_float(_Multiply_30832ed98e74422fb1100a9fed9b4b37_Out_2_Float, _Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _Lerp_8bb4fb2e45044f44b6203d819f1741dc_Out_3_Float);
            float _Lerp_1a2effa49ae14743b89c9fdc3447022d_Out_3_Float;
            Unity_Lerp_float(_Remap_1f96cc6fc648098f8cb49680f75d5a1e_Out_3_Float, _Lerp_8bb4fb2e45044f44b6203d819f1741dc_Out_3_Float, _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float, _Lerp_1a2effa49ae14743b89c9fdc3447022d_Out_3_Float);
            float _Clamp_541159bf2bf44f5eb797e9c7936d1566_Out_3_Float;
            Unity_Clamp_float(_Lerp_1a2effa49ae14743b89c9fdc3447022d_Out_3_Float, 0, 1, _Clamp_541159bf2bf44f5eb797e9c7936d1566_Out_3_Float);
            float3 _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3 = float3(_Multiply_0248a4a17e4abe868ff7c5ec2a5c8d2f_Out_2_Float, _Multiply_6ef975d55e994fbb89ea57d542c7dfb4_Out_2_Float, _Clamp_541159bf2bf44f5eb797e9c7936d1566_Out_3_Float);
            float3 _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d3702ea647a00788a9589b6dd2f39e3c_OutVector4_1_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3);
            float3 _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_48cc6a544b837c85a967cc83aab4e3fb_Out_3_Vector3, _Vector3_48cf085b9f7fd28e89fe4361decf0fec_Out_0_Vector3, (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3);
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float = _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3[0];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float = _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3[1];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float = _Lerp_56ab9f30aca446eda3629617ea4f13c0_Out_3_Vector3[2];
            float _Split_645358fc1f0e278fbfc2ccb5594c95e3_A_4_Float = 0;
            float _Property_c2c14c6e59fff685aa34dd6b96e602b1_Out_0_Float = _WetSmoothness;
            float _Lerp_d69b881388ff3d87bbdb99ca85854182_Out_3_Float;
            Unity_Lerp_float(_Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Property_c2c14c6e59fff685aa34dd6b96e602b1_Out_0_Float, _Branch_36c93485b10140698831d932acfa7872_Out_3_Float, _Lerp_d69b881388ff3d87bbdb99ca85854182_Out_3_Float);
            float _Branch_4a92b328e7494dffb77036a49f8e3028_Out_3_Float;
            Unity_Branch_float(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, _Lerp_d69b881388ff3d87bbdb99ca85854182_Out_3_Float, _Split_645358fc1f0e278fbfc2ccb5594c95e3_B_3_Float, _Branch_4a92b328e7494dffb77036a49f8e3028_Out_3_Float);
            surface.BaseColor = _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            surface.NormalTS = _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            surface.Emission = (_Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4.xyz);
            surface.Metallic = _Split_645358fc1f0e278fbfc2ccb5594c95e3_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Branch_4a92b328e7494dffb77036a49f8e3028_Out_3_Float;
            surface.Occlusion = _Split_645358fc1f0e278fbfc2ccb5594c95e3_G_2_Float;
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, 0, _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, 0, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, 1E-05, _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
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
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
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
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            UnityTexture2D _Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv0 = IN.uv0;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv2 = IN.uv2;
            float4 _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4);
            float _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3);
            float3 _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3);
            float3 _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3, _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3);
            float _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean = _UV0_UV2;
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean = _BaseUsePlanarUV;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_692960de14d47b8dbfb207b3e9f74790;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv0 = IN.uv0;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv2 = IN.uv2;
            float4 _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3);
            float3 _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3;
            Unity_Branch_float3(_Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3);
            float3 _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3;
            Unity_Branch_float3(_Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3);
            float3 _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3, _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b6bb43285f18e0838565e2920c32d293;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv0 = IN.uv0;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv2 = IN.uv2;
            float4 _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_b6bb43285f18e0838565e2920c32d293, _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4);
            float _Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[0];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[1];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[2];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[3];
            float _Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float = _HeightMin;
            float _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float = _HeightMax;
            float2 _Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2 = float2(_Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float, _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float);
            float _Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float = _HeightOffset;
            float2 _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2, (_Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float.xx), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2);
            float _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float, float2 (0, 1), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float);
            float _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float = _ShapeNormalStrenght_2;
            float3 _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3);
            float3 _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3);
            float3 _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3, _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3);
            float _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean = _UV0_UV2_2;
            UnityTexture2D _Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            float4 _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4 = _Base2TilingOffset;
            float _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean = _Base2UsePlanarUV;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv0 = IN.uv0;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv2 = IN.uv2;
            float4 _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4);
            float _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float = _Base2NormalScale;
            float3 _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4.xyz), _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3);
            float3 _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3;
            Unity_Branch_float3(_Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3);
            float3 _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3;
            Unity_Branch_float3(_Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3);
            float3 _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3);
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_R_1_Float = IN.VertexColor[0];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_G_2_Float = IN.VertexColor[1];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float = IN.VertexColor[2];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_A_4_Float = IN.VertexColor[3];
            float _Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean = _Invert_Layer_Mask;
            UnityTexture2D _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            float4 _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.tex, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.samplerstate, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.r;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_G_5_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.g;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_B_6_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.b;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_A_7_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.a;
            float _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float);
            float _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float;
            Unity_Branch_float(_Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float, _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float);
            UnityTexture2D _Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv0 = IN.uv0;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv2 = IN.uv2;
            float4 _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4);
            float _Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[0];
            float _Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[1];
            float _Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[2];
            float _Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[3];
            float _Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float = _HeightMin2;
            float _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float = _HeightMax2;
            float2 _Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2 = float2(_Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float, _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float);
            float _Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float = _HeightOffset2;
            float2 _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2, (_Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float.xx), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2);
            float _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float, float2 (0, 1), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float);
            float _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float;
            Unity_Multiply_float_float(_Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float);
            float _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float;
            Unity_Multiply_float_float(_Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float);
            float _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float = _Height_Transition;
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6;
            float3 _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3);
            float _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3);
            float3 _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3);
            float3 _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3, _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3);
            float _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean = _Cover_UV0_UV2;
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean = _CoverUsePlanarUV;
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2e288bef98384580aaab10e906ca8004;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv0 = IN.uv0;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv2 = IN.uv2;
            float4 _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNMn_2e288bef98384580aaab10e906ca8004, _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3);
            float3 _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3);
            float3 _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3);
            float _Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            float _Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float = _ShapeHeightMapMin;
            float _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2 = float2(_Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float, _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float);
            float _Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2;
            Unity_Add_float2(_Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2, (_Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float.xx), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2);
            float _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, float2 (0, 1), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float);
            float _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3);
            float3 _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3);
            float3 _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3, _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3);
            float _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3);
            float3 _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3;
            Unity_Branch_float3(_Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3);
            float3 _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3);
            float3 _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3);
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
            float _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.9999, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
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
            float _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
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
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float);
            float _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float, _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float);
            float _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float;
            Unity_Clamp_float(_Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float, 0, 1, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float);
            UnityTexture2D _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.tex, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.samplerstate, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float);
            float _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float;
            Unity_Clamp_float(_Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float, 0, 1, _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float);
            float _Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv0 = IN.uv0;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv2 = IN.uv2;
            float4 _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4);
            float _Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[0];
            float _Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[1];
            float _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[2];
            float _Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[3];
            float _Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float = _CoverHeightMapMin;
            float _Property_2b4b16173941968fbecea0823b164445_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2 = float2(_Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float, _Property_2b4b16173941968fbecea0823b164445_Out_0_Float);
            float _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2;
            Unity_Add_float2(_Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2, (_Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float.xx), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2);
            float _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, float2 (0, 1), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float);
            float _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float;
            Unity_Add_float(_Property_2b4b16173941968fbecea0823b164445_Out_0_Float, _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float);
            float _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float;
            Unity_Branch_float(_Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float);
            float _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float);
            float _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float;
            Unity_Clamp_float(_Branch_c4f2625143cb430381042fc94963e665_Out_3_Float, 0, 1, _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float);
            float _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float;
            Unity_Saturate_float(_Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float);
            float _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float);
            float _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float;
            Unity_Branch_float(_Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float, _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float);
            float3 _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3);
            float _Split_024016837c0544d9831785fe96f214ec_R_1_Float = IN.VertexColor[0];
            float _Split_024016837c0544d9831785fe96f214ec_G_2_Float = IN.VertexColor[1];
            float _Split_024016837c0544d9831785fe96f214ec_B_3_Float = IN.VertexColor[2];
            float _Split_024016837c0544d9831785fe96f214ec_A_4_Float = IN.VertexColor[3];
            float _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2;
            float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_024016837c0544d9831785fe96f214ec_G_2_Float, _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float, _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean, _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean, _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float);
            float3 _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3);
            surface.NormalTS = _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, 0, _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, 0, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, 1E-05, _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Subtract_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float3(float3 In, out float3 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Blend_Multiply_float3(float3 Base, float3 Blend, out float3 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
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
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
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
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
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
            float _Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv0 = IN.uv0;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv2 = IN.uv2;
            float4 _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4 = IN.uv0;
            float4 _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4 = IN.uv2;
            float4 _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4;
            Unity_Branch_float4(_Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean, _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4, _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4, _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4);
            float4 _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_be87af2fe0f049138df84c43c16f6328_R_1_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[0];
            float _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[1];
            float _Split_be87af2fe0f049138df84c43c16f6328_B_3_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[2];
            float _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[3];
            float2 _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_R_1_Float, _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float);
            float2 _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_B_3_Float, _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float);
            float2 _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4.xy), _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2, _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2, _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2);
            float4 _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.tex, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.samplerstate, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2) );
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.r;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_G_5_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.g;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_B_6_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.b;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_A_7_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.a;
            float _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float);
            float4 _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float.xxxx), _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4, _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4);
            float4 _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4);
            float4 _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4);
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            float _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float, _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float);
            float _Split_519202708581470b82d2ab05ac7a68cf_R_1_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[0];
            float _Split_519202708581470b82d2ab05ac7a68cf_G_2_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[1];
            float _Split_519202708581470b82d2ab05ac7a68cf_B_3_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[2];
            float _Split_519202708581470b82d2ab05ac7a68cf_A_4_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[3];
            float _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float;
            Unity_Saturate_float(_Split_519202708581470b82d2ab05ac7a68cf_A_4_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float);
            float _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float, _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float);
            float _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float;
            Unity_Clamp_float(_Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float, 0, 1, _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float);
            float4 _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4, (_Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float.xxxx), _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b6bb43285f18e0838565e2920c32d293;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv0 = IN.uv0;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv2 = IN.uv2;
            float4 _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_b6bb43285f18e0838565e2920c32d293, _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4);
            float _Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[0];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[1];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[2];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[3];
            float _Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float = _HeightMin;
            float _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float = _HeightMax;
            float2 _Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2 = float2(_Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float, _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float);
            float _Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float = _HeightOffset;
            float2 _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2, (_Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float.xx), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2);
            float _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float, float2 (0, 1), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float);
            UnityTexture2D _Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            float4 _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4 = _Base2TilingOffset;
            float _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean = _Base2UsePlanarUV;
            float _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean = _UV0_UV2_2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c1bb923588566183a75a0e765556574f;
            _PlanarNM_c1bb923588566183a75a0e765556574f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv0 = IN.uv0;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv2 = IN.uv2;
            float4 _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_c1bb923588566183a75a0e765556574f, _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4);
            float4 _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4 = _Base2Color;
            float4 _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4, _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4);
            float _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float);
            float4 _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4 = _BaseLeaksColorMultiply_1;
            float4 _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float.xxxx), _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4, _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4);
            float4 _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4);
            float4 _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4);
            float _Split_0f03e5552d394642ad0e560fcb603c95_R_1_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[0];
            float _Split_0f03e5552d394642ad0e560fcb603c95_G_2_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[1];
            float _Split_0f03e5552d394642ad0e560fcb603c95_B_3_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[2];
            float _Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[3];
            float _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float;
            Unity_Saturate_float(_Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float);
            float _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float, _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float);
            float _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float;
            Unity_Clamp_float(_Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float, 0, 1, _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float);
            float4 _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4, (_Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float.xxxx), _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4);
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_R_1_Float = IN.VertexColor[0];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_G_2_Float = IN.VertexColor[1];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float = IN.VertexColor[2];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_A_4_Float = IN.VertexColor[3];
            float _Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean = _Invert_Layer_Mask;
            UnityTexture2D _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            float4 _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.tex, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.samplerstate, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.r;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_G_5_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.g;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_B_6_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.b;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_A_7_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.a;
            float _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float);
            float _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float;
            Unity_Branch_float(_Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float, _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float);
            UnityTexture2D _Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv0 = IN.uv0;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv2 = IN.uv2;
            float4 _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4);
            float _Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[0];
            float _Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[1];
            float _Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[2];
            float _Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[3];
            float _Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float = _HeightMin2;
            float _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float = _HeightMax2;
            float2 _Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2 = float2(_Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float, _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float);
            float _Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float = _HeightOffset2;
            float2 _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2, (_Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float.xx), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2);
            float _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float, float2 (0, 1), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float);
            float _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float;
            Unity_Multiply_float_float(_Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float);
            float _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float;
            Unity_Multiply_float_float(_Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float);
            float _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float = _Height_Transition;
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_709e53664a4175808a76121d09d25807;
            float3 _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4.xyz), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4.xyz), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_709e53664a4175808a76121d09d25807, _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3);
            float _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float);
            float _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float;
            Unity_Subtract_float(_OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float, 0.5, _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float);
            float3 _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3;
            Unity_Subtract_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, (_Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float.xxx), _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3);
            float _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float;
            Unity_Subtract_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, 0.5, _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float);
            float3 _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3;
            Unity_Add_float3(_Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3, (_Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float.xxx), _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3);
            float3 _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3;
            Unity_Saturate_float3(_Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3, _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3);
            float _Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float = _ShapeAORemapMin;
            float _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2 = float2(_Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float, _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float);
            float _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2, _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float);
            float _Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float = _ShapeAORemapMin_2;
            float _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float = _ShapeAORemapMax_2;
            float2 _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2 = float2(_Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float, _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float);
            float _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2, _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc;
            float3 _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Remap_1c754bb1be89471b968682c019c76795_Out_3_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3);
            float _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float3 _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3;
            Unity_Blend_Multiply_float3(_Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float);
            float _Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float = _CurvatureBlend;
            float3 _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, (_Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float.xxx), _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv0 = IN.uv0;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv2 = IN.uv2;
            float4 _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float);
            float4 _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float.xxxx), _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4, _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4);
            float4 _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4);
            float4 _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4);
            float _Split_d939850bd1f04161bc06637ccd78d716_R_1_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[0];
            float _Split_d939850bd1f04161bc06637ccd78d716_G_2_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[1];
            float _Split_d939850bd1f04161bc06637ccd78d716_B_3_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[2];
            float _Split_d939850bd1f04161bc06637ccd78d716_A_4_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[3];
            float _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float;
            Unity_Saturate_float(_Split_d939850bd1f04161bc06637ccd78d716_A_4_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float);
            float _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float, _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float);
            float _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float;
            Unity_Clamp_float(_Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float, 0, 1, _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float);
            float4 _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4, (_Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float.xxxx), _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4);
            float _Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float = _ShapeHeightMapMin;
            float _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2 = float2(_Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float, _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float);
            float _Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2;
            Unity_Add_float2(_Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2, (_Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float.xx), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2);
            float _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, float2 (0, 1), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float);
            UnityTexture2D _Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv0 = IN.uv0;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv2 = IN.uv2;
            float4 _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4);
            float _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3);
            float3 _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3);
            float3 _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3, _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_692960de14d47b8dbfb207b3e9f74790;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv0 = IN.uv0;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv2 = IN.uv2;
            float4 _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3);
            float3 _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3;
            Unity_Branch_float3(_Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3);
            float3 _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3;
            Unity_Branch_float3(_Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3);
            float3 _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3, _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3);
            float _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float = _ShapeNormalStrenght_2;
            float3 _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3);
            float3 _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3);
            float3 _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3, _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3);
            UnityTexture2D _Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv0 = IN.uv0;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv2 = IN.uv2;
            float4 _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4);
            float _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float = _Base2NormalScale;
            float3 _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4.xyz), _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3);
            float3 _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3;
            Unity_Branch_float3(_Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3);
            float3 _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3;
            Unity_Branch_float3(_Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3);
            float3 _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6;
            float3 _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3);
            float _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3);
            float3 _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3);
            float3 _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3, _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2e288bef98384580aaab10e906ca8004;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv0 = IN.uv0;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv2 = IN.uv2;
            float4 _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNMn_2e288bef98384580aaab10e906ca8004, _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4);
            float _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3);
            float3 _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3;
            Unity_Branch_float3(_Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3);
            float3 _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3);
            float3 _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3);
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
            float _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.9999, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
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
            float _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
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
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float);
            float _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float, _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float);
            float _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float;
            Unity_Clamp_float(_Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float, 0, 1, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float);
            UnityTexture2D _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.tex, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.samplerstate, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float);
            float _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float;
            Unity_Clamp_float(_Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float, 0, 1, _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float);
            float _Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv0 = IN.uv0;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv2 = IN.uv2;
            float4 _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4);
            float _Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[0];
            float _Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[1];
            float _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[2];
            float _Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[3];
            float _Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float = _CoverHeightMapMin;
            float _Property_2b4b16173941968fbecea0823b164445_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2 = float2(_Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float, _Property_2b4b16173941968fbecea0823b164445_Out_0_Float);
            float _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2;
            Unity_Add_float2(_Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2, (_Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float.xx), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2);
            float _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, float2 (0, 1), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float);
            float _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float;
            Unity_Add_float(_Property_2b4b16173941968fbecea0823b164445_Out_0_Float, _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float);
            float _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float;
            Unity_Branch_float(_Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float);
            float _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float);
            float _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float;
            Unity_Clamp_float(_Branch_c4f2625143cb430381042fc94963e665_Out_3_Float, 0, 1, _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float);
            float _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float;
            Unity_Saturate_float(_Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float);
            float _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float);
            float _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float;
            Unity_Branch_float(_Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float, _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float);
            float3 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3);
            float _Split_024016837c0544d9831785fe96f214ec_R_1_Float = IN.VertexColor[0];
            float _Split_024016837c0544d9831785fe96f214ec_G_2_Float = IN.VertexColor[1];
            float _Split_024016837c0544d9831785fe96f214ec_B_3_Float = IN.VertexColor[2];
            float _Split_024016837c0544d9831785fe96f214ec_A_4_Float = IN.VertexColor[3];
            float _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2;
            float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_024016837c0544d9831785fe96f214ec_G_2_Float, _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float, _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean, _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean, _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float);
            float3 _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3);
            float4 _Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4 = _WetColor;
            float3 _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4.xyz), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3);
            float _Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_84671236d01d4966adfadf83f8f1d569_R_1_Float = IN.VertexColor[0];
            float _Split_84671236d01d4966adfadf83f8f1d569_G_2_Float = IN.VertexColor[1];
            float _Split_84671236d01d4966adfadf83f8f1d569_B_3_Float = IN.VertexColor[2];
            float _Split_84671236d01d4966adfadf83f8f1d569_A_4_Float = IN.VertexColor[3];
            float _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float;
            Unity_OneMinus_float(_Split_84671236d01d4966adfadf83f8f1d569_R_1_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float);
            float _Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_687864922a2d431dae4d25eacc436e19_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float;
            Time_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float);
            float _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float, _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float);
            float _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float;
            Unity_Add_float(_Property_687864922a2d431dae4d25eacc436e19_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float);
            float _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float;
            Unity_Add_float(_Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float);
            float _Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float;
            Unity_Add_float(_Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float);
            float4 _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4 = IN.uv2;
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[0];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_G_2_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[1];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_B_3_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[2];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_A_4_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[3];
            float _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float;
            Unity_Smoothstep_float(_Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float, _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float, _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float);
            float _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float, _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float);
            float _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float;
            Unity_Clamp_float(_OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float, 0, 1, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float);
            float _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float);
            float _Branch_36c93485b10140698831d932acfa7872_Out_3_Float;
            Unity_Branch_float(_Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Branch_36c93485b10140698831d932acfa7872_Out_3_Float);
            float3 _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3, (_Branch_36c93485b10140698831d932acfa7872_Out_3_Float.xxx), _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3);
            float3 _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            Unity_Branch_float3(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3, _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3);
            float4 Color_4c9d480c6fdc4700b27eec94efd6d196 = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            float _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float);
            float _Property_e07dff1106094ceab44e6dbb34bda247_Out_0_Boolean = _Dynamic_Flow;
            float _Split_1d57a23557e84aa19ebba5e059647482_R_1_Float = IN.VertexColor[0];
            float _Split_1d57a23557e84aa19ebba5e059647482_G_2_Float = IN.VertexColor[1];
            float _Split_1d57a23557e84aa19ebba5e059647482_B_3_Float = IN.VertexColor[2];
            float _Split_1d57a23557e84aa19ebba5e059647482_A_4_Float = IN.VertexColor[3];
            float _Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float;
            Unity_Clamp_float(_Split_1d57a23557e84aa19ebba5e059647482_R_1_Float, 0, 1, _Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float);
            float _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float;
            Unity_OneMinus_float(_Clamp_42e787e71ab04f12a2a35ec62ceb03f0_Out_3_Float, _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float);
            float _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float;
            Unity_Branch_float(_Property_e07dff1106094ceab44e6dbb34bda247_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_b0fb33242f554522a2b35713c1a17bc6_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float);
            float _Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_0578b28c6f2c4255b19a3fe93cd4863d_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float);
            float _Property_7650c80e23dc4080b44f42e9b71348d7_Out_0_Float = _BaseEmissionMaskIntensivity_1;
            float _Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_4ed52cd0dfd7462bad9e5968280bf718_Out_3_Float, _Property_7650c80e23dc4080b44f42e9b71348d7_Out_0_Float, _Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float);
            float _Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float;
            Unity_Absolute_float(_Multiply_77b9408d165e467db9fe00e8b48c61e7_Out_2_Float, _Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float);
            float _Property_30f2a823879844dd991358fa7be7decc_Out_0_Float = _BaseEmissionMaskTreshold_1;
            float _Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float;
            Unity_Power_float(_Absolute_b7afa4dcbbc448e9b47085f3526b9b1a_Out_1_Float, _Property_30f2a823879844dd991358fa7be7decc_Out_0_Float, _Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float);
            float _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float;
            Unity_OneMinus_float(_Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float, _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float);
            float _Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_80b879b7a60b42798270f1794a9babee_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float);
            float _Property_20272825b13c4ee5b9ab9d9b2cef4bb5_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_d03a64a3083943c8a9c3f6cd9ef3c1f5_Out_3_Float, _Property_20272825b13c4ee5b9ab9d9b2cef4bb5_Out_0_Float, _Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float);
            float _Absolute_8515323330844f3798e658e697d35afb_Out_1_Float;
            Unity_Absolute_float(_Multiply_d1ef929f28c848aaa5357007a4780226_Out_2_Float, _Absolute_8515323330844f3798e658e697d35afb_Out_1_Float);
            float _Property_e75cc24d4db5474fa1117e352224621d_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float;
            Unity_Power_float(_Absolute_8515323330844f3798e658e697d35afb_Out_1_Float, _Property_e75cc24d4db5474fa1117e352224621d_Out_0_Float, _Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float);
            float _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float;
            Unity_OneMinus_float(_Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float, _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float);
            float _Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_83943f8bc63345feb16aabb6ce45ac63_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float);
            float _Property_23d03330130e4faa9a3d035dee2f4d45_Out_0_Float = _Base2EmissionMaskIntensivity;
            float _Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_d75ea7f7ba924f308adb503f8fec48b8_Out_3_Float, _Property_23d03330130e4faa9a3d035dee2f4d45_Out_0_Float, _Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float);
            float _Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float;
            Unity_Absolute_float(_Multiply_110a0280549e47aa96349be397c61bdd_Out_2_Float, _Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float);
            float _Property_cde48fe2dd424af5950a89d86cc20ec5_Out_0_Float = _Base2EmissionMaskTreshold;
            float _Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float;
            Unity_Power_float(_Absolute_e5e880d125f54580a157fd02433c75b0_Out_1_Float, _Property_cde48fe2dd424af5950a89d86cc20ec5_Out_0_Float, _Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8;
            float3 _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Power_02579924b51644aea11a4efc0bc0e953_Out_2_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Power_34f0de19a09b49e69fdf4c0e70cc4e3a_Out_2_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8, _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3);
            float _Split_e22e218cdaf04706be7068474156c218_R_1_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[0];
            float _Split_e22e218cdaf04706be7068474156c218_G_2_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[1];
            float _Split_e22e218cdaf04706be7068474156c218_B_3_Float = _HeightBlend_271ebbf23fcb47758983f15eae6e9cf8_OutVector4_1_Vector3[2];
            float _Split_e22e218cdaf04706be7068474156c218_A_4_Float = 0;
            float _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float;
            Unity_OneMinus_float(_Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float, _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float);
            float _Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float;
            Unity_Lerp_float(0, _OneMinus_a89cfa89ed43408b990058a4aaeb6ba5_Out_1_Float, _Branch_dbcfc892bdf549aab3550174648252b6_Out_3_Float, _Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float);
            float _Property_5ec10b66097e41748f33013e6748e45d_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_ea8df67c6e2341f096a8bbb55af29ec8_Out_3_Float, _Property_5ec10b66097e41748f33013e6748e45d_Out_0_Float, _Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float);
            float _Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float;
            Unity_Absolute_float(_Multiply_88dfffc6f29f47eab73aff339494816e_Out_2_Float, _Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float);
            float _Property_1e8e0ff314144f9884b91c35d74ca756_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float;
            Unity_Power_float(_Absolute_0d066ef7038041afaa282728acc1c667_Out_1_Float, _Property_1e8e0ff314144f9884b91c35d74ca756_Out_0_Float, _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float);
            float _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float;
            Unity_Clamp_float(_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float, 0, 1, _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float);
            float _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float;
            Unity_Lerp_float(_Split_e22e218cdaf04706be7068474156c218_R_1_Float, _Power_c957420e8e1648b29babfed1a02f72ad_Out_2_Float, _Clamp_e8655e25dc7c47c5be79d814873c6d5d_Out_3_Float, _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float);
            float _Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float;
            Unity_Maximum_float(_Power_27f4ead11b1d4ddb8cd5d0ab327ea693_Out_2_Float, _Lerp_8b8158ca32cb46bdbd78058cd94183a8_Out_3_Float, _Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float);
            float4 _Property_95626aa497ae4b55a696d133e3806dea_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float.xxxx), _Property_95626aa497ae4b55a696d133e3806dea_Out_0_Vector4, _Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4);
            UnityTexture2D _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float2 _Property_8e8cf89cf9884e639ec374d24ad26848_Out_0_Vector2 = _NoiseTiling;
            float4 _UV_e33a05f22f6b4c96934c0915b9938219_Out_0_Vector4 = IN.uv0;
            float2 _Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_8e8cf89cf9884e639ec374d24ad26848_Out_0_Vector2, (_UV_e33a05f22f6b4c96934c0915b9938219_Out_0_Vector4.xy), _Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2);
            float2 _Property_2b5b2bf858ff4e35aa531627c7092e0e_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float;
            Time_float(_TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float);
            float2 _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_2b5b2bf858ff4e35aa531627c7092e0e_Out_0_Vector2, (_TimeCustomFunction_a64ebbac7b694e02a1694578067e3267_Out_0_Float.xx), _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2);
            float2 _Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2;
            Unity_Add_float2(_Multiply_f5789fb43ef245589147a5fdddebf3ac_Out_2_Vector2, _Multiply_8a76e0b8edfe48beb7af21440f6575b2_Out_2_Vector2, _Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2);
            float4 _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.tex, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.samplerstate, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.GetTransformedUV(_Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2) );
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_R_4_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.r;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_G_5_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.g;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_B_6_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.b;
            float _SampleTexture2D_588289679644400f83f09ec5fba25364_A_7_Float = _SampleTexture2D_588289679644400f83f09ec5fba25364_RGBA_0_Vector4.a;
            float2 _Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_92a9a29404614c17a3f6b0686f2b2ab7_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2);
            float2 _Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2;
            Unity_Add_float2(_Multiply_bec04399b6b9472d94955a887b0ed4db_Out_2_Vector2, float2(0.5, 0.5), _Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2);
            float4 _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.tex, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.samplerstate, _Property_97edebdf73484de1879182183a5f8fa2_Out_0_Texture2D.GetTransformedUV(_Add_70ef8080529e418e8831d13ef22b76db_Out_2_Vector2) );
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_R_4_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.r;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_G_5_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.g;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_B_6_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.b;
            float _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_A_7_Float = _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_RGBA_0_Vector4.a;
            float _Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_588289679644400f83f09ec5fba25364_A_7_Float, _SampleTexture2D_c36840c6e97d40ab8783fe4d362df5c1_A_7_Float, _Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float);
            float _Property_2040d95977684d38a0058cd31a6487f5_Out_0_Float = _EmissionNoiseMultiply;
            float _Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float;
            Unity_Multiply_float_float(_Minimum_36fa6537e67a4915b51aed8a6ff8b1a8_Out_2_Float, _Property_2040d95977684d38a0058cd31a6487f5_Out_0_Float, _Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float);
            float _Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float;
            Unity_Clamp_float(_Multiply_3d9992898abf4bdd86e14baa31bb2d20_Out_2_Float, 0, 1, _Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float);
            float _Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float;
            Unity_Absolute_float(_Clamp_22035326f7494f44853faff8e1a5a2fc_Out_3_Float, _Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float);
            float _Property_92aa60daa2db494582a55735afa367c1_Out_0_Float = _EmissionNoisePower;
            float _Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float;
            Unity_Power_float(_Absolute_6e80e968cb61463298c5049f3e16884c_Out_1_Float, _Property_92aa60daa2db494582a55735afa367c1_Out_0_Float, _Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float);
            float _Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float;
            Unity_Multiply_float_float(_Power_2b87e9c507c44d46ae503f831a74de67_Out_2_Float, 20, _Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float);
            float _Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float;
            Unity_Clamp_float(_Multiply_0b73cc7895b94e99bde3709b92ee4345_Out_2_Float, 0.05, 1.2, _Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float);
            float4 _Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_4765dab3efe94c768adebb3086400563_Out_2_Vector4, (_Clamp_755cea8faf1d4094a94a4bfaa3a38ec9_Out_3_Float.xxxx), _Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4);
            float4 _Property_ffc0adc4f1d94087a4eac79b8fa7caa3_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float = _ShapeNormalStrenght_1;
            float3 _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_9f5fbbe28a9347b999dbb293f9393565_Out_0_Float, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3);
            float3 _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Uv2SupportNormalSubGraph_682bfbc6699945f2823cb5e4ee4a907d_OutVector3_1_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3);
            float3 _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_128c5a0d01454853a26e330a797f179a_Out_2_Vector3, _Branch_376393b556254c43a812ced7bf6dd743_Out_3_Vector3, _Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3);
            float _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_16c4ac023c82618b9a5117de14716c25_Out_0_Float, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3);
            float3 _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_76b1f6b709c2558a897aa152a50733b3_Out_2_Vector3, _Uv2SupportNormalSubGraph_4adaaa230c8e4d98bf8c9f41d61a9010_OutVector3_1_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3);
            float3 _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_a192ee5bed934273a1ae111863c5d251_Out_3_Vector3, _Branch_2d9439e86a24460aa7eefe1ee96c4f5c_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3);
            float3 _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3);
            float3 _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_337d63ad6393ae88af4c89b066722a45_Out_3_Vector3, _NormalBlend_8906ddb88c6941f9850d2a0fae933298_Out_2_Vector3, (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3);
            float3 _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3);
            float _DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_aeb427461bd740c49232b17b167b3af0_Out_3_Vector3, _Normalize_72a68e4a3e634880a9c299658ff0009e_Out_1_Vector3, _DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float);
            float _Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float;
            Unity_Saturate_float(_DotProduct_ae14563bf5324f208459784bc4c99844_Out_2_Float, _Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float);
            float _OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float;
            Unity_OneMinus_float(_Saturate_f4a31525eec54713b34e6752d99784ff_Out_1_Float, _OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float);
            float _Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float;
            Unity_Absolute_float(_OneMinus_4f5f500f3d51474f87c9c2689b1ee5ab_Out_1_Float, _Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float);
            float _Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float;
            Unity_Power_float(_Absolute_5b5642a095de4882ae7222c68b33e4d1_Out_1_Float, 10, _Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float);
            float4 _Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_ffc0adc4f1d94087a4eac79b8fa7caa3_Out_0_Vector4, (_Power_2076aeeeb7674ad8b03c1f7ce6d4cfd3_Out_2_Float.xxxx), _Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4);
            float _Property_f29cf33d2b734ccd9ad0e9b6ab6a63fa_Out_0_Float = _RimLightPower;
            float4 _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_f055fba61d814188b346a3e214141ba3_Out_2_Vector4, (_Property_f29cf33d2b734ccd9ad0e9b6ab6a63fa_Out_0_Float.xxxx), _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4);
            float4 _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Maximum_94212a1acf0d4c639d9ea8c8c793e60e_Out_2_Float.xxxx), _Multiply_48df7c7a93c54d2d8ab35a9b63f49606_Out_2_Vector4, _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4);
            float4 _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4;
            Unity_Add_float4(_Multiply_a434789aa2864459a6e09106b134c2fd_Out_2_Vector4, _Multiply_2132052480394e8abf4ea79e92bf0f89_Out_2_Vector4, _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4);
            float4 _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4;
            Unity_Clamp_float4(_Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4, float4(0, 0, 0, 0), _Add_49c7ed9d14fb4830a4400e758ca4033d_Out_2_Vector4, _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4);
            float4 _Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4;
            Unity_Branch_float4(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, Color_4c9d480c6fdc4700b27eec94efd6d196, _Clamp_538affdb605640848e479eb535a8f5c8_Out_3_Vector4, _Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4);
            surface.BaseColor = _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            surface.Emission = (_Branch_2995ecd3549d410cb27b7ec2bdfbb632_Out_3_Vector4.xyz);
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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
        float _Shape_Normal_Blend_Hardness;
        float _EmissionNoiseMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _Dynamic_Flow;
        float _Dynamic_Reaction_Offset;
        float _EmissionNoisePower;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float _Base2EmissionMaskTreshold;
        float _Base2EmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold_1;
        float _BaseEmissionMaskIntensivity_1;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _BaseEmissionMaskIntensivity;
        float _Wetness_T_Heat_F;
        float4 _LavaEmissionColor;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _USECoverHeightT;
        float _Shape_AO_Curvature_Reduction;
        float _ShapeNormalStrenght_1;
        float _Shape_UsePlanarUV;
        float Leaks_UV0_UV2_1;
        float _Shape_UV0_UV2;
        float4 _CoverLeaksColorMultiply;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float4 _LeaksTilingOffset;
        float4 _ShapeNormal_TexelSize;
        float _ShapeNormalStrenght_2;
        float _ShapeNormalStrenght;
        float _ShapeAORemapMin_2;
        float _ShapeAORemapMax_2;
        float _VertexColorGBlendStrenght;
        float _ShapeAORemapMin;
        float _LeaksSmoothnessMultiply_2;
        float _LeaksSmoothnessMultiply_1;
        float _ShapeAORemapMax;
        float _CurvatureBlend;
        float4 _BaseLeaksColorMultiply_1;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float4 _ShapeTilingOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float4 _CoverMaskA_TexelSize;
        float _ShapeHeightMapOffset;
        float _LeaksSmoothnessMultiply;
        float _Cover_UV0_UV2;
        float _UV0_UV2_2;
        float _UV0_UV2;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2UsePlanarUV;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
        float _USEDYNAMICCOVERTSTATICMASKF;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverUsePlanarUV;
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
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_ShapeNormal);
        SAMPLER(sampler_ShapeNormal);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, 0, _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, 0, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, 1E-05, _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Subtract_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float3(float3 In, out float3 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Blend_Multiply_float3(float3 Base, float3 Blend, out float3 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
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
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
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
            float _Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4 = _BaseTilingOffset;
            float _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean = _BaseUsePlanarUV;
            float _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean = _UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv0 = IN.uv0;
            _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4.uv2 = IN.uv2;
            float4 _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_821e07b38fd0a08d85c4dd6e5b6bbac9_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4, _PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4);
            float4 _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8ea202bae3c8428bb8265f4fd9ee7df4_XZ_2_Vector4, _Property_41859d117584758eb8002ecc938f9bce_Out_0_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4);
            UnityTexture2D _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4 = IN.uv0;
            float4 _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4 = IN.uv2;
            float4 _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4;
            Unity_Branch_float4(_Property_ebff313a94b5403dae3bb095f7d46b76_Out_0_Boolean, _UV_63620bf959064acfada9e10bb362f661_Out_0_Vector4, _UV_b4bd04ac74a941be88d60ac7790ef2e7_Out_0_Vector4, _Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4);
            float4 _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_be87af2fe0f049138df84c43c16f6328_R_1_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[0];
            float _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[1];
            float _Split_be87af2fe0f049138df84c43c16f6328_B_3_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[2];
            float _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float = _Property_0a5aea9464bc43fbbf76740f6171968f_Out_0_Vector4[3];
            float2 _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_R_1_Float, _Split_be87af2fe0f049138df84c43c16f6328_G_2_Float);
            float2 _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2 = float2(_Split_be87af2fe0f049138df84c43c16f6328_B_3_Float, _Split_be87af2fe0f049138df84c43c16f6328_A_4_Float);
            float2 _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_82e7933bea28460484077d9fa15c139f_Out_3_Vector4.xy), _Vector2_716e2a203b1a4e61bd5d88b9b61b1842_Out_0_Vector2, _Vector2_8a5c9a551e0e4a538a96ef9cb278b9d4_Out_0_Vector2, _TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2);
            float4 _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.tex, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.samplerstate, _Property_a883019f78494f7dbe864639edfc1fde_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_c876733166734aebac75f72372f24056_Out_3_Vector2) );
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.r;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_G_5_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.g;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_B_6_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.b;
            float _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_A_7_Float = _SampleTexture2D_85a6f194e4664f6c887364973d75f30d_RGBA_0_Vector4.a;
            float _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float);
            float4 _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_980b66bd73d64515b80448f8f3dceda0_Out_1_Float.xxxx), _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4, _Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4);
            float4 _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_a374afd4e1a442388f21b52eff2b7bda_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4);
            float4 _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_7a0765af235740099b88282a3c061520_Out_3_Vector4, _Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4);
            UnityTexture2D _Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4 = _ShapeTilingOffset;
            float _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean = _Shape_UsePlanarUV;
            float _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean = _Shape_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_9e3df21590054617bf700726604f0fc5;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv0 = IN.uv0;
            _PlanarNM_9e3df21590054617bf700726604f0fc5.uv2 = IN.uv2;
            float4 _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_4e644b0e65c342e18fdc818b195e1b02_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNM_9e3df21590054617bf700726604f0fc5, _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4);
            float _Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[0];
            float _Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[1];
            float _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[2];
            float _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float = _PlanarNM_9e3df21590054617bf700726604f0fc5_XZ_2_Vector4[3];
            float _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float, _OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float);
            float _Split_519202708581470b82d2ab05ac7a68cf_R_1_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[0];
            float _Split_519202708581470b82d2ab05ac7a68cf_G_2_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[1];
            float _Split_519202708581470b82d2ab05ac7a68cf_B_3_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[2];
            float _Split_519202708581470b82d2ab05ac7a68cf_A_4_Float = _Property_8d5ec2378d52421d944b057926f544fe_Out_0_Vector4[3];
            float _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float;
            Unity_Saturate_float(_Split_519202708581470b82d2ab05ac7a68cf_A_4_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float);
            float _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_c31b276466534ec7a49baa5830fe39b9_Out_1_Float, _Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float);
            float _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float;
            Unity_Clamp_float(_Multiply_455ba89facd446fd9a66788dcfeb4c01_Out_2_Float, 0, 1, _Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float);
            float4 _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_4d0f82599060228a9092027fd43912c8_Out_2_Vector4, _Multiply_ec31ce500ce44fefb214f7765bdb138d_Out_2_Vector4, (_Clamp_2229eb23f2de49a08e160aa4d6566b12_Out_3_Float.xxxx), _Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4);
            UnityTexture2D _Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b6bb43285f18e0838565e2920c32d293;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv0 = IN.uv0;
            _PlanarNM_b6bb43285f18e0838565e2920c32d293.uv2 = IN.uv2;
            float4 _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_bb9b47702e64ec8c8d8ad011fd521576_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNM_b6bb43285f18e0838565e2920c32d293, _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4);
            float _Split_b46220d232328a87b0ab1f7cf442b2da_R_1_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[0];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_G_2_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[1];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[2];
            float _Split_b46220d232328a87b0ab1f7cf442b2da_A_4_Float = _PlanarNM_b6bb43285f18e0838565e2920c32d293_XZ_2_Vector4[3];
            float _Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float = _HeightMin;
            float _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float = _HeightMax;
            float2 _Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2 = float2(_Property_a859bb55a2b9de80a42270bed0d5b617_Out_0_Float, _Property_6a5e94d6990bd38eace024b5a5366dcd_Out_0_Float);
            float _Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float = _HeightOffset;
            float2 _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_b1ffc7c201f7a28db3b61a7af725ce14_Out_0_Vector2, (_Property_f9c5ca34c6c20784b73fd90fa9dbbb70_Out_0_Float.xx), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2);
            float _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float;
            Unity_Remap_float(_Split_b46220d232328a87b0ab1f7cf442b2da_B_3_Float, float2 (0, 1), _Add_810cbda844e984809d8449d02f1fe34b_Out_2_Vector2, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float);
            UnityTexture2D _Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            float4 _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4 = _Base2TilingOffset;
            float _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean = _Base2UsePlanarUV;
            float _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean = _UV0_UV2_2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c1bb923588566183a75a0e765556574f;
            _PlanarNM_c1bb923588566183a75a0e765556574f.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv0 = IN.uv0;
            _PlanarNM_c1bb923588566183a75a0e765556574f.uv2 = IN.uv2;
            float4 _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_f0e70a431fc2958d9010b03283beee34_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_c1bb923588566183a75a0e765556574f, _PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4);
            float4 _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4 = _Base2Color;
            float4 _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c1bb923588566183a75a0e765556574f_XZ_2_Vector4, _Property_913f955d98f27d8eae1e9aa2594d6903_Out_0_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4);
            float _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float);
            float4 _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4 = _BaseLeaksColorMultiply_1;
            float4 _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_64fb1650639b4565add9aeddb2cfe45a_Out_1_Float.xxxx), _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4, _Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4);
            float4 _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_f43711a26c4945a189e708945958b33a_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4);
            float4 _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_90eb9bb84a9142578bbe6350ce98a21e_Out_3_Vector4, _Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4);
            float _Split_0f03e5552d394642ad0e560fcb603c95_R_1_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[0];
            float _Split_0f03e5552d394642ad0e560fcb603c95_G_2_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[1];
            float _Split_0f03e5552d394642ad0e560fcb603c95_B_3_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[2];
            float _Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float = _Property_8f517bfd926a4ada887561c563d303a0_Out_0_Vector4[3];
            float _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float;
            Unity_Saturate_float(_Split_0f03e5552d394642ad0e560fcb603c95_A_4_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float);
            float _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_5e20a5599a874ed2afe24bdcfa868996_Out_1_Float, _Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float);
            float _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float;
            Unity_Clamp_float(_Multiply_8820365f70cc48229ee4aa9255545954_Out_2_Float, 0, 1, _Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float);
            float4 _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_98c5efd706ed988babc5c29fc647d990_Out_2_Vector4, _Multiply_5b238f7a45b74a158da4ece15f1d9624_Out_2_Vector4, (_Clamp_d0aa1efa3a73416d91de0dbb234c42e4_Out_3_Float.xxxx), _Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4);
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_R_1_Float = IN.VertexColor[0];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_G_2_Float = IN.VertexColor[1];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float = IN.VertexColor[2];
            float _Split_c65e7224a5689389a1bbab5e86f5f2f3_A_4_Float = IN.VertexColor[3];
            float _Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean = _Invert_Layer_Mask;
            UnityTexture2D _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            float4 _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.tex, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.samplerstate, _Property_e4f36987ce299e8594a2a5fccce28358_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.r;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_G_5_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.g;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_B_6_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.b;
            float _SampleTexture2D_ac5550b56f005784b219743fdaf08340_A_7_Float = _SampleTexture2D_ac5550b56f005784b219743fdaf08340_RGBA_0_Vector4.a;
            float _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float);
            float _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float;
            Unity_Branch_float(_Property_7dd4469e1fe42e80a23268de8f2065d3_Out_0_Boolean, _OneMinus_e02c27223b4d638b86c4079d89229b60_Out_1_Float, _SampleTexture2D_ac5550b56f005784b219743fdaf08340_R_4_Float, _Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float);
            UnityTexture2D _Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv0 = IN.uv0;
            _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d.uv2 = IN.uv2;
            float4 _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_41d7b60d37a127849d09e1dd2734aaec_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d, _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4);
            float _Split_1eec1e50d2a97689ae4380a73b735288_R_1_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[0];
            float _Split_1eec1e50d2a97689ae4380a73b735288_G_2_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[1];
            float _Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[2];
            float _Split_1eec1e50d2a97689ae4380a73b735288_A_4_Float = _PlanarNM_7f1a0e238f473f8f9283ee3c842f919d_XZ_2_Vector4[3];
            float _Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float = _HeightMin2;
            float _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float = _HeightMax2;
            float2 _Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2 = float2(_Property_040e1f03f6c2558296bcbe40d45fb54a_Out_0_Float, _Property_3b0df61398e1d685acb7c9268bbe05ab_Out_0_Float);
            float _Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float = _HeightOffset2;
            float2 _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_5364f757f74cad88a0e969832588a923_Out_0_Vector2, (_Property_d382ce88f58fb386ad463f679320d9c6_Out_0_Float.xx), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2);
            float _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float;
            Unity_Remap_float(_Split_1eec1e50d2a97689ae4380a73b735288_B_3_Float, float2 (0, 1), _Add_dc6e0e48074add8d8e342fdeb48787de_Out_2_Vector2, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float);
            float _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float;
            Unity_Multiply_float_float(_Branch_1789de63467b82898d8a58cc65bd92ba_Out_3_Float, _Remap_ddff7201bd573f8895ae4fc5b7d40bf2_Out_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float);
            float _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float;
            Unity_Multiply_float_float(_Split_c65e7224a5689389a1bbab5e86f5f2f3_B_3_Float, _Multiply_bb05a41ad209278eb78db9a948be6125_Out_2_Float, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float);
            float _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float = _Height_Transition;
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_709e53664a4175808a76121d09d25807;
            float3 _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Lerp_b58068095a7b4539ac78d4787d435c23_Out_3_Vector4.xyz), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Lerp_c7a7111f84c3457ba86cac4d984468ee_Out_3_Vector4.xyz), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_709e53664a4175808a76121d09d25807, _HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3);
            float _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float;
            Unity_OneMinus_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, _OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float);
            float _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float;
            Unity_Subtract_float(_OneMinus_f99457aad97d4ffba2f274374903d92f_Out_1_Float, 0.5, _Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float);
            float3 _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3;
            Unity_Subtract_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, (_Subtract_a1ac7e1078cb43c295148ea67543dec7_Out_2_Float.xxx), _Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3);
            float _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float;
            Unity_Subtract_float(_Split_da9043c5bb624fd780298beb34f38e4c_R_1_Float, 0.5, _Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float);
            float3 _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3;
            Unity_Add_float3(_Subtract_b0c8ef8fb7c247748d77f29748832bae_Out_2_Vector3, (_Subtract_6592bdd70d9647ffb5de00fc442bc896_Out_2_Float.xxx), _Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3);
            float3 _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3;
            Unity_Saturate_float3(_Add_6a49dfc695194a4880e6fbda65165f2c_Out_2_Vector3, _Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3);
            float _Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float = _ShapeAORemapMin;
            float _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2 = float2(_Property_567d30dae7554e6ab37e7b9b8cdcdeb8_Out_0_Float, _Property_d76f2df252cf4d7193a9b6949bcab609_Out_0_Float);
            float _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_8255a12fe6c44a06902512567625f1e0_Out_0_Vector2, _Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float);
            float _Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float = _ShapeAORemapMin_2;
            float _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float = _ShapeAORemapMax_2;
            float2 _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2 = float2(_Property_4a8f533d6e6749558523ece1ddb6bbe5_Out_0_Float, _Property_32d48a2867ac40ca9713f5b12e10122a_Out_0_Float);
            float _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_G_2_Float, float2 (0, 1), _Vector2_65b913eac8e540cf8836dc93464f1c12_Out_0_Vector2, _Remap_1c754bb1be89471b968682c019c76795_Out_3_Float);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc;
            float3 _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Remap_4005d2a0c4fd49cf92f66059b9f4729d_Out_3_Float.xxx), _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, (_Remap_1c754bb1be89471b968682c019c76795_Out_3_Float.xxx), _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3);
            float _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float3 _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3;
            Unity_Blend_Multiply_float3(_Saturate_87eed3f267ef490dbf7fcb6211cbfe48_Out_1_Vector3, _HeightBlend_e9df9eb1c1254b42a17b6535e70f72cc_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, _Property_192d231648e64718b8ef279e4df706cf_Out_0_Float);
            float _Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float = _CurvatureBlend;
            float3 _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_709e53664a4175808a76121d09d25807_OutVector4_1_Vector3, _Blend_467baba0bd3547d28e7ffc7bbc6385d1_Out_2_Vector3, (_Property_4ddf8384bac5414c9b128f8bb3253831_Out_0_Float.xxx), _Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3);
            UnityTexture2D _Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4 = _CoverTilingOffset;
            float _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean = _CoverUsePlanarUV;
            float _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean = _Cover_UV0_UV2;
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv0 = IN.uv0;
            _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1.uv2 = IN.uv2;
            float4 _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_a155ddc33ed90685a5ab0edcf158a343_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1, _PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4);
            float4 _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_c2fe9ab385b28685a6123a5c44b88fd1_XZ_2_Vector4, _Property_c3be5593fd661b8dafbd04f26b8ec9ac_Out_0_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4);
            float _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float, _OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float);
            float4 _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_55eeb682d5d9450caf236aecb73cd772_Out_1_Float.xxxx), _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4, _Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4);
            float4 _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_e5b4f2c5ac3943b6aea138b5559a31d4_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_85a6f194e4664f6c887364973d75f30d_R_4_Float.xxxx), _Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4);
            float4 _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_c2bf97504183469eb71fe291ba5138e6_Out_3_Vector4, _Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4);
            float _Split_d939850bd1f04161bc06637ccd78d716_R_1_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[0];
            float _Split_d939850bd1f04161bc06637ccd78d716_G_2_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[1];
            float _Split_d939850bd1f04161bc06637ccd78d716_B_3_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[2];
            float _Split_d939850bd1f04161bc06637ccd78d716_A_4_Float = _Property_308d47afc78c4708a7d18c8ca94be8a3_Out_0_Vector4[3];
            float _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float;
            Unity_Saturate_float(_Split_d939850bd1f04161bc06637ccd78d716_A_4_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float);
            float _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_2aebf8643793447a98d2e138ac50500b_Out_1_Float, _Saturate_386f280598c448039cb6a962989f54f6_Out_1_Float, _Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float);
            float _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float;
            Unity_Clamp_float(_Multiply_c8bcb9a57b7149ceb3facf6da03ae392_Out_2_Float, 0, 1, _Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float);
            float4 _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b08794693505bd8e8c04b9ba1610d394_Out_2_Vector4, _Multiply_e04c71069ae3438c9a591b38c951f337_Out_2_Vector4, (_Clamp_3ed898797fd14483a006245e8cc6c845_Out_3_Float.xxxx), _Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4);
            float _Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float = _ShapeHeightMapMin;
            float _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2 = float2(_Property_6e5d80e206994d8a842301f08ddeebf3_Out_0_Float, _Property_113f0f02d3dd4fcf8f0b47b29892a6a7_Out_0_Float);
            float _Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2;
            Unity_Add_float2(_Vector2_ae5df9a571bf433a844147ee462d623a_Out_0_Vector2, (_Property_e3c3f2d7efb847c697440efb0e026d58_Out_0_Float.xx), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2);
            float _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float;
            Unity_Remap_float(_Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, float2 (0, 1), _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float);
            UnityTexture2D _Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormal);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv0 = IN.uv0;
            _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec.uv2 = IN.uv2;
            float4 _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_71f5e3520f0f4b07928633d036c2fa85_Out_0_Texture2D, _Property_57e7b489e69a4049bb7c6c039e3bd734_Out_0_Vector4, _Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec, _PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4);
            float _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float = _ShapeNormalStrenght;
            float3 _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_464e20c83d40416d8fe627e08c6b1b2f_Out_0_Float, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3);
            float3 _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Uv2SupportNormalSubGraph_902b45859bf4492ab588bc4db0197d0b_OutVector3_1_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3);
            float3 _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_07cede78c62940ae849d5b2592c38451_Out_2_Vector3, _Branch_de5bdb95587742b28bbb1a3aae96747a_Out_3_Vector3, _Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3);
            UnityTexture2D _Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_692960de14d47b8dbfb207b3e9f74790;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv0 = IN.uv0;
            _PlanarNMn_692960de14d47b8dbfb207b3e9f74790.uv2 = IN.uv2;
            float4 _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_147b07430832c98eb0a470557ee61c5e_Out_0_Texture2D, _Property_8ec0d512145619859d288abab740e3bf_Out_0_Vector4, _Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790, _PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4);
            float _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_692960de14d47b8dbfb207b3e9f74790_XZ_2_Vector4.xyz), _Property_72e436a108ad64868e46d548c585c5f3_Out_0_Float, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3);
            float3 _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3;
            Unity_Branch_float3(_Property_4d6673db70b3ce8da03e0692dd529e45_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Uv2SupportNormalSubGraph_817ce1cbc1fc4e159ec022d471d1e628_OutVector3_1_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3);
            float3 _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3;
            Unity_Branch_float3(_Property_4941c9d0163c47e8915c734e2435ad13_Out_0_Boolean, _NormalStrength_366affc5c8b42482a633d201ef52b9d6_Out_2_Vector3, _Branch_df82d0fb30d3471a8f907d76074a2d21_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3);
            float3 _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_84a039f5920c40e9bf7ef5102f133950_Out_3_Vector3, _Branch_80f8dd7f89634249b0471c46ceb35f03_Out_3_Vector3, _NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3);
            float _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float = _ShapeNormalStrenght_2;
            float3 _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_d14b595e20c340b59b9bc39b33086813_Out_0_Float, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3);
            float3 _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Uv2SupportNormalSubGraph_fd01c193074041d8b97e768fd3318aa5_OutVector3_1_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3);
            float3 _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_74513f4cc1ea49dfb245578d1f681515_Out_2_Vector3, _Branch_98403c1c6d194e90a687895f5bbc5fe2_Out_3_Vector3, _Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3);
            UnityTexture2D _Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv0 = IN.uv0;
            _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a.uv2 = IN.uv2;
            float4 _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_30f2c188c6b1e688ae667a89dbd70992_Out_0_Texture2D, _Property_505b745e4ff42080ba6edcadb9575a6a_Out_0_Vector4, _Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a, _PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4);
            float _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float = _Base2NormalScale;
            float3 _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_6cd9e5494e0bde88a9d45564daf0821a_XZ_2_Vector4.xyz), _Property_13b1e8709820828195ef548d1d72ea04_Out_0_Float, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3);
            float3 _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3;
            Unity_Branch_float3(_Property_718c7cdcb1012680ab3b95462b4787c7_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Uv2SupportNormalSubGraph_9a0ee51abfd14b8fb0d0ade40943f85e_OutVector3_1_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3);
            float3 _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3;
            Unity_Branch_float3(_Property_03be90c3f55748fd8bc0b79d3920ca78_Out_0_Boolean, _NormalStrength_61e15bbaec29ca8098158de814ef56cb_Out_2_Vector3, _Branch_d0a68b7f8f334eeb98e9725df93c3b7d_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3);
            float3 _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_1be5294a5ac646eeab926d3d91c4dd6a_Out_3_Vector3, _Branch_84c03b61bd4c4ff8b787b25c228bae6d_Out_3_Vector3, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3);
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6;
            float3 _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalBlend_cd5af74bfbdf4068a73faa0875cc06ac_Out_2_Vector3, _Remap_a62dc18837275d80ad5024009a6623c0_Out_3_Float, _NormalBlend_71b1b83ed6ea47e996bb32d10af03847_Out_2_Vector3, _Multiply_2dde019faacbd985b8ab02075846c96a_Out_2_Float, _Property_088fd1efe6b3f6879705588500bf30bc_Out_0_Float, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6, _HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3);
            float _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float = _Shape_Normal_Blend_Hardness;
            float3 _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2a0848412f5348f5bf997dd031e7d6ec_XZ_2_Vector4.xyz), _Property_3c142ec6044147879db1b24469d1039b_Out_0_Float, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3);
            float3 _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3;
            Unity_Branch_float3(_Property_084d93f81576462696f14aaeb2cab3b2_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Uv2SupportNormalSubGraph_e98493cea407498b9564e1a3386df996_OutVector3_1_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3);
            float3 _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3;
            Unity_Branch_float3(_Property_0492029452804fdf97da9854039729f6_Out_0_Boolean, _NormalStrength_f2af47d097f04b75b36bf7d8eac36eb6_Out_2_Vector3, _Branch_306775e98d2a46ee8687e63912215d19_Out_3_Vector3, _Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3);
            UnityTexture2D _Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_2e288bef98384580aaab10e906ca8004;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv0 = IN.uv0;
            _PlanarNMn_2e288bef98384580aaab10e906ca8004.uv2 = IN.uv2;
            float4 _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_d7e9139e0ac6718b89c610009c28a25a_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNMn_2e288bef98384580aaab10e906ca8004, _PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4);
            float _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_2e288bef98384580aaab10e906ca8004_XZ_2_Vector4.xyz), _Property_68a36c67be59b187b5d72cfb5dddf7b6_Out_0_Float, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3);
            Bindings_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceNormal = IN.WorldSpaceNormal;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceTangent = IN.WorldSpaceTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79.uv2 = IN.uv2;
            float3 _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3;
            SG_Uv2SupportNormalSubGraph_1de47b14feb224149a48b39e78e2d690_float(_NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3);
            float3 _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3;
            Unity_Branch_float3(_Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Uv2SupportNormalSubGraph_2dc675f63d5b45eab1cb6152d3c45f79_OutVector3_1_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3);
            float3 _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3;
            Unity_Branch_float3(_Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _NormalStrength_c1926aecf0513f85b06338b911ba9f25_Out_2_Vector3, _Branch_de1f17957ac84e5587fda21bb12b5932_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3);
            float3 _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3;
            Unity_NormalBlend_float(_Branch_eeba5a5338b748ac9bbf71abf7439001_Out_3_Vector3, _Branch_e1ee7b8a13294ec594de3123907135ac_Out_3_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3);
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
            float _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float;
            Unity_Absolute_float(_Divide_c77b003bf1ce13828c94a705676e2b30_Out_2_Float, _Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float);
            float _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float;
            Unity_Power_float(_Absolute_038668b520b9f881b481295308b8e0cc_Out_1_Float, _Subtract_e5dc2afce7ff588fa1d4c91f78de7575_Out_2_Float, _Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float);
            float _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float;
            Unity_Clamp_float(_Power_a9431dbce44a528f9ee7095adfa10556_Out_2_Float, 0, 2, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float);
            float _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float;
            Unity_Multiply_float_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float);
            float _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float;
            Unity_Saturate_float(_Multiply_143da4886728ff868f10e9cfa6940ea0_Out_2_Float, _Saturate_04686ab19029f68c8fb9e7a115b207b1_Out_1_Float);
            float _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float;
            Unity_Clamp_float(_Split_8ff22a6bdd437780ac7ea5963e1c5bb4_G_2_Float, 0, 0.9999, _Clamp_9c0a88ffc7be288cbe97d3e13a014fe8_Out_3_Float);
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
            float _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float;
            Unity_Absolute_float(_Multiply_89aeffc0ad067981a18e6a77948b2b49_Out_2_Float, _Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float);
            float _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float = _CoverHardness;
            float _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float;
            Unity_Power_float(_Absolute_4749211e3f93688391cb85ee88f054d8_Out_1_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Power_ca1f1906c90fb785bfe520b7faefc3cd_Out_2_Float);
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
            Unity_Lerp_float3(_HeightBlend_a07ffbde1a54da85a9f0a69f314eacd6_OutVector4_1_Vector3, _NormalBlend_3e97cd6837e249409d40dc081dec3022_Out_2_Vector3, (_Multiply_edc44afd10069b8e80460ceee1cba8f0_Out_2_Float.xxx), _Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3);
            float3 _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_05179f1a9a06b084b2d83e8bce908cce_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_R_1_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[0];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[1];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_B_3_Float = _Transform_7b989d7e334602829978dc745a2baca5_Out_1_Vector3[2];
            float _Split_44ee9f8d0d54618cabce22ec49a8e7d3_A_4_Float = 0;
            float _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float;
            Unity_Multiply_float_float(_Split_44ee9f8d0d54618cabce22ec49a8e7d3_G_2_Float, _Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float);
            float _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_815ffdd53cc1c889aa00f73784cb71e7_Out_3_Float, _Property_4879e96694aee98c9d4ecd329a571123_Out_0_Float, _Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float);
            float _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_1e7ca8eeb2afb68a96897072c537d835_Out_2_Float, _Multiply_4a38c41b77a2458085ff4ae52ba3c21c_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float);
            float _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_61fc6a92f0e952858b5d99f2caeb09a3_Out_2_Float, _Multiply_a16d49a3ef8d76899c86b7d84d20ef1f_Out_2_Float, _Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float);
            float _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float;
            Unity_Saturate_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float);
            float _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float;
            Unity_Multiply_float_float(_Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Saturate_f01f7b728aa04bc9b201ece3b7c6c92e_Out_1_Float, _Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float);
            float _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float;
            Unity_Clamp_float(_Multiply_5ecb9ba180194ac69a2485c75f56a3b5_Out_2_Float, 0, 1, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float);
            UnityTexture2D _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.tex, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.samplerstate, _Property_1ed428f8d2d645ceae443a1c642f29b4_Out_0_Texture2D.GetTransformedUV((_UV_429c95affe88aa8694076115c99a0769_Out_0_Vector4.xy)) );
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_R_4_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.r;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_G_5_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.g;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_B_6_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.b;
            float _SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float = _SampleTexture2D_2723da80b8a2528381ef199c0415beae_RGBA_0_Vector4.a;
            float _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float = _CoverMaskPower;
            float _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2723da80b8a2528381ef199c0415beae_A_7_Float, _Property_4598a5959afa5685b13cb10bef3e3b8d_Out_0_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float);
            float _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Clamp_cbdc78d64ad34ce094ca6bb7cdc8cc05_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float);
            float _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float;
            Unity_Clamp_float(_Branch_e914c3a082e74fd3a8c7e5b70fb0794a_Out_3_Float, 0, 1, _Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float);
            float _Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv0 = IN.uv0;
            _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792.uv2 = IN.uv2;
            float4 _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3702de305e11e085a40d7731b582d541_Out_0_Texture2D, _Property_256beda96caf2d8aa05d3de41fc08d3d_Out_0_Vector4, _Property_162708fdf26bb986a9d5db43afc4f8e1_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), _Property_1d36713dbd524add9667d8f4fc81ef4e_Out_0_Boolean, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792, _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4);
            float _Split_1ef51260eb09388e8cdae9167826d51b_R_1_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[0];
            float _Split_1ef51260eb09388e8cdae9167826d51b_G_2_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[1];
            float _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[2];
            float _Split_1ef51260eb09388e8cdae9167826d51b_A_4_Float = _PlanarNM_a94e5fcc3a22808d84a3ea26bcf69792_XZ_2_Vector4[3];
            float _Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float = _CoverHeightMapMin;
            float _Property_2b4b16173941968fbecea0823b164445_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2 = float2(_Property_ba1b8c5efd5601899ed0dcccc561a69e_Out_0_Float, _Property_2b4b16173941968fbecea0823b164445_Out_0_Float);
            float _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2;
            Unity_Add_float2(_Vector2_1f93fdd913f3998abfc7d79aa3275820_Out_0_Vector2, (_Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float.xx), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2);
            float _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float;
            Unity_Remap_float(_Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, float2 (0, 1), _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float);
            float _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float;
            Unity_Add_float(_Property_2b4b16173941968fbecea0823b164445_Out_0_Float, _Property_7aaf6f0977047a809a6721a4b0ae96a9_Out_0_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float);
            float _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float;
            Unity_Branch_float(_Property_e5da3d21d5884f00b421b049236f1539_Out_0_Boolean, _Remap_4af7360438304e8b9a247168cf9a60cf_Out_3_Float, _Add_8660a13e296a4a4e86931bb49323b91e_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float);
            float _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_dd6ce40548593687a3441a83047275eb_Out_2_Float, _Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float);
            float _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float;
            Unity_Saturate_float(_Multiply_435f6b8a2f35bc809d29f45620bebb21_Out_2_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float);
            float _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_321136d2adf641b9bbd724a54231229e_Out_3_Float, _Saturate_269cfab86e2abe83819a3afa7b3eeda2_Out_1_Float, _Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float);
            float _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float;
            Unity_Clamp_float(_Multiply_c1b6707e1b5d0482a9a356293cec8e5e_Out_2_Float, 0, 1, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float);
            float _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float;
            Unity_Branch_float(_Property_8bd3fc736f4d4cc2a726505075c4922e_Out_0_Boolean, _Remap_bec0d7bb47a94f6eb2bd4e5f0195d682_Out_3_Float, _Multiply_5448c38b13b40c89bd8699ceebd8a170_Out_2_Float, _Branch_c4f2625143cb430381042fc94963e665_Out_3_Float);
            float _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float;
            Unity_Clamp_float(_Branch_c4f2625143cb430381042fc94963e665_Out_3_Float, 0, 1, _Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float);
            float _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float;
            Unity_Saturate_float(_Branch_2a4bfc16543845299a0cc1387b466b1d_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float);
            float _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_47979121c1174a48b5d7dbef22304525_Out_3_Float, _Saturate_cf870877e8924461b02b187ce2efb592_Out_1_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float);
            float _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float;
            Unity_Branch_float(_Property_6f5d4caef2e7c086a710795e7a3b2dfe_Out_0_Boolean, _Clamp_3325d3fc24974984a21aaa67fd7a7715_Out_3_Float, _Multiply_8c0a87aba5ba414fa6aecff0fee7100e_Out_2_Float, _Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float);
            float3 _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_705635868c16467fa64c77ba2a442409_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_Branch_62fc69a5139f0a85b6e4ca2dbebb3010_Out_3_Float.xxx), _Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3);
            float _Split_024016837c0544d9831785fe96f214ec_R_1_Float = IN.VertexColor[0];
            float _Split_024016837c0544d9831785fe96f214ec_G_2_Float = IN.VertexColor[1];
            float _Split_024016837c0544d9831785fe96f214ec_B_3_Float = IN.VertexColor[2];
            float _Split_024016837c0544d9831785fe96f214ec_A_4_Float = IN.VertexColor[3];
            float _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2;
            float _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_024016837c0544d9831785fe96f214ec_G_2_Float, _Property_d25550b3c90741028d048dd49167aeba_Out_0_Float, _Split_da9043c5bb624fd780298beb34f38e4c_B_3_Float, _Property_7d43ec6993b749f48d1496a2c598bdae_Out_0_Boolean, _Split_1ef51260eb09388e8cdae9167826d51b_B_3_Float, _Property_7419a62de19b4173a0547d1517d050a6_Out_0_Boolean, _Add_2634f2e204f24f129b1db64f624d8555_Out_2_Vector2, _Add_d8e352a2ddee3983892b85b8a37a9d71_Out_2_Vector2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2, _ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float);
            float3 _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_562b79f1df34b88e9a8a7431d434b435_Out_3_Vector3, (_Lerp_6f1e064494ec4b9f83bb96737bc6bcd2_Out_3_Vector4.xyz), (_ShapeHeighblend_36c2d44e796348caa37864fa085e29b2_OutVector1_1_Float.xxx), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3);
            float4 _Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4 = _WetColor;
            float3 _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_3ef757d184da9889bc95e8a2d632324d_Out_0_Vector4.xyz), _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3);
            float _Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean = _Dynamic_Flow;
            float _Split_84671236d01d4966adfadf83f8f1d569_R_1_Float = IN.VertexColor[0];
            float _Split_84671236d01d4966adfadf83f8f1d569_G_2_Float = IN.VertexColor[1];
            float _Split_84671236d01d4966adfadf83f8f1d569_B_3_Float = IN.VertexColor[2];
            float _Split_84671236d01d4966adfadf83f8f1d569_A_4_Float = IN.VertexColor[3];
            float _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float;
            Unity_OneMinus_float(_Split_84671236d01d4966adfadf83f8f1d569_R_1_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float);
            float _Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_687864922a2d431dae4d25eacc436e19_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float;
            Time_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float);
            float _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_bcddd098b96644eba6496ca414f77e23_Out_0_Float, _Property_b37e19ec99ab467ca3262bd1ed6432d6_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float);
            float _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float;
            Unity_Add_float(_Property_687864922a2d431dae4d25eacc436e19_Out_0_Float, _Multiply_d0c0e992541c43d0897c606236d69b76_Out_2_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float);
            float _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float;
            Unity_Add_float(_Property_27a8b6e0948d4b9ebf5f0db1539da029_Out_0_Float, _Add_3b86be7205e14294bcb8543cc1661d1c_Out_2_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float);
            float _Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float;
            Unity_Add_float(_Property_381062b025834c0fa0cc8a598b8f2e7e_Out_0_Float, _Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float);
            float4 _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4 = IN.uv2;
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[0];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_G_2_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[1];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_B_3_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[2];
            float _Split_a4ca8022238342c5b2e40e6c12b3d5d8_A_4_Float = _UV_0a99681d0157445dbbc199ecab2ef2f5_Out_0_Vector4[3];
            float _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float;
            Unity_Smoothstep_float(_Add_5f77e85892a346deaec62539ed42c0cd_Out_2_Float, _Add_250b5df4f1e64b59a7b7e0d2fb897475_Out_2_Float, _Split_a4ca8022238342c5b2e40e6c12b3d5d8_R_1_Float, _Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float);
            float _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_62023e16da154d279dae1c3888239e9d_Out_3_Float, _OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float);
            float _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float;
            Unity_Clamp_float(_OneMinus_dad94c8ea5424d4497a098d1529c4322_Out_1_Float, 0, 1, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float);
            float _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Clamp_9607428bef124acd9b9043f992196aa3_Out_3_Float, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float);
            float _Branch_36c93485b10140698831d932acfa7872_Out_3_Float;
            Unity_Branch_float(_Property_7790e0c5c389419f9099807fb6ccef3a_Out_0_Boolean, _Multiply_dd9081287ce0435b817661e9b467d491_Out_2_Float, _OneMinus_7fe3eec357614f5a8e7f5fd5ab0063bf_Out_1_Float, _Branch_36c93485b10140698831d932acfa7872_Out_3_Float);
            float3 _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Multiply_31d5c3c7401d728f9c65f85d00f51ca5_Out_2_Vector3, (_Branch_36c93485b10140698831d932acfa7872_Out_3_Float.xxx), _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3);
            float3 _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            Unity_Branch_float3(_Property_3a169e273f284172abac9b4db667de02_Out_0_Boolean, _Lerp_c2c1091736bf7f849e83df1c9c02b850_Out_3_Vector3, _Lerp_e2cb01680fca43e8899979c737993d7a_Out_3_Vector3, _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3);
            surface.BaseColor = _Branch_78cf305599d047fbab08e85e5bcd4e2c_Out_3_Vector3;
            surface.Alpha = _Split_da9043c5bb624fd780298beb34f38e4c_A_4_Float;
            surface.AlphaClipThreshold = 0.5;
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