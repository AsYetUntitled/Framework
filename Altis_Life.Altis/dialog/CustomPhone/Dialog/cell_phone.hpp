class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "[] spawn life_fnc_cellphone";
	
	class controlsBackground {
		class TR8_Cellphone: Life_RscPicture
		{
			idc = 1200;
			text = "dialog\CustomPhone\GUI\TR8_MessagesMenu.paa";
			x = 0.360264 * safezoneW + safezoneX;
			y = 0.244909 * safezoneH + safezoneY;
			w = 0.294997 * safezoneW;
			h = 0.51678 * safezoneH;
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
		
		class textEdit : Life_RscEdit {
		
			idc = 3003;
			
			text = "";
			sizeEx = 0.040;
			x = 0.434789 * safezoneW + safezoneX;
			y = 0.398842 * safezoneH + safezoneY;
			w = 0.124209 * safezoneW;
			h = 0.142939 * safezoneH;
		};
		
		class TextMsgButton : Life_RscButtonInvisible 
		{
			idc = 3015;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			
			x = 0.433755 * safezoneW + safezoneX;
			y = 0.543981 * safezoneH + safezoneY;
			w = 0.0310524 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 0.454456 * safezoneW + safezoneX;
			y = 0.585763 * safezoneH + safezoneY;
			w = 0.0828063 * safezoneW;
			h = 0.0219906 * safezoneH;
		};

		class TextCopButton : Life_RscButtonInvisible  
		{
			idc = 3016;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_textcop";
			
			x = 0.464807 * safezoneW + safezoneX;
			y = 0.543981 * safezoneH + safezoneY;
			w = 0.0310524 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class AdminMsgAllButton : Life_RscButtonInvisible  
		{
			idc = 3021;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			
			x = 0.527947 * safezoneW + safezoneX;
			y = 0.543981 * safezoneH + safezoneY;
			w = 0.0310524 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class EMSRequest : Life_RscButtonInvisible 
		{
			idc = 3022;
			text = "";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call TON_fnc_cell_emsrequest";
			
			x = 0.496895 * safezoneW + safezoneX;
			y = 0.543981 * safezoneH + safezoneY;
			w = 0.0310524 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
		
		class CloseButtonKey : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0.486544 * safezoneW + safezoneX;
			y = 0.708911 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0329859 * safezoneH;
		};
	};
};