class life_moves_menu {
	idd = 2900;
	name= "life_moves_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_movesMenu;";
	
	class controlsBackground {
		class TR8_Dance: Life_RscPicture
		{
			idc = -1;
			text = "dialog\CustomPhone\GUI\TR8_DanceMenu.paa";
			x = 0.360265 * safezoneW + safezoneX;
			y = 0.244908 * safezoneH + safezoneY;
			w = 0.289822 * safezoneW;
			h = 0.505784 * safezoneH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class movesList : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;			
			x = 0.433755 * safezoneW + safezoneX;
			y = 0.376853 * safezoneH + safezoneY;
			w = 0.124209 * safezoneW;
			h = 0.175925 * safezoneH;
		};
		

		class CloseButtonKey : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0.485509 * safezoneW + safezoneX;
			y = 0.697916 * safezoneH + safezoneY;
			w = 0.0207016 * safezoneW;
			h = 0.0329859 * safezoneH;
		};

		class CloseButtonKey2 : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0;";
			x = 0.480334 * safezoneW + safezoneX;
			y = 0.561574 * safezoneH + safezoneY;
			w = 0.0362278 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
		
		class performMove : Life_RscButtonInvisible {
			idc = -1;
			text = "";
			onButtonClick = "_move = lbData[2902,lbCurSel (2902)];_move = call compile format[""%1"", _move]; player playMove _move; closeDialog 0;";
			x = 0.437895 * safezoneW + safezoneX;
			y = 0.559375 * safezoneH + safezoneY;
			w = 0.0362278 * safezoneW;
			h = 0.0219906 * safezoneH;
		};
	};
};