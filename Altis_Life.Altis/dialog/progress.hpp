class life_progress
{
	name = "life_progress";
	idd = 3400;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground {

		class ProgressBarBackground : Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1999 - 0.004;
			y = 0.074 - 0.004;
			w = 0.6 + 0.008;
			h = 0.05 + 0.008;
		};
		
		class ProgressBarFillBar : Life_RscText {
			colorBackground[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", 
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", 
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 
				"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"
			};
			idc = 3401;
			x = 0.1999;
			y = 0.074;
			w = 0;
			h = 0.05;
		};
		
		class ProgressBarText : Life_RscText {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3402;
			x = 0.1999;
			y = 0.074;
			w = 0.6;
			h = 0.05;
		};
		
	};
};