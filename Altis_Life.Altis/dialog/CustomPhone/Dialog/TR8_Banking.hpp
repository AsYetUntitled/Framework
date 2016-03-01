class Life_TR8_Banking {
	idd = 20055;
	name= "Life_TR8_Banking";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class TR8_Banking: Life_RscPicture
		{
			idc = 1200;
			text = "dialog\CustomPhone\GUI\TR8_BankMenu.paa";
			x = 0.345773 * safezoneW + safezoneX;
			y = 0.225117 * safezoneH + safezoneY;
			w = 0.294997 * safezoneW;
			h = 0.527775 * safezoneH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.467913 * safezoneW + safezoneX;
			y = 0.506598 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		
		class moneyDrop : Life_RscButtonInvisible
		{
			idc = 2001;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.426509 * safezoneW + safezoneX;
			y = 0.506597 * safezoneH + safezoneY;
			w = 0.0362278 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2100;
		
			x = 0.492755 * safezoneW + safezoneX;
			y = 0.506597 * safezoneH + safezoneY;
			w = 0.0569293 * safezoneW;
			h = 0.0219906 * safezoneH;
		};

		class TR8_CloseButton: Life_RscButtonInvisible
		{
			idc = -1;
			onButtonClick = "closeDialog 0; createDialog ""playerSettings"";";
			x = 0.474123 * safezoneW + safezoneX;
			y = 0.700114 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class TR8_BankIcon: Life_RscPicture
		{
			idc = -1;
			text = "dialog\CustomPhone\Icons\Bank.paa";
			x = 0.427544 * safezoneW + safezoneX;
			y = 0.398843 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class TR8_CashIcon: Life_RscPicture
		{
			idc = -1;
			text = "dialog\CustomPhone\Icons\Cash.paa";
			x = 0.427545 * safezoneW + safezoneX;
			y = 0.453819 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class TR8_BankInfo: Life_RscText
		{
			idc = 1001;
			text = "285,914,723"; 
			x = 0.457571 * safezoneW + safezoneX;
			y = 0.398843 * safezoneH + safezoneY;
			w = 0.0828063 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class TR8_WalletInfo: Life_RscText
		{
			idc = 1002;
			text = "10,000"; 
			x = 0.456521 * safezoneW + safezoneX;
			y = 0.456019 * safezoneH + safezoneY;
			w = 0.0828063 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class TR8_BankName: Life_RscText
		{
			idc = 1000;
			style = 2;
			text = "Travis Butts"; //--- ToDo: Localize;
			x = 0.430661 * safezoneW + safezoneX;
			y = 0.368056 * safezoneH + safezoneY;
			w = 0.113859 * safezoneW;
			h = 0.0109953 * safezoneH;
			shadow = 0;
		};
	};
};