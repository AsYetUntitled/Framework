class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.64;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = 0.25 - (5 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "STS Mobile";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "Message To Send:";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 3003;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.62; h = 0.03;
		
		};
		
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "Text Message:";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textmsg";
			
			x = 0.11;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 0.11; y = 0.4;
			w = 0.2; h = (1 / 25);
		};

		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "Text Police";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textcop";
			
			x = 0.32;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "Text Admins";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textadmin";
			
			x = 0.53;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "Admin Message";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_adminmsg";
			
			x = 0.32;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "Admin Msg All";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_adminmsgall";
			
			x = 0.53;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.46 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};