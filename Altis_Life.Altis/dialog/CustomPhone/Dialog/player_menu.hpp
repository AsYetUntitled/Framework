class playerMenu {

	idd = 20057;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {

	class TR8_PlayerInv: Life_RscPicture {
			text = "dialog\CustomPhone\GUI\TR8_Inventory.paa";
			idc = -1;
			x = 0.349914 * safezoneW + safezoneX;
			y = 0.236113 * safezoneH + safezoneY;
			w = 0.310524 * safezoneW;
			h = 0.51678 * safezoneH;
		};
	};

	class controls {
		
		class TR8_use: Life_RscButtonInvisible
		{
			idc = 1600;
			onButtonClick = "[] call life_fnc_useItem;";
			x = 0.431685 * safezoneW + safezoneX;
			y = 0.552778 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0109953 * safezoneH;
		};
		class TR8_remove: Life_RscButtonInvisible
		{
			idc = 1601;
			onButtonClick = "[] call life_fnc_removeItem;";
			x = 0.453422 * safezoneW + safezoneX;
			y = 0.552778 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0109953 * safezoneH;
		};
		class TR8_give: Life_RscButtonInvisible
		{
			idc = 1602;
			onButtonClick = "[] call life_fnc_giveItem;";
			x = 0.536228 * safezoneW + safezoneX;
			y = 0.54838 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		class TR8_Close: Life_RscButtonInvisible
		{
			idc = 1604;
			x = 0.481368 * safezoneW + safezoneX;
			y = 0.697916 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
			action = "closeDialog 0; createDialog 'playerSettings'";
		};
		class TR8_nearPlayers: Life_RscCombo
		{
			idc = 2100;
			x = 0.498965 * safezoneW + safezoneX;
			y = 0.54838 * safezoneH + safezoneY;
			w = 0.0362278 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		class TR8_items: Life_RscListbox
		{
			idc = 1500;
			x = 0.433755 * safezoneW + safezoneX;
			y = 0.379052 * safezoneH + safezoneY;
			w = 0.119034 * safezoneW;
			h = 0.16493 * safezoneH;
		};
		class TR8_quantity: Life_RscEdit
		{
			idc = 3004;
			text = "1";
			sizeEx = 0.030;
			x = 0.476193 * safezoneW + safezoneX;
			y = 0.54838 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
	};
};