class Life_TR8_Licences {
	idd = 20058;
	name= "Life_TR8_Licences";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class TR8_Licences: Life_RscPicture
		{
			idc = 1200;
			text = "dialog\CustomPhone\GUI\TR8_Licences.paa";
			x = 0.349914 * safezoneW + safezoneX;
			y = 0.251506 * safezoneH + safezoneY;
			w = 0.294997 * safezoneW;
			h = 0.494789 * safezoneH;
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
		
		class TR8_Licence_List: Life_RscStructuredText
		{
			idc = 1500;
			background[] = {0,0,0,0};
			x = 0.429615 * safezoneW + safezoneX;
			y = 0.387848 * safezoneH + safezoneY;
			w = 0.113859 * safezoneW;
			h = 0.153934 * safezoneH;
		};
		class TR8_Close: Life_RscButtonInvisible
		{
			idc = 1600;
			x = 0.475158 * safezoneW + safezoneX;
			y = 0.695716 * safezoneH + safezoneY;
			w = 0.025877 * safezoneW;
			h = 0.0329859 * safezoneH;
			action = "closeDialog 0; createDialog 'playerSettings'";
		};
	};
};