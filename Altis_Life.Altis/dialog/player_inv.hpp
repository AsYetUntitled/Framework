#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
	
	class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Player Menu";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.105;
			y = 0.30;
			w = 0.3; h = 0.6;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
		
		class itemHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Current Items";
			sizeEx = 0.04;
			
			x = 0.62; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class licenseHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Licenses";
			sizeEx = 0.04;
			
			x = 0.336; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class moneySHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Money Stats";
			sizeEx = 0.04;
			
			x = 0.11; y = 0.26;
			w = 0.219; h = 0.04;
		};
	
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.030;
			
			x = 0.62; y = 0.30;
			w = 0.275; h = 0.3;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.030;
			x = 0.12; y = 0.42;
			w = 0.18; h = 0.03;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = 0.12; y = 0.46;
			w = 0.18; h = 0.03;
		};
		
		class moneyDrop : Life_RscButtonMenu
		{
			idc = 2001;
			text = "Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.135; y = 0.50;
			w = 0.13; h = 0.036;
		};
		
		class itemEdit : Life_RscEdit {
		
		idc = item_edit;
		
		text = "1";
		sizeEx = 0.030;
		x = 0.62; y = 0.61;
		w = 0.275; h = 0.03;
		
		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.62; y = 0.65;
			w = 0.275; h = 0.03;
		};
		/*
		Disabled till it can be redone
		class moneyInput: life_RscCombo {
			
			idc = money_value;
			
			x  = 0.02; y = 0.402;
			w = .1; h = .030;
		};
		*/
		
		class DropButton : life_RscButtonMenu {
			
			idc = 2002;
			text = "Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_giveItem;";
			
			x = 0.765;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class UseButton : life_RscButtonMenu {
			
			text = "Use";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_useItem;";
			
			x = 0.62;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class RemoveButton : life_RscButtonMenu {
			
			text = "Remove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_removeItem;";
			
			x = 0.475;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		/*
		Disabled till it can be redone
		class DropcButton : life_RscButtonMenu {

			text = "Drop Money";
			onButtonClick = "[] execVM 'player_system\money_fnc.sqf'";
			
			x = 0.13; y = 0.4;
			w = 0.135; h = 0.05;
			
		};
		*/
		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonSettings : life_RscButtonMenu {
			idc = -1;
			text = "Settings";
			onButtonClick = "[] call life_fnc_settingsMenu;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			text = "My Gang";
			onButtonClick = "[] call life_fnc_gangMenu";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Life_Licenses : Life_RscStructuredText
		{
			idc = 2014;
			sizeEx = 0.020;
			text = "";
			x = 0.34;
			y = 0.30;
			w = 0.3; h = 0.6;
		};
		
		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			text = "Wanted List";
			onButtonClick = "[] call life_fnc_wantedMenu";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			text = "Key Chain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			text = "Cell Phone";
			onButtonClick = "createDialog ""Life_cell_phone"";";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonFixSCreen : Life_RscButtonMenu {
			idc = 2021;
			text = "Admin Menu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonGcam : life_RscButtonMenu {
			idc = 2020;
			//shortcuts[] = {0x00050000 + 2};
			text = "GCam";
			onButtonClick = "closeDialog 0; [] execVM ""gcam.sqf"";";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonSyncData : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Sync Data";
			onButtonClick = "[] call life_fnc_syncData;";
			x = 0.1;
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};