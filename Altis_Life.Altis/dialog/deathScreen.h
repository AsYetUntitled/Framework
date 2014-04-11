class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	};
	
	class Controls
	{
		class MedicsOnline : Life_RscText
		{
			idc = 7304;
			colorBackground[] = {0,0,0,0};
			text = "Medics Online: 1";
			x = SafeZoneX + 0.01;
			y = SafeZoneY + 0.1;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MEdicsNearby : Life_RscText
		{
			idc = 7305;
			colorBackground[] = {0,0,0,0};
			text = "Medics Nearby: No";
			x = SafeZoneX + 0.01;
			y = SafeZoneY + 0.13;
			w = 0.8;
			h = (1 / 25);
		};
		
		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = SafeZoneX + 2.15;
			y = SafeZoneY + 0.02;
			w = (9 / 40);
			h = (1 / 25);
			text = "Respawn";
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MedicBtn : Life_RscButtonMenu
		{
			idc = 7303;
			x = SafeZoneX + 2.15;
			y = SafeZoneY + 0.07;
			w = (9 / 40);
			h = (1 / 25);
			onButtonClick = "[] call life_fnc_requestMedic;";
			text = "Request Medic";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class respawnTime : Life_RscText
		{
			idc = 7301;
			colorBackground[] = {0,0,0,0};
			text = "";
			x = SafeZoneX + 1.08;
			y = SafeZoneY + 1.7;
			w = 0.8;
			h = (1 / 25);
		};
	};
};