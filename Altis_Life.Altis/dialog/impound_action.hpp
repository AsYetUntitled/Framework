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
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.154 * safezoneH;
		};

		class StoreCar : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Vehicle_Store";
			onButtonClick = "[1] call life_fnc_storeVehicleAction;";
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CleanCar : life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Vehicle_Clean";
			onButtonClick = "[2] call life_fnc_storeVehicleAction;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls
	{

		class TextMessage : Life_RscStructuredText
		{
			idc = 4302;
			text = "$STR_Vehicle_StoreMSG";
			sizeEx = 0.045;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};
};
