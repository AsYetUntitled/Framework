/*
	ArmA 3 TAW View Distance Management
	Resource Definesby Sa-Matra
*/
class TAW_VD 
{
	idd = 2900;
	name= "taw_vd";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class TAWVD_RscTitleBackground : life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.5 - (22 / 250);
		};
		
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";
			
			x = 0.32; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";
			
			x = 0.32; y = 0.305;
			w = 0.275; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";
			
			x = 0.32; y = 0.355;
			w = 0.275; h = 0.04;
		};

	};
	
	class controls 
	{
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_SM_Title";
			x = 0.3;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.42;
			y = 0.30 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
			
			x = 0.70; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.42;
			y = 0.35 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			
			x = 0.70; y = 0.31;
			w = 0.275; h = 0.04;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.42;
			y = 0.40 - (1 / 25);
			
			w = "9 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			
			x = 0.70; y = 0.36;
			w = 0.275; h = 0.04;
		};
		
		class VDTerrSet : life_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			shadow = 0;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.30;
			y = 0.45;
			w = 0.5;
			h = (1 / 25);
		};
		
		class VD_terr_low : Life_RscActiveText
		{
			idc = -1;
			text = "$STR_SM_TagsON";
			action = "LIFE_ID_PlayerTags = [""LIFE_PlayerTags"",""onEachFrame"",""life_fnc_playerTags""] call BIS_fnc_addStackedEventHandler;";
			sizeEx = 0.04;
			
			x = 0.38; y = 0.50;
			w = 0.275; h = 0.04;
		};
		
		class VD_terr_normal : Life_RscActiveText
		{
			idc = -1;
			text = "$STR_Sm_TagsOFF";
			action = "[LIFE_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler;";
			sizeEx = 0.04;
			
			x = 0.56; y = 0.50;
			w = 0.275; h = 0.04;
		};
		
		class SideChannelSettings : life_RscText
		{
			idc = -1;
			text = "$STR_SM_SC";
			shadow = 0;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

			x = 0.30;
			y = 0.55;
			w = 0.5;
			h = (1 / 25);
		};
		
		class SideChatONOFF : Life_RscActiveText
		{
			idc = 2926;
			text = "$STR_SM_SCOFF";
			color[] = {1, 0, 0, 1};
			action = "[] call life_fnc_sidechat";
			sizeEx = 0.04;
			
			x = 0.48; y = 0.60;
			w = 0.275; h = 0.04;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.7 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};