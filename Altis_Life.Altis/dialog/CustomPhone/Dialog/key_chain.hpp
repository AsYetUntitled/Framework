class Life_key_management {
	idd = 2700;
	name= "life_key_chain";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {
		class TR8_KeysMenu: Life_RscPicture
		{
			idc = -1;
			text = "dialog\CustomPhone\GUI\TR8_KeychainMenu.paa";
			x = 0.349914 * safezoneW + safezoneX;
			y = 0.203127 * safezoneH + safezoneY;
			w = 0.32605 * safezoneW;
			h = 0.560761 * safezoneH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class KeyChainList : Life_RscListBox 
		{
			idc = 2701;
			text = "";
			sizeEx = 0.035;
			
			x = 0.435825 * safezoneW + safezoneX;
			y = 0.35926 * safezoneH + safezoneY;
			w = 0.129385 * safezoneW;
			h = 0.153934 * safezoneH;
		};

		class CloseButtonKey : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""playerSettings"";";
			x = 0.487578 * safezoneW + safezoneX;
			y = 0.704513 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
		
		class NearPlayers : Life_RscCombo {
		
			idc = 2702;
			x = 0.441001 * safezoneW + safezoneX;
			y = 0.550579 * safezoneH + safezoneY;
			w = 0.119034 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		
		class DropKey : Life_RscButtonInvisible {
			idc = -1;
			onButtonClick = "[] call life_fnc_keyDrop";
			x = 0.472053 * safezoneW + safezoneX;
			y = 0.515394 * safezoneH + safezoneY;
			w = 0.0362278 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		
		class GiveKey : Life_RscButtonInvisible {
			idc = 2703;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_keyGive";
			x = 0.43686 * safezoneW + safezoneX;
			y = 0.515394 * safezoneH + safezoneY;
			w = 0.0310524 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
	};
};