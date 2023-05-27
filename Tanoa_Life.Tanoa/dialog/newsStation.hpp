class life_news_broadcast {
    idd = 100100;
    name= "life_news_broadcast";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
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
            idc = -1;
            text = "$STR_News_DialogTitle";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MsgHeader: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_News_MsgHeader";
            x = 0.1;
            y = 0.25;
            w = 0.6;
            h = (1 / 25);
        };

        class MsgHeaderEdit: Life_RscEdit {
            idc = 100101;
            text = "";
            sizeEx = 0.035;
            x = 0.11;
            y = 0.3;
            w = 0.62;
            h = 0.03;
        };

        class MsgText: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_News_MsgContent";
            x = 0.1;
            y = 0.33;
            w = 0.6;
            h = (1 /25);
        };

        class MsgContentEdit: Life_RscEdit {
            idc = 100102;
            text = "";
            sizeEx = 0.035;
            x = 0.11;
            y = 0.38;
            w = 0.62;
            h = 0.03;
        };

        class MessageInfo: Life_RscStructuredText {
            colorBackground[] = {0, 0, 0, 0};
            idc = 100103;
            text = "";
            x = 0.1;
            y = 0.43;
            w = 0.6;
            h = .275;
        };

        class ConfirmButtonKey: Life_RscButtonMenu {
            idc = 100104;
            text = "$STR_News_Broadcast";
            x = (6.25 / 40) + (4.2 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.51 + (1 / 50);
            w = (10.5 / 40);
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