class Life_jail_time{
    idd = 9999;
    name = "life_jail_time";
    movingEnable = 0;
    enableSimulation = 1;

    class controls{
        controls[]=
        {
            jailtime_frame,
            jailtime_text,
            jailtime_input,
            jailtime_btnSubmit
        };
        class jailtime_frame: Life_RscText
        {
            idc = 1800;
            text = "$STR_Jail_Text";
            x = 0.355595 * safezoneW + safezoneX;
            y = 0.401992 * safezoneH + safezoneY;
            w = 0.275684 * safezoneW;
            h = 0.168014 * safezoneH;
            sizeEx = 1 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.5};
        };
        class jailtime_text: Life_RscText
        {
            idc = 1000;
            text = "$STR_Jail_seTime";
            x = 0.368722 * safezoneW + safezoneX;
            y = 0.457996 * safezoneH + safezoneY;
            w = 0.210045 * safezoneW;
            h = 0.0280024 * safezoneH;
        };
        class jailtime_input: Life_RscEdit
        {
            idc = 1400;
            text = "5";
            x = 0.5 * safezoneW + safezoneX;
            y = 0.457996 * safezoneH + safezoneY;
            w = 0.0787669 * safezoneW;
            h = 0.0280024 * safezoneH;
        };
        class jailtime_btnSubmit: Life_RscButtonMenu
        {
            idc = 1600;
            text = "Ok";
            onButtonClick = "[] call life_fnc_jailTime";
            x = 0.5 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.0787669 * safezoneW;
            h = 0.0420036 * safezoneH;
        };
    };
};
