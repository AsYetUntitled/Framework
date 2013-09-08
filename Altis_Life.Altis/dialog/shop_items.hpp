/*
	ONLY PERMITTED TO SEAL TEAM SLOTH. IF THIS IS USED IN ANY OTHER MISSION WITHOUT THE PERMISSION OF TONIC LEGAL ACTION MAY BE TAKEN.
*/
class shop_menu {
	idd = 2500;
	name= "shop_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "['guns'] execVM 'gear\switch.sqf'";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class vasText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Shop Inventory";
			sizeEx = 0.04;
			x = 0.12; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class vasgText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Your Current Gear";
			sizeEx = 0.04;
			
			x = 0.60; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class accText : Life_RscStructuredText
		{
			idc = 2503;
			text = "";
			sizeEx = 0.04;
			x = 0.42; y = 0.67;
			w = 0.23; h = 0.06;
		};
	};
	
	class controls {

		class vasGear : Life_RscListBox 
		{
			idc = 2501;
			text = "";
			sizeEx = 0.030;
			onLBSelChanged = "[] call fnc_selection";
			
			x = 0.12; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class vasPGear : Life_RscListBox 
		{
			idc = 2502;
			text = "";
			sizeEx = 0.030;
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";
			
			x = 0.60; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class WeaponsBtn : Life_RscButtonMenu
		{
			idc = 2510;
			text = "Weapons";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['guns'] call fnc_change_menu;";
			x = 0.42; y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class MagazinesBtn : Life_RscButtonMenu
		{
			idc = 2511;
			text = "Magazines";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['mags'] call fnc_change_menu;";
			x = 0.42; y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ItemsBtn : Life_RscButtonMenu
		{
			idc = 2512;
			text = "Items";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['items'] call fnc_change_menu;";
			x = 0.42; y = 0.45;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BackpacksBtn : Life_RscButtonMenu
		{
			idc = 2513;
			text = "Backpacks";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['packs'] call fnc_change_menu;";
			x = 0.42; y = 0.50;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GogglesBtn : Life_RscButtonMenu
		{
			idc = 2514;
			text = "Goggles";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['glass'] call fnc_change_menu;";
			x = 0.42; y = 0.55;
			w = (6.25 / 40);
			h = (1 / 25);
		};
			
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2505;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class PlayersName : Title {
			idc = 601;
			style = 1;
			text = "";
		};
	
		class ButtonAddG : Life_RscButtonMenu
		{
			idc = -1;
			text = "Buy Item";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn fnc_buy_gear;";
			
			x = 0.16;
			y = 0.67;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ButtonRemoveG : Life_RscButtonMenu
		{
			idc = -1;
			text = "Sell Item";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "hint ""Not yet implemented"";";
			
			x = 0.69;
			y = 0.67;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class Life_prompt 
{
	idd = 2550;
	name = "Virtual_Ammobox_sys_prompt";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = -1;
			sizeEx = 0.020;
			text = "<t align='center'><t size='.8px'>What do you want to do with that attachment?</t></t><br/><t align='center'><t size='0.6'>Please know that if you choose to add it to your weapon your current existing attachment in that slot will be lost.</t></t>";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class addtogun : Life_RscButtonMenu {
			idc = -1;
			text = "Add to gun";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "Life_prompt_choice = true; closeDialog 0;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class addtogear : Life_RscButtonMenu {
			idc = -1;
			text = "Add to INV";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "Life_prompt_choice = false; closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};