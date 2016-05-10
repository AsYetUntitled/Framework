class DeathScreen {
    idd = 7300;
    name = "Life_Death_Screen";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground { };

    class Controls {
        class MedicsOnline: Life_RscText {
            idc = 7304;
            colorBackground[] = {0,0,0,0};
            text = "Medics Online: 1";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.015 * safezoneH + safezoneY;
            w = 0.8;
            h = (1 / 25);
        };

        class MedicsNearby: Life_RscText {
            idc = 7305;
            colorBackground[] = {0,0,0,0};
            text = "Medics Nearby: No";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.040 * safezoneH + safezoneY;
            w = 0.8;
            h = (1 / 25);
        };

        class RespawnBtn: Life_RscButtonMenu {
            idc = 7302;
            x = 0.9 * safezoneW + safezoneX;
            y = 0.015 * safezoneH + safezoneY;
            w = (9 / 40);
            h = (1 / 25);
            text = "Respawn";
            onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
            class Attributes {align = "center";};
        };

        class MedicBtn: Life_RscButtonMenu {
            idc = 7303;
            x = 0.9 * safezoneW + safezoneX;
            y = 0.040 * safezoneH + safezoneY;
            w = (9 / 40);
            h = (1 / 25);
            onButtonClick = "[] call life_fnc_requestMedic;";
            text = "Request Medic";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
            class Attributes {align = "center";};
        };

        class respawnTime: Life_RscText {
            idc = 7301;
            colorBackground[] = {0,0,0,0.5};
            text = "";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.7 * safezoneH + safezoneY;
            w = 0.4;
            h = (1 / 25);
        };
    };
};
