class Life_cell_phone {
    idd = 3000;
    name= "life_cell_phone";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_cellphone";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.64;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.64;
            h = 0.3 - (5 / 250);
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 3001;
            text = "$STR_CELL_Title";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class TextToSend: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 3002;
            text = "$STR_CELL_TextToSend";
            x = 0.1;
            y = 0.25;
            w = 0.6;
            h = (1 / 25);
        };

        class textEdit: Life_RscEdit {
            idc = 3003;
            text = "";
            sizeEx = 0.030;
            x = 0.11;
            y = 0.3;
            w = 0.62;
            h = 0.03;
        };

        class TextMsgButton: Life_RscButtonMenu {
            idc = 3015;
            text = "$STR_CELL_TextMSGBtn";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[_this, 'player'] call life_fnc_sendMessage";
            x = 0.11;
            y = 0.35;
            w = 0.2;
            h = (1 / 25);
        };

        class PlayerList: Life_RscCombo {
            idc = 3004;
            x = 0.11;
            y = 0.4;
            w = 0.2;
            h = (1 / 25);
        };

        class TextCopButton: Life_RscButtonMenu {
            idc = 3016;
            text = "$STR_CELL_TextPolice";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[_this, 'cop'] call life_fnc_sendMessage";
            x = 0.32;
            y = 0.35;
            w = 0.2;
            h = (1 / 25);
        };

        class TextAdminButton: Life_RscButtonMenu {
            idc = 3017;
            text = "$STR_CELL_TextAdmins";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[_this, 'admin'] call life_fnc_sendMessage";
            x = 0.53;
            y = 0.35;
            w = 0.2;
            h = (1 / 25);
        };

        class AdminMsgButton: Life_RscButtonMenu {
            idc = 3020;
            text = "$STR_CELL_AdminMsg";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[_this, 'adminToPlayer'] call life_fnc_sendMessage";
            x = 0.32;
            y = 0.4;
            w = 0.2;
            h = (1 / 25);
        };

        class AdminMsgAllButton: Life_RscButtonMenu {
            idc = 3021;
            text = "$STR_CELL_AdminMSGAll";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[_this, 'adminAll'] call life_fnc_sendMessage";
            x = 0.53;
            y = 0.4;
            w = 0.2;
            h = (1 / 25);
        };

        class EMSRequest: Life_RscButtonMenu {
            idc = 3022;
            text = "$STR_CELL_EMSRequest";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[_this, 'med'] call life_fnc_sendMessage";
            x = 0.11;
            y = 0.45;
            w = 0.2;
            h = (1 / 25);
        };

        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.51 + (1 / 50);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};
