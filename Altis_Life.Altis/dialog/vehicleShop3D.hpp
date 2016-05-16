class Life_Vehicle_Shop_v2_3D {
    idd = 2300;
    name="life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";
    onUnLoad = "[] call life_fnc_vehicleShopEnd3DPreview";

    class controlsBackground {
        class MainBackground: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.638 * safezoneH;
        };

        class SecondBackground: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.809375 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.341 * safezoneH;
        };

        class Title: Life_RscTitle {
            idc = 2301;
            text = "";
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.027 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class VehicleTitleBox: Life_RscText    {
            idc = -1;
            text = "$STR_GUI_ShopStock";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class VehicleInfoHeader: Life_RscText {
            idc = 2330;
            text = "$STR_GUI_VehInfo";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.809375 * safezoneW + safezoneX;
            y = 0.058 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class CloseBtn: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.669387 * safezoneH + safezoneY;
            w = 0.0721724 * safezoneW;
            h = 0.0219957 * safezoneH;
        };

        class RentCar: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_RentVeh";
            onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
            x = 0.0964687 * safezoneW + safezoneX;
            y = 0.636393 * safezoneH + safezoneY;
            w = 0.0721724 * safezoneW;
            h = 0.0219957 * safezoneH;
        };

        class BuyCar: Life_RscButtonMenu {
            idc = 2309;
            text = "$STR_Global_Buy";
            onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.636393 * safezoneH + safezoneY;
            w = 0.0721724 * safezoneW;
            h = 0.0219957 * safezoneH;
        };
    };

    class controls {
        class VehicleList: Life_RscListBox {
            idc = 2302;
            text = "";
            sizeEx = 0.04;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
            x = 0.023487 * safezoneW + safezoneX;
            y = 0.095 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.50 * safezoneH;
        };

        class ColorList: Life_RscCombo {
            idc = 2304;
            onLBSelChanged = "[] call life_fnc_vehiclecolor3DRefresh;";
            x = 0.0204687 * safezoneW + safezoneX;
            y = 0.6034 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.0219957 * safezoneH;
        };

        class vehicleInfomationList: Life_RscStructuredText    {
            idc = 2303;
            text = "";
            sizeEx = 0.035;
            x = 0.819688 * safezoneW + safezoneX;
            y = 0.104 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.275 * safezoneH;
        };
    };
};
