#define ST_CENTER         0x02
/*
	Author: Daniel Stuart

	File: ui.hpp
*/

class playerHUD {
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		Life_RscBackground_HUD,
		Life_RscProgress_HUDFood,
		Life_RscProgress_HUDHealth,
		Life_RscProgress_HUDWater,
		Life_RscText_HUDFood,
		Life_RscText_HUDHealth,
		Life_RscText_HUDWater
	};

	/* Background */
	class Life_RscBackground_HUD : Life_RscBackground {
		colorBackground[] = {0,0,0,0.35};
		x = 0.375 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.05 * safezoneH;
	};

	/* Progress Bars */
	class LIFE_RscProgress_HUDCommon : Life_RscProgress {
		colorFrame[] = {0, 0, 0, 0.8};
		y = 0.00833333 * safezoneH + safezoneY;
		w = 0.0555556 * safezoneW;
		h = 0.0333333 * safezoneH;
	};

	class Life_RscProgress_HUDFood : LIFE_RscProgress_HUDCommon {
		idc = 2200;
		colorBar[] = {0,0.50,0,0.65};
		x = 0.388889 * safezoneW + safezoneX;
	};

	class Life_RscProgress_HUDHealth : LIFE_RscProgress_HUDCommon {
		idc = 2201;
		colorBar[] = {0.85,0.05,0,0.65};
		x = 0.472222 * safezoneW + safezoneX;
	};

	class Life_RscProgress_HUDWater : LIFE_RscProgress_HUDCommon {
		idc = 2202;
		colorBar[] = {0,0.25,0.65,0.65};
		x = 0.555556 * safezoneW + safezoneX;
	};

	/* Texts */
	class Life_RscText_HUDCommon : Life_RscText {
		style = ST_CENTER;
		y = 0.00833333 * safezoneH + safezoneY;
		w = 0.0555556 * safezoneW;
		h = 0.0333333 * safezoneH;
	};

	class Life_RscText_HUDFood : Life_RscText_HUDCommon {
		idc = 1200;
		text = "$STR_HUD_Food";
		x = 0.388889 * safezoneW + safezoneX;
	};

	class Life_RscText_HUDHealth : Life_RscText_HUDCommon {
		idc = 1201;
		text = "$STR_HUD_Health";
		x = 0.472222 * safezoneW + safezoneX);
	};

	class Life_RscText_HUDWater : Life_RscText_HUDCommon {
		idc = 1202;
		text = "$STR_HUD_Water";
		x = 0.555556 * safezoneW + safezoneX;
	};
};
