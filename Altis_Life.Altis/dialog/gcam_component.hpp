// GCam 2.0 Component
// This file is necessary to use GCam script.
// Include this file to "description.ext".
// #include "gcam_component.hpp"

#include "gcam_config.hpp"

class GCam_DialogBase_Static
{
	type = 0;
	idc = -1;
	style = 512;
	shadow = 2;
	colorBackground[] = {0,0,0,0.4};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};


class GCam_DialogBase_Map
{
	access = 0;
	type = 101;
	//idc = 51;
	style = 48;
	x = 0.0;
	y = 0.0;
	w = 0.0;
	h = 0.0;
	colorBackground[] = {1, 1, 1, 0.6};
	colorOutside[] = {1, 0, 0, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.040000;
	colorSea[] = {0.560000, 0.800000, 0.980000, 0.500000};
	colorForest[] = {0.600000, 0.800000, 0.200000, 0.500000};
	colorRocks[] = {0.500000, 0.500000, 0.500000, 0.500000};
	colorCountlines[] = {0.650000, 0.450000, 0.270000, 0.500000};
	colorMainCountlines[] = {0.650000, 0.450000, 0.270000, 1};
	colorCountlinesWater[] = {0, 0.530000, 1, 0.500000};
	colorMainCountlinesWater[] = {0, 0.530000, 1, 1};
	colorForestBorder[] = {0.400000, 0.800000, 0, 1};
	colorRocksBorder[] = {0.500000, 0.500000, 0.500000, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorRailWay[] = {0.800000, 0.200000, 0.300000, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.500000};
	colorLevels[] = {0, 0, 0, 1};
	fontLabel = "TahomaB";
	sizeExLabel = 0.040000;
	fontGrid = "TahomaB";
	sizeExGrid = 0.040000;
	fontUnits = "TahomaB";
	sizeExUnits = 0.040000;
	fontNames = "TahomaB";
	sizeExNames = 0.040000;
	fontInfo = "TahomaB";
	sizeExInfo = 0.040000;
	fontLevel = "TahomaB";
	sizeExLevel = 0.040000;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.200000, {"Gamma", 1, 1.500000}};
	stickY[] = {0.200000, {"Gamma", 1, 1.500000}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = "false";
	maxSatelliteAlpha = 0.660000;
	alphaFadeStartScale = 0.050000;
	alphaFadeEndScale = 0.150000;
	class Legend {
		x = 0.700000;
		y = 0.850000;
		w = 0.250000;
		h = 0.100000;
		font = "TahomaB";
		sizeEx = 0.040000;
		colorBackground[] = {1, 1, 1, 1};
		color[] = {0, 0, 0, 1};
	};
	class ActiveMarker {
		color[] = {0.300000, 0.100000, 0.900000, 1};
		size = 50;
	};
	class Command {
		icon = "\ca\ui\data\icon_task_board_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task {
		icon = "\ca\ui\data\icon_task_ca.paa";
		iconCreated = "\ca\ui\data\ui_task_created_ca.paa";
		iconCanceled = "\ca\ui\data\ui_task_cancelled_ca.paa";
		iconDone = "\ca\ui\data\ui_task_done_ca.paa";
		iconFailed = "\ca\ui\data\ui_task_failed_ca.paa";
		colorCreated[] = {1, 1, 1, 1};
		colorCanceled[] = {1, 1, 1, 1};
		colorDone[] = {1, 1, 1, 1};
		colorFailed[] = {1, 1, 1, 1};
		color[] = {1, 1, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark {
		icon = "\ca\ui\data\icon_custom_task_ca.paa";
		color[] = {1, 1, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.6 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Bunker {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fortress {
		icon = "\ca\ui\data\map_fortress_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "3 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {1, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
};


class GCam_DialogBase_ListBox
{
	access = 0;
	type = 5;
	style = 0;
	w = LISTWIDTH;
	h = LISTHEIGHT;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.030;
	//color[] = {1,0,1,1};
	colorBackground[] = {0.0, 0.0, 0.0, 0.0};
	colorText[] = {0.8784,0.8471,0.651,1.0}; // text and background
	colorScrollbar[] = {0.0, 0, 0, 1.0};
	colorSelect[] = {1.0,0.95,0.6, 1.0}; // select item text
	colorSelect2[] = {0.0, 0.0, 0, 0.0};
	colorSelectBackground[] = {0.0, 0.0, 0.0, 0.6}; // select item background inactive
	colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.6}; // select item background active
	period = 0;
	rowHeight = 0;
	maxHistoryDelay = 1.000000;
	soundSelect[] = {"", 0.100000, 1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};


#define BUTTONWIDTH2 0.0283
#define BUTTONHEIGHT2 0.0175

class GCam_DialogBase_Button
{
	access = 0;
	type = 1;
	style = 2;
	x = 0;
	y = 0;
	w = BUTTONWIDTH;
	h = BUTTONHEIGHT;
	shadow = 2;
	text = "";
	font = "Zeppelin32";
	sizeEx = BUTTONFONTSIZE;
	colorText[] = {0.874, 0.843, 0.647, 1.0}; // text
	colorDisabled[] = {0, 0, 0, 0};
	colorBackground[] = {0.278, 0.223, 0.133, 0.7}; // background
	colorBackgroundDisabled[] = {0, 0, 0, 0};
	colorBackgroundActive[] = {0.482, 0.396, 0.270, 0.8}; // active
	offsetX = 0.0;
	offsetY = 0.0;
	offsetPressedX = 0.001;
	offsetPressedY = 0.001;
	colorFocused[] = {0.482, 0.396, 0.270, 0.8}; // focused
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0.0;
	soundEnter[] = {"", 0.100000, 1};
	soundPush[] = {"", 0.100000, 1};
	soundClick[] = {"", 0.100000, 1};
	soundEscape[] = {"", 0.100000, 1};
};


#define TEXTHEIGHT BUTTONHEIGHT
#define TEXTWIDTH 0.05

class GCam_DialogBase_StructuredText
{
	type = 13;
	style = 0;
	x = 0;
	y = 0;
	h = TEXTHEIGHT;
	w = 0.1;
	text = "";
	size = 0.035;
	color[] = {0.8,0.8,0.8,1};
	colorText[] = {0.4,0.6745,0.2784,1};
	colorActive[] = {0.95,0.95,0.95,1};
	colorBackground[] = {0.360, 0.345, 0.270, 0.850}; // background
	shadow = 2;
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a0"; // 0.8784, 0.8471, 0.651
		align = "left";
		valign = "middle";
		shadow = 2;
	};
};


#define EDITHEIGHT 0.032
#define EDITWIDTH ((SafeZoneW - OUTFRAME*2)/4 - SPACE*3/4)

class GCam_DialogBase_Edit
{
	type = 2;
	style = 0;
	font = "Zeppelin32";
	x = 0.0;
	y = 0.0;
	w = 0.2;
	h = EDITHEIGHT;
	sizeEx = 0.026;
	shadow = 2;
	//colorBackground[] = {0.0, 0.0, 0.0, 1.0};
	colorText[] = {1.0,1.0,1.0,1.0}; // text and background
	colorSelection[] = {0.2,0.6,1,0.4}; // select text background
	autocomplete = false;
	text = "";
};


class GCam_DialogBase_EditMulti
{
	idc = -1;
	type = 2;
	style = 16;
	shadow = 2;
	x = 0;
	y = 0;
	w = LISTWIDTH;
	h = LISTHEIGHT;
	sizeEx = 0.026;
	font = "Zeppelin32";
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1.0};
	colorSelection[] = {0.2,0.6,1,0.4};
	autocomplete = 0;
	htmlControl = 1;
	
};


#define COMBOWIDTH (BUTTONWIDTH*2 + SPACE)
#define COMBOHEIGHT 0.035
#define COMBOWHOLEHEIGHT (0.0385*5)

class GCam_DialogBase_Combo
{
	type = 4;
	style = 0x00;
	x = 0;
	y = 0;
	w = COMBOWIDTH;
	h = COMBOHEIGHT;
	shadow = 2;
	colorSelect[] = {0.8784,0.8471,0.651,1.0}; // text select
	colorText[] = {0.8784,0.8471,0.651,1.0}; // text
	colorBackground[] = {0, 0, 0, 0.4}; // background
	colorSelectBackground[] = {0.0, 0.0, 0.0, 0.6}; // background select
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = COMBOWHOLEHEIGHT;
	color[] = {0.8784,0.8471,0.651,0.6}; // frame
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "Zeppelin32";
	sizeEx = 0.035;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 10;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};


class GCam_DialogBase_RscStructuredText
{
	type = 13;
	style = 0;
	x = 0.0;
	y = 0.0;
	w = 1.0;
	h = 1.0;
	colorBackground[] = { 0.0, 0.0, 0.0, 0.0 };
	size = 0.02;
	shadow = 2;
	text = "";
	class Attributes
	{
		font = "Zeppelin32";
		color = "#FFFFFF";
		shadowColor = "#000000";
		align = "left";
		valign = "middle";
	};
};



class GCam_Dialog
{
	idd = 5100;
	movingEnable = 0;
	class controls
	{
		#ifdef PARAMTRACK
			class StructuredText_Diag : GCam_DialogBase_RscStructuredText
			{
				idc = 25;
				x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME;
				y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME + EDITHEIGHT + SPACE;
				w = SafeZoneW - OUTFRAME*2;
				h = (SafeZoneH) - (OUTFRAME*2 + EDITHEIGHT + SPACE );
			};
			class Edit_Command1 : GCam_DialogBase_Edit
			{
				idc = 55;
				x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME + (EDITWIDTH + SPACE)*0;
				y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME;
				w = EDITWIDTH;
				text = "";
				onMouseMoving = "GCam_OC = _this; GCam_F = _this select 3";
				onKeyUp = "if (_this select 1 in [28,156]) then {call compile ctrlText 55}";
				onDestroy = "GCam_Com1 = (ctrlText 55)";
			};
			class Edit_Command2 : GCam_DialogBase_Edit
			{
				idc = 56;
				x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME + (EDITWIDTH + SPACE)*1;
				y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME;
				w = EDITWIDTH;
				text = "";
				onMouseMoving = "GCam_OC = _this; GCam_F = _this select 3";
				onKeyUp = "if (_this select 1 in [28,156]) then {call compile ctrlText 56}";
				onDestroy = "GCam_Com2 = (ctrlText 56)";
			};
			class Edit_Command3 : GCam_DialogBase_Edit
			{
				idc = 57;
				x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME + (EDITWIDTH + SPACE)*2;
				y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME;
				w = EDITWIDTH;
				text = "";
				onMouseMoving = "GCam_OC = _this; GCam_F = _this select 3";
				onKeyUp = "if (_this select 1 in [28,156]) then {call compile ctrlText 57}";
				onDestroy = "GCam_Com3 = (ctrlText 57)";
			};
			class Edit_Command4 : GCam_DialogBase_Edit
			{
				idc = 58;
				x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME + (EDITWIDTH + SPACE)*3;
				y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME;
				w = EDITWIDTH;
				text = "";
				onMouseMoving = "GCam_OC = _this; GCam_F = _this select 3";
				onKeyUp = "if (_this select 1 in [28,156]) then {call compile ctrlText 58}";
				onDestroy = "GCam_Com4 = (ctrlText 58)";
			};
		#endif
		class Background_List : GCam_DialogBase_Static
		{
			idc = 0;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - LISTWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT;
			w = LISTWIDTH;
			h = LISTHEIGHT;
		};
		class List : GCam_DialogBase_ListBox
		{
			idc = 50;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - LISTWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT;
			onMouseMoving =  "GCam_OCL = _this";
			onKeyDown = "GCam_KeyDown_List = _this";
			onLBSelChanged = "GCam_LSC = _this";
		};
		class Combo_ListViewMode : GCam_DialogBase_Combo
		{
			idc = 2;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH - SPACE - BUTTONWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - BUTTONHEIGHT;
			onMouseMoving = "GCam_OC = _this; GCam_F = _this select 3";
			onLBSelChanged = "GCam_BId = ""vc""; GCam_B = true";
		};
		class Button_ListTrigger : GCam_DialogBase_Button
		{
			idc = 3;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH - SPACE - BUTTONWIDTH - SPACE - BUTTONWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - BUTTONHEIGHT;
			text = "F.Trig";
			toolTip = "Toggle Firing and Ejection Trigger (Guided missile, Designated bomb, Mortar, Cannon and Ejected unit)";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""trg""; GCam_B = true";
		};
		class Button_ListFollow : GCam_DialogBase_Button
		{
			idc = 4;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH - SPACE - BUTTONWIDTH - SPACE - BUTTONWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT;
			text = "Follow";
			toolTip = "Toggle Follow Mode";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""fo""; GCam_B = true";
		};
		class Button_ListBehind : GCam_DialogBase_Button
		{
			idc = 5;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH - SPACE - BUTTONWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT;
			text = "Behind";
			toolTip = "Toggle Behind Mode";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""be""; GCam_B = true";
		};
		class Button_ListFocus : GCam_DialogBase_Button
		{
			idc = 6;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT;
			text = "Focus";
			toolTip = "Toggle Focus Mode";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""fc""; GCam_B = true";
		};
		class Button_ListTimeInc : GCam_DialogBase_Button
		{
			idc = 8;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH2 - SPACE - BUTTONWIDTH2;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - TEXTHEIGHT - SPACE - BUTTONHEIGHT;
			h = BUTTONHEIGHT/2;
			w = BUTTONWIDTH2;
			text = "+";
			toolTip = "Increase AccTime";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""ti""; GCam_B = true";
		};
		class Button_ListTimeDec : GCam_DialogBase_Button
		{
			idc = 9;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH2 - SPACE - BUTTONWIDTH2;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - TEXTHEIGHT - SPACE - BUTTONHEIGHT + BUTTONHEIGHT/2 + 0.001;
			h = BUTTONHEIGHT/2;
			w = BUTTONWIDTH2;
			text = "-";
			toolTip = "Decrease AccTime";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""td""; GCam_B = true";
		};
		class Text_ListAccTime : GCam_DialogBase_StructuredText
		{
			idc = 10;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH2 - SPACE - BUTTONWIDTH2 - TEXTWIDTH;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - TEXTHEIGHT - SPACE - BUTTONHEIGHT;
			w = TEXTWIDTH;
		};
		class Background_ListHelp : GCam_DialogBase_Static
		{
			idc = 79;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - LISTWIDTH;
			y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME;
			colorBackground[] = {0,0,0,0};
			w = LISTWIDTH;
			h = SafeZoneH - (OUTFRAME*2 + LISTHEIGHT + (BUTTONHEIGHT+SPACE)*3 + SPACE);
		};
		class Edit_ListHelp : GCam_DialogBase_EditMulti
		{
			idc = 80;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - LISTWIDTH;
			y = 0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME;
			h = SafeZoneH - (OUTFRAME*2 + LISTHEIGHT + (BUTTONHEIGHT+SPACE)*3 + SPACE);
			colorText[] = {0.0,0.0,0.0,0.0};
			onMouseMoving = "GCam_OC = _this";
		};
		class Button_ListHelp : GCam_DialogBase_Button
		{
			idc = 21;
			x = 1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - BUTTONWIDTH2;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - BUTTONHEIGHT - SPACE - BUTTONHEIGHT;
			h = BUTTONHEIGHT;
			w = BUTTONWIDTH2;
			text = "?";
			toolTip = "Help";
			onMouseMoving =  "GCam_OC = _this";
			onButtonClick = "GCam_BId = ""hp""; GCam_B = true";
		};
		class Button_MapSize : GCam_DialogBase_Button
		{
			idc = 22;
			x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME;
			h = BUTTONHEIGHT;
			w = BUTTONWIDTH2;
			text = "<>";
			toolTip = "Resize Map (drag)";
			onMouseMoving =  "GCam_OC = _this";
			onMouseButtonDown = "GCam_MD2 = _this";
			onMouseButtonUp = "GCam_MU2 = _this";
		};
		class Map : GCam_DialogBase_Map
		{
			idc = 100;
			x = 0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME;
			y = 1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME;
			onMouseMoving =  "GCam_OC = _this; GCam_OCM = _this";
		};
	};
};


class GCam_Dialog_Quit
{
	idd = 5102;
	movingEnable = 0;
	class controls
	{
		class Text_Quit : GCam_DialogBase_StructuredText
		{
			idc = 0;
			x = 0.398;
			y = 0.44;
			w = 0.204;
			h = 0.120;
			size = 0.04;
			text = "Quit GCam?";
		};
		class Button_QuitOk : GCam_DialogBase_Button
		{
			idc = 3;
			x = 0.438;
			y = 0.505;
			h = 0.035;
			w = 0.0560;
			text = "OK";
			toolTip = "Quit GCam";
			onButtonClick = "GCam_BId = ""quit""; GCam_B = true";
		};
		class Button_QuitCancel : GCam_DialogBase_Button
		{
			idc = 4;
			x = 0.505;
			y = 0.505;
			h = 0.035;
			w = 0.0810;
			text = "Cancel";
			toolTip = "Continue GCam";
			onButtonClick = "GCam_BId = ""cancel""; GCam_B = true";
		};
	};
};
