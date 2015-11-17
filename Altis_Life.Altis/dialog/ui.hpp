#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
/*
	Name: Dillon "Itsyuka" Modine-Thuen
	File: ui.hpp
*/

class playerHUD {
	idd = -1;
	duration = INFINITE;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "playerHUD";
	onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		LIFE_UI_BACK,
		LIFE_BAR_FOOD,
		LIFE_BAR_WATER,
		LIFE_BAR_HEALTH,
		LIFE_PICTURE_FOOD,
		LIFE_PICTURE_WATER,
		LIFE_PICTURE_HEALTH,
		LIFE_FOOD_TEXT,
		LIFE_WATER_TEXT,
		LIFE_HEALTH_TEXT
	};

	/* Background */
	class LIFE_UI_BACK: Life_RscBackground
	{
		colorBackground[] = {0,0,0,0.5};
		x = 0.917656 * safezoneW + safezoneX;
		y = 0.819 * safezoneH + safezoneY;
		w = 0.0825 * safezoneW;
		h = 0.11 * safezoneH;
	};

	/* Progress Bars */
	class LIFE_BAR_FOOD: Life_RscProgress
	{
		idc = IDC_LIFE_BAR_FOOD;
		x = 0.938281 * safezoneW + safezoneX;
		y = 0.83 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class LIFE_BAR_WATER: Life_RscProgress
	{
		idc = IDC_LIFE_BAR_WATER;
		x = 0.938281 * safezoneW + safezoneX;
		y = 0.863 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class LIFE_BAR_HEALTH: Life_RscProgress
	{
		idc = 2202;
		x = 0.938281 * safezoneW + safezoneX;
		y = 0.896 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};

	/* Text */

	class LIFE_FOOD_TEXT: Life_RscText
	{
		idc = IDC_LIFE_FOOD_TEXT;
		text = "";
		x = 0.958906 * safezoneW + safezoneX;
		y = 0.8344 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_WATER_TEXT: Life_RscText
	{
		idc = IDC_LIFE_WATER_TEXT;
		text = "";
		x = 0.958905 * safezoneW + safezoneX;
		y = 0.8674 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_HEALTH_TEXT: Life_RscText
	{
		idc = IDC_LIFE_HEALTH_TEXT;
		text = "";
		x = 0.958906 * safezoneW + safezoneX;
		y = 0.9004 * safezoneH + safezoneY;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};

	/* Icons */
	class LIFE_PICTURE_FOOD: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_FOOD;
		text = "icons\food.paa";
		x = 0.922813 * safezoneW + safezoneX;
		y = 0.83 * safezoneH + safezoneY;
		w = 0.03; h = 0.04;
	};
	class LIFE_PICTURE_WATER: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_WATER;
		text = "icons\water.paa";
		x = 0.922813 * safezoneW + safezoneX;
		y = 0.863 * safezoneH + safezoneY;
		w = 0.03; h = 0.04;
	};
	class LIFE_PICTURE_HEALTH: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_HEALTH;
		text = "icons\health.paa";
		x = 0.922813 * safezoneW + safezoneX;
		y = 0.896 * safezoneH + safezoneY;
		w = 0.03; h = 0.04;
	};
};