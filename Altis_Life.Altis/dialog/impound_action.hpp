class Life_impound_menu_action
{
	idd = 4300;
	name="Life_impound_menu_action";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground
	{
		class MainBackground: Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.495 * safezoneH;
		};

		class Title: Life_RscTitle
		{
			idc = -1;
			text = "$STR_GUI_Store_Confirmation";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class StoreCar: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Vehicle_Store";
			onButtonClick = "[1] call life_fnc_storeVehicleAction;closeDialog 0;";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.055 * safezoneH;
		};

		class CloseButton: life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class CleanCar: life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Vehicle_Clean";
			onButtonClick = "[2] call life_fnc_storeVehicleAction;closeDialog 0;";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};

	class controls
	{
		class TextMessage: Life_RscStructuredText
		{
			idc = 4302;
			text = "$STR_Vehicle_StoreMSG";
			sizeEx = 0.040;
			colorBackground[] = {0,0,0,1};
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.381563 * safezoneW;
			h = 0.352 * safezoneH;
		};
	};
};
