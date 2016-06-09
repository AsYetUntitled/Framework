class Market
{
	idd = 39000;
	name = "Market";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class TitleBackground: Life_RscText
		{
			idc = 1000;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.05,0.5,0.05,0.8};
			colorActive[] = {0.05,0.5,0.05,0.8};
		};
		class MarketBackground: Life_RscText
		{
			idc = 1001;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class Title: Life_RscText
		{
			idc = 1002;
			text = "The Market"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	
	class Controls
	{
		class GoodsDisplay: Life_RscListbox
		{
			idc = 39001;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] spawn life_fnc_marketGrab";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class GoodsTitle: Life_RscText
		{
			idc = -1;
			text = "Goods"; //--- ToDo: Localize;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class InfoTitle: Life_RscText
		{
			idc = -1;
			text = "Information"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CurrentGood: Life_RscText
		{
			idc = 39002;
			text = "Current Good:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CurrentPrice: Life_RscText
		{
			idc = 39003;
			text = "Current Price:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RecentPrice: Life_RscText
		{
			idc = 39004;
			text = "Most Recent Price:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RecentChange: Life_RscText
		{
			idc = 39005;
			text = "Most Recent Change:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class StartPrice: Life_RscText
		{
			idc = 39006;
			text = "Server Start Price:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class StartChange: Life_RscText
		{
			idc = 39007;
			text = "Change Since Server Start:"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ExitButton: Life_RscButtonMenu
		{
			idc = 39008;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.05,0.5,0.05,0.8};
			colorActive[] = {0.05,0.5,0.05,0.8};
		};
	};
};