class life_debug_connsole {
    idd = 373850;
    name= "life_debug_connsole";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlSetFocus txtConsole; hint 'Please beware no safety features are included, be careful what you exec!';";

    class controlsBackground {
        class MainBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.338375 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.374 * safezoneH;
        };

        class Life_RscTitleBackground: Life_RscText {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "Debug Console"; //TODO: localize
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class btnServerExec: Life_RscButtonMenu {
            idc = -1;
            text = "Server Exec"; //TODO: localize
            onButtonClick = "(ctrlText 1337) remoteExec ['life_fnc_adminDebugConExec', 2];";
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.71575 * safezoneH + safezoneY;
            w = 0.1215 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class btnGlobalExec: Life_RscButtonMenu {
            idc = -1;
            text = "Global Exec"; //TODO: localize
            onButtonClick = "(ctrlText 1337) remoteExec ['life_fnc_adminDebugConExec'];";
            x = 0.43925 * safezoneW + safezoneX;
            y = 0.71575 * safezoneH + safezoneY;
            w = 0.1215 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class btnLocalExec: Life_RscButtonMenu {
            idc = -1;
            text = "Local Exec"; //TODO: localize
            onButtonClick = "(ctrlText 1337) remoteExec ['life_fnc_adminDebugConExec', player];";
            x = 0.563041633 * safezoneW + safezoneX;
            y = 0.71575 * safezoneH + safezoneY;
            w = 0.1215 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class txtConsole: Life_RscEditMulti {
            idc = 1337;
            text = "";
            x = 0.318375 * safezoneW + safezoneX;
            y = 0.346375 * safezoneH + safezoneY;
            w = 0.36325 * safezoneW;
            h = 0.358 * safezoneH;
        };
    };
};