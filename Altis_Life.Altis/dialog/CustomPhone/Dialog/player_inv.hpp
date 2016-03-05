class playerSettings {

	idd = 10892;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
	
	class TR8_HomeScreen: Life_RscPicture {
			text = "dialog\CustomPhone\GUI\TR8_HomeScreen.paa";
			idc = -1;
			x = 0.348878 * safezoneW + safezoneX;
			y = 0.231714 * safezoneH + safezoneY;
			w = 0.300173 * safezoneW;
			h = 0.527775 * safezoneH;
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
	};
	
	class controls {
		
		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "";
			tooltip = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.478263 * safezoneW + safezoneX;
			y = 0.700115 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
		
		class ButtonSettings : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			tooltip = "$STR_Global_Settings";
			onButtonClick = "[] call life_fnc_settingsMenu;";
			x = 0.427544 * safezoneW + safezoneX;
			y = 0.651735 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class ButtonMyGang : Life_RscButtonInvisible {
			idc = 2011;
			text = "";
			tooltip = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.326274 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
		
		class ButtonGangList : Life_RscButtonInvisible {
			idc = 2012;
			text = "";
			tooltip = "$STR_PM_WantedList";
			onButtonClick = "[] call life_fnc_wantedMenu;";
			x = 0.463772 * safezoneW + safezoneX;
			y = 0.392246 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};

		class ButtonLicences : Life_RscButtonInvisible {
			idc = 1602;
			tooltip = "$STR_PM_Licenses";
			onButtonClick = "[] call life_fnc_openLicensesMenu;";
			x = 0.491000 * safezoneW + safezoneX;
			y = 0.392246 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
	
		class ButtonKeys : Life_RscButtonInvisible {
			idc = 2013;
			text = "";
			tooltip = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.463772 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
		
		class ButtonCell : Life_RscButtonInvisible {
			idc = 2014;
			tooltip = "$STR_PM_CellPhone";
			onButtonClick = "createDialog ""Life_cell_phone"";";
			x = 0.49586 * safezoneW + safezoneX;
			y = 0.653934 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class ButtonAdminMenu : Life_RscButtonInvisible {
			idc = 2021;
			tooltip = "$STR_PM_AdminMenu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = 0.532087 * safezoneW + safezoneX;
			y = 0.324075 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
		
		class ButtonSyncData : Life_RscButtonInvisible {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "";
			tooltip = "$STR_PM_SyncData";
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.462737 * safezoneW + safezoneX;
			y = 0.651735 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class ButtonDanceMoves : Life_RscButtonInvisible {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "";
			tooltip = "$STR_PM_MovesMenu";
			onButtonClick = "createDialog ""life_moves_menu"";";
			x = 0.427544 * safezoneW + safezoneX;
			y = 0.390047 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};

		class ButtonBanking : Life_RscButtonInvisible {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "";
			tooltip = "$STR_PM_OpenBankMenu";
			onButtonClick = "[] call life_fnc_openBankMenu;";
			x = 0.531052 * safezoneW + safezoneX;
			y = 0.651735 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class ButtonPlayerMenu : Life_RscButtonInvisible {
			idc = -1;
			tooltip = "$STR_PM_OpenInvMenu";
			onButtonClick = "[]call life_fnc_openInvMenu;";
			x = 0.427544 * safezoneW + safezoneX;
			y = 0.326274 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0439812 * safezoneH;
		};
	};
};
