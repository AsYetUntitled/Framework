class Life_impound_menu {
    idd = 2800;
    name="life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText    {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };

        class Title: Life_RscTitle {
            idc = 2801;
            text = "$STR_GUI_Garage";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class VehicleTitleBox: Life_RscText {
            idc = -1;
            text = "$STR_GUI_YourVeh";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.11;
            y = 0.26;
            w = 0.3;
            h = (1 / 25);
        };

        class VehicleInfoHeader: Life_RscText {
            idc = 2830;
            text = "$STR_GUI_VehInfo";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.42;
            y = 0.26;
            w = 0.46;
            h = (1 / 25);
        };

        class CloseBtn: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class RetrieveCar: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Retrieve";
            onButtonClick = "[] call life_fnc_unimpound;";
            x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class SellCar: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Sell";
            onButtonClick = "[] spawn life_fnc_sellGarage;";
            x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };

    class controls {
        class VehicleList: Life_RscListBox {
            idc = 2802;
            text = "";
            sizeEx = 0.04;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_garageLBChange;";
            x = 0.11;
            y = 0.302;
            w = 0.303;
            h = 0.49;
        };

        class vehicleInfomationList: Life_RscStructuredText {
            idc = 2803;
            text = "";
            sizeEx = 0.035;
            x = 0.41;
            y = 0.3;
            w = 0.5;
            h = 0.5;
        };

        class MainBackgroundHider: Life_RscText {
            colorBackground[] = {0,0,0,1};
            idc = 2810;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.7 - (22 / 250);
        };

        class MainHideText: Life_RscText {
            idc = 2811;
            text = "$STR_ANOTF_QueryGarage";
            sizeEx = 0.06;
            x = 0.24;
            y = 0.5;
            w = 0.6;
            h = (1 / 15);
        };
    };
};
