class Life_FuelStat {
    idd = 20300;
    name="life_fuelStat";
    movingEnabled = 0;
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
            idc = 20301;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };

        class VehicleTitleBox: Life_RscText {
            idc = -1;
            text = "$STR_GUI_ShopStock";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.11;
            y = 0.26;
            w = 0.32;
            h = (1 / 25);
        };

        class VehicleInfoHeader: Life_RscText {
            idc = 20330;
            text = "$STR_GUI_VehInfo";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.46;
            y = 0.26;
            w = 0.42;
            h = (1 / 25);
        };

        class FuelPrice: Life_RscTitle {
            idc = 20322;
            text = "Price:";
            x = 0.15;
            y = 0.8;
            w = 0.8;
            h = (1 / 25);
        };

        class literfuel: Life_RscTitle {
            idc = 20324;
            text = "Fuel:";
            x = 0.55;
            y = 0.75;
            w = 0.8;
            h = (1 / 25);
        };
        class Totalfuel: Life_RscTitle {
            idc = 20323;
            text = "Total:";
            x = 0.75;
            y = 0.8;
            w = 0.8;
            h = (1 / 25);
        };
        class CloseBtn: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0; life_action_inUse = false;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class refuelCar: Life_RscButtonMenu {
            idc = 20309;
            text = "Refuel";
            onButtonClick = "[] spawn life_fnc_FuelRefuelcar;";
            x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.9 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };

    class controls {
        class VehicleList: Life_RscListBox {
            idc = 20302;
            text = "";
            sizeEx = 0.04;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_fuelLBChange";
            x = 0.11;
            y = 0.302;
            w = 0.32;
            h = 0.49;
        };

        class fuelTank: life_RscXSliderH {
            idc = 20901;
            text = "";
            onSliderPosChanged = "[3,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "";
            x = 0.47;
            y = .80;
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };

        class vehicleInfomationList: Life_RscStructuredText
        {
            idc = 20303;
            text = "";
            sizeEx = 0.035;
            x = 0.46;
            y = 0.3;
            w = 0.42;
            h = 0.5;
        };
    };
};