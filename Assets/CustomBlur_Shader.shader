// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33283,y:32896,varname:node_9361,prsc:2|custl-3841-OUT;n:type:ShaderForge.SFN_ScreenPos,id:3117,x:31456,y:32228,varname:node_3117,prsc:2,sctp:2;n:type:ShaderForge.SFN_SceneColor,id:2727,x:31619,y:32952,varname:node_2727,prsc:2|UVIN-5-OUT;n:type:ShaderForge.SFN_Set,id:3954,x:31663,y:32228,varname:__screenpos,prsc:2|IN-3117-UVOUT;n:type:ShaderForge.SFN_Get,id:3176,x:30851,y:33479,varname:node_3176,prsc:2|IN-3954-OUT;n:type:ShaderForge.SFN_Slider,id:1320,x:30764,y:32232,ptovrint:False,ptlb:Offset,ptin:_Offset,varname:node_1320,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.02260575,max:0.05;n:type:ShaderForge.SFN_Set,id:9203,x:31218,y:32262,varname:__offset,prsc:2|IN-4239-OUT;n:type:ShaderForge.SFN_Get,id:7513,x:30851,y:33548,varname:node_7513,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Add,id:1565,x:31120,y:33479,varname:node_1565,prsc:2|A-3176-OUT,B-7513-OUT;n:type:ShaderForge.SFN_Set,id:699,x:31663,y:32287,varname:__screenposU,prsc:2|IN-3117-U;n:type:ShaderForge.SFN_Set,id:7026,x:31663,y:32340,varname:__screenposV,prsc:2|IN-3117-V;n:type:ShaderForge.SFN_Get,id:1124,x:30843,y:32743,varname:node_1124,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:5080,x:30843,y:32797,varname:node_5080,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Add,id:2290,x:31113,y:32780,varname:node_2290,prsc:2|A-1124-OUT,B-5080-OUT;n:type:ShaderForge.SFN_Append,id:7049,x:31376,y:32776,varname:node_7049,prsc:2|A-2290-OUT,B-340-OUT;n:type:ShaderForge.SFN_Get,id:340,x:31092,y:32725,varname:node_340,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:6782,x:31092,y:32901,varname:node_6782,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Add,id:3650,x:31113,y:32958,varname:node_3650,prsc:2|A-6413-OUT,B-148-OUT;n:type:ShaderForge.SFN_Get,id:6413,x:30843,y:32948,varname:node_6413,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:148,x:30843,y:33002,varname:node_148,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Append,id:5,x:31376,y:32952,varname:node_5,prsc:2|A-6782-OUT,B-3650-OUT;n:type:ShaderForge.SFN_SceneColor,id:3764,x:31619,y:32776,varname:node_3764,prsc:2|UVIN-7049-OUT;n:type:ShaderForge.SFN_Add,id:1654,x:31832,y:32861,varname:node_1654,prsc:2|A-608-RGB,B-3764-RGB,C-2727-RGB,D-9661-RGB,E-231-RGB;n:type:ShaderForge.SFN_Divide,id:3841,x:32356,y:33127,varname:node_3841,prsc:2|A-2643-OUT,B-350-OUT;n:type:ShaderForge.SFN_Vector1,id:350,x:32312,y:33041,varname:node_350,prsc:2,v1:18;n:type:ShaderForge.SFN_SceneColor,id:608,x:31619,y:32558,varname:node_608,prsc:2|UVIN-7034-OUT;n:type:ShaderForge.SFN_Get,id:7034,x:31285,y:32558,varname:node_7034,prsc:2|IN-3954-OUT;n:type:ShaderForge.SFN_Get,id:9966,x:30850,y:33108,varname:node_9966,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:8617,x:30850,y:33162,varname:node_8617,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Get,id:9697,x:30850,y:33303,varname:node_9697,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:5708,x:30850,y:33352,varname:node_5708,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Get,id:1342,x:31099,y:33091,varname:node_1342,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:7349,x:31099,y:33267,varname:node_7349,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Append,id:9741,x:31383,y:33141,varname:node_9741,prsc:2|A-8284-OUT,B-1342-OUT;n:type:ShaderForge.SFN_Append,id:8680,x:31383,y:33317,varname:node_8680,prsc:2|A-7349-OUT,B-1571-OUT;n:type:ShaderForge.SFN_SceneColor,id:231,x:31626,y:33317,varname:node_231,prsc:2|UVIN-8680-OUT;n:type:ShaderForge.SFN_SceneColor,id:9661,x:31626,y:33141,varname:node_9661,prsc:2|UVIN-9741-OUT;n:type:ShaderForge.SFN_Subtract,id:8284,x:31120,y:33146,varname:node_8284,prsc:2|A-9966-OUT,B-8617-OUT;n:type:ShaderForge.SFN_Subtract,id:1571,x:31120,y:33320,varname:node_1571,prsc:2|A-9697-OUT,B-5708-OUT;n:type:ShaderForge.SFN_SceneColor,id:7886,x:31626,y:33479,varname:node_7886,prsc:2|UVIN-1565-OUT;n:type:ShaderForge.SFN_Add,id:3741,x:31875,y:33479,varname:node_3741,prsc:2|A-7886-RGB,B-9856-RGB,C-6948-RGB,D-9102-RGB;n:type:ShaderForge.SFN_Subtract,id:1892,x:31120,y:33672,varname:node_1892,prsc:2|A-3176-OUT,B-7513-OUT;n:type:ShaderForge.SFN_SceneColor,id:9856,x:31626,y:33672,varname:node_9856,prsc:2|UVIN-1892-OUT;n:type:ShaderForge.SFN_Get,id:9563,x:30723,y:33873,varname:node_9563,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:9716,x:30723,y:34005,varname:node_9716,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:4182,x:30723,y:33936,varname:node_4182,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Add,id:2730,x:31036,y:33848,varname:node_2730,prsc:2|A-9563-OUT,B-4182-OUT;n:type:ShaderForge.SFN_Subtract,id:5755,x:31036,y:33994,varname:node_5755,prsc:2|A-9716-OUT,B-4182-OUT;n:type:ShaderForge.SFN_Append,id:7770,x:31335,y:33936,varname:node_7770,prsc:2|A-2730-OUT,B-5755-OUT;n:type:ShaderForge.SFN_SceneColor,id:6948,x:31644,y:33940,varname:node_6948,prsc:2|UVIN-7770-OUT;n:type:ShaderForge.SFN_SceneColor,id:9102,x:31634,y:34255,varname:node_9102,prsc:2|UVIN-5375-OUT;n:type:ShaderForge.SFN_Append,id:5375,x:31325,y:34251,varname:node_5375,prsc:2|A-408-OUT,B-120-OUT;n:type:ShaderForge.SFN_Add,id:408,x:31026,y:34163,varname:node_408,prsc:2|A-2244-OUT,B-127-OUT;n:type:ShaderForge.SFN_Subtract,id:120,x:31026,y:34309,varname:node_120,prsc:2|A-2237-OUT,B-127-OUT;n:type:ShaderForge.SFN_Get,id:2244,x:30713,y:34188,varname:node_2244,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:127,x:30713,y:34251,varname:node_127,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Get,id:2237,x:30713,y:34320,varname:node_2237,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Add,id:2643,x:32115,y:33127,varname:node_2643,prsc:2|A-1654-OUT,B-3741-OUT,C-7103-OUT;n:type:ShaderForge.SFN_Distance,id:3611,x:30637,y:32431,varname:node_3611,prsc:2|A-1340-XYZ,B-1784-XYZ;n:type:ShaderForge.SFN_ObjectPosition,id:1340,x:30376,y:32373,varname:node_1340,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:1784,x:30376,y:32514,varname:node_1784,prsc:2;n:type:ShaderForge.SFN_Divide,id:4239,x:31028,y:32313,varname:node_4239,prsc:2|A-1320-OUT,B-9409-OUT;n:type:ShaderForge.SFN_Log,id:7879,x:30809,y:32421,varname:node_7879,prsc:2,lt:0|IN-3611-OUT;n:type:ShaderForge.SFN_Divide,id:9409,x:30964,y:32431,varname:node_9409,prsc:2|A-3611-OUT,B-7879-OUT;n:type:ShaderForge.SFN_Get,id:8608,x:31342,y:34533,varname:node_8608,prsc:2|IN-3954-OUT;n:type:ShaderForge.SFN_SceneColor,id:9753,x:31676,y:34533,varname:node_9753,prsc:2|UVIN-8608-OUT;n:type:ShaderForge.SFN_SceneColor,id:2008,x:31676,y:34751,varname:node_2008,prsc:2|UVIN-2525-OUT;n:type:ShaderForge.SFN_SceneColor,id:7729,x:31676,y:34927,varname:node_7729,prsc:2|UVIN-6336-OUT;n:type:ShaderForge.SFN_SceneColor,id:9864,x:31683,y:35116,varname:node_9864,prsc:2|UVIN-3806-OUT;n:type:ShaderForge.SFN_SceneColor,id:7446,x:31683,y:35292,varname:node_7446,prsc:2|UVIN-9723-OUT;n:type:ShaderForge.SFN_SceneColor,id:5136,x:31683,y:35454,varname:node_5136,prsc:2|UVIN-4093-OUT;n:type:ShaderForge.SFN_SceneColor,id:2100,x:31683,y:35647,varname:node_2100,prsc:2|UVIN-5051-OUT;n:type:ShaderForge.SFN_SceneColor,id:4370,x:31701,y:35915,varname:node_4370,prsc:2|UVIN-2885-OUT;n:type:ShaderForge.SFN_SceneColor,id:8588,x:31691,y:36230,varname:node_8588,prsc:2|UVIN-5396-OUT;n:type:ShaderForge.SFN_Add,id:3897,x:31932,y:35454,varname:node_3897,prsc:2|A-5136-RGB,B-2100-RGB,C-4370-RGB,D-8588-RGB;n:type:ShaderForge.SFN_Add,id:7008,x:31889,y:34836,varname:node_7008,prsc:2|A-9753-RGB,B-2008-RGB,C-7729-RGB,D-9864-RGB,E-7446-RGB;n:type:ShaderForge.SFN_Append,id:2525,x:31433,y:34751,varname:node_2525,prsc:2|A-2788-OUT,B-3364-OUT;n:type:ShaderForge.SFN_Append,id:6336,x:31433,y:34927,varname:node_6336,prsc:2|A-7860-OUT,B-9648-OUT;n:type:ShaderForge.SFN_Append,id:3806,x:31440,y:35116,varname:node_3806,prsc:2|A-4605-OUT,B-475-OUT;n:type:ShaderForge.SFN_Append,id:9723,x:31440,y:35292,varname:node_9723,prsc:2|A-8776-OUT,B-3870-OUT;n:type:ShaderForge.SFN_Append,id:2885,x:31392,y:35911,varname:node_2885,prsc:2|A-8044-OUT,B-2315-OUT;n:type:ShaderForge.SFN_Append,id:5396,x:31382,y:36226,varname:node_5396,prsc:2|A-4374-OUT,B-1114-OUT;n:type:ShaderForge.SFN_Subtract,id:1114,x:31083,y:36284,varname:node_1114,prsc:2|A-8459-OUT,B-616-OUT;n:type:ShaderForge.SFN_Add,id:4374,x:31083,y:36138,varname:node_4374,prsc:2|A-349-OUT,B-616-OUT;n:type:ShaderForge.SFN_Subtract,id:2315,x:31093,y:35969,varname:node_2315,prsc:2|A-3002-OUT,B-7252-OUT;n:type:ShaderForge.SFN_Add,id:8044,x:31093,y:35823,varname:node_8044,prsc:2|A-8332-OUT,B-7252-OUT;n:type:ShaderForge.SFN_Subtract,id:5051,x:31177,y:35647,varname:node_5051,prsc:2|A-3148-OUT,B-1218-OUT;n:type:ShaderForge.SFN_Add,id:4093,x:31177,y:35454,varname:node_4093,prsc:2|A-3148-OUT,B-1218-OUT;n:type:ShaderForge.SFN_Subtract,id:3870,x:31177,y:35295,varname:node_3870,prsc:2|A-6328-OUT,B-1307-OUT;n:type:ShaderForge.SFN_Subtract,id:4605,x:31177,y:35121,varname:node_4605,prsc:2|A-4375-OUT,B-5602-OUT;n:type:ShaderForge.SFN_Add,id:9648,x:31170,y:34933,varname:node_9648,prsc:2|A-7382-OUT,B-7831-OUT;n:type:ShaderForge.SFN_Add,id:2788,x:31170,y:34755,varname:node_2788,prsc:2|A-3028-OUT,B-2396-OUT;n:type:ShaderForge.SFN_Get,id:3364,x:31149,y:34700,varname:node_3364,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:7860,x:31149,y:34876,varname:node_7860,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:475,x:31156,y:35066,varname:node_475,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:8776,x:31156,y:35242,varname:node_8776,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:3028,x:30900,y:34718,varname:node_3028,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:2396,x:30900,y:34772,varname:node_2396,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Get,id:7382,x:30900,y:34923,varname:node_7382,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:7831,x:30900,y:34977,varname:node_7831,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Get,id:4375,x:30907,y:35083,varname:node_4375,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:5602,x:30907,y:35137,varname:node_5602,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Get,id:6328,x:30907,y:35278,varname:node_6328,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:1307,x:30907,y:35327,varname:node_1307,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Get,id:3148,x:30908,y:35454,varname:node_3148,prsc:2|IN-3954-OUT;n:type:ShaderForge.SFN_Get,id:1218,x:30908,y:35523,varname:node_1218,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Get,id:8332,x:30780,y:35848,varname:node_8332,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Get,id:7252,x:30780,y:35911,varname:node_7252,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Get,id:3002,x:30780,y:35980,varname:node_3002,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:349,x:30770,y:36163,varname:node_349,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:616,x:30770,y:36226,varname:node_616,prsc:2|IN-4443-OUT;n:type:ShaderForge.SFN_Slider,id:8871,x:30744,y:31936,ptovrint:False,ptlb:Offset2,ptin:_Offset2,varname:node_8871,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.05;n:type:ShaderForge.SFN_Set,id:4443,x:31281,y:31947,varname:__offset2,prsc:2|IN-4623-OUT;n:type:ShaderForge.SFN_Divide,id:4623,x:31099,y:31947,varname:node_4623,prsc:2|A-8871-OUT,B-9409-OUT;n:type:ShaderForge.SFN_Get,id:8459,x:30770,y:36316,varname:node_8459,prsc:2|IN-699-OUT;n:type:ShaderForge.SFN_Add,id:7103,x:32215,y:35037,varname:node_7103,prsc:2|A-7008-OUT,B-3897-OUT;proporder:1320-8871;pass:END;sub:END;*/

Shader "Shader Forge/CustomBlur_Shader" {
    Properties {
        _Offset ("Offset", Range(0, 0.05)) = 0.02260575
        _Offset2 ("Offset2", Range(0, 0.05)) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _Offset;
            uniform float _Offset2;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 screenPos : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float2 __screenpos = sceneUVs.rg;
                float __screenposU = sceneUVs.r;
                float node_3611 = distance(objPos.rgb,_WorldSpaceCameraPos);
                float node_9409 = (node_3611/log(node_3611));
                float __offset = (_Offset/node_9409);
                float __screenposV = sceneUVs.g;
                float node_9966 = __screenposU;
                float node_8617 = __offset;
                float node_9697 = __screenposV;
                float node_5708 = __offset;
                float2 node_3176 = __screenpos;
                float node_7513 = __offset;
                float node_4182 = __offset;
                float node_127 = __offset;
                float __offset2 = (_Offset2/node_9409);
                float2 node_3148 = __screenpos;
                float node_1218 = __offset2;
                float node_7252 = __offset2;
                float node_616 = __offset2;
                float3 finalColor = (((tex2D( _GrabTexture, __screenpos).rgb+tex2D( _GrabTexture, float2((__screenposU+__offset),__screenposV)).rgb+tex2D( _GrabTexture, float2(__screenposU,(__screenposV+__offset))).rgb+tex2D( _GrabTexture, float2((node_9966-node_8617),__screenposV)).rgb+tex2D( _GrabTexture, float2(__screenposU,(node_9697-node_5708))).rgb)+(tex2D( _GrabTexture, (node_3176+node_7513)).rgb+tex2D( _GrabTexture, (node_3176-node_7513)).rgb+tex2D( _GrabTexture, float2((__screenposU+node_4182),(__screenposV-node_4182))).rgb+tex2D( _GrabTexture, float2((__screenposV+node_127),(__screenposU-node_127))).rgb)+((tex2D( _GrabTexture, __screenpos).rgb+tex2D( _GrabTexture, float2((__screenposU+__offset2),__screenposV)).rgb+tex2D( _GrabTexture, float2(__screenposU,(__screenposV+__offset2))).rgb+tex2D( _GrabTexture, float2((__screenposU-__offset2),__screenposV)).rgb+tex2D( _GrabTexture, float2(__screenposU,(__screenposV-__offset2))).rgb)+(tex2D( _GrabTexture, (node_3148+node_1218)).rgb+tex2D( _GrabTexture, (node_3148-node_1218)).rgb+tex2D( _GrabTexture, float2((__screenposU+node_7252),(__screenposV-node_7252))).rgb+tex2D( _GrabTexture, float2((__screenposV+node_616),(__screenposU-node_616))).rgb)))/18.0);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
