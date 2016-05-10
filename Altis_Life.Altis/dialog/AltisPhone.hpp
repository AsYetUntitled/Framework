class AltisPhone {
    idd = 6600;
    movingEnable = 0;
    enableSimulation = 1;
    name = "AltisPhone";
    onLoad = "";
    controls[] = {
        backgroundScreen,
        backgroundPhone,
        mapIcon,
        speechIcon,
        mailIcon,
        settingsIcon,
        framePhone
    };

    class backgroundScreen: Life_RscPicture {
        idc = 6601;
        text = "textures\phone_bg_manwar.paa";
        x = 0.710431 * safezoneW + safezoneX;
        y = 0.533 * safezoneH + safezoneY;
        w = 0.15 * safezoneW;
        h = 0.5 * safezoneH;
    };

    class backgroundPhone: Life_RscPicture {
        idc = 6600;
        text = "textures\phone_frame.paa";
        x = 0.710431 * safezoneW + safezoneX;
        y = 0.533 * safezoneH + safezoneY;
        w = 0.15 * safezoneW;
        h = 0.5 * safezoneH;
    };

    class mapIcon: Life_RscPicture {
        idc = 6602;
        text = "icons\ico_map.paa";
        x = 0.733088 * safezoneW + safezoneX;
        y = 0.896 * safezoneH + safezoneY;
        w = 0.025 * safezoneW;
        h = 0.04 * safezoneH;
    };

    class speechIcon: Life_RscPicture {
        idc = 6603;
        text = "icons\ico_speech.paa";
        x = 0.75965 * safezoneW + safezoneX;
        y = 0.896 * safezoneH + safezoneY;
        w = 0.025 * safezoneW;
        h = 0.04 * safezoneH;
    };

    class mailIcon: Life_RscPicture {
        idc = 6604;
        text = "icons\ico_mail.paa";
        x = 0.786212 * safezoneW + safezoneX;
        y = 0.896 * safezoneH + safezoneY;
        w = 0.025 * safezoneW;
        h = 0.04 * safezoneH;
    };

    class settingsIcon: Life_RscPicture {
        idc = 6605;
        text = "icons\ico_settings.paa";
        x = 0.812774 * safezoneW + safezoneX;
        y = 0.896 * safezoneH + safezoneY;
        w = 0.025 * safezoneW;
        h = 0.04 * safezoneH;
    };

    class framePhone: Life_RscFrame {
        idc = 6606;
        x = 0.734118 * safezoneW + safezoneX;
        y = 0.6276 * safezoneH + safezoneY;
        w = 0.104156 * safezoneW;
        h = 0.2112 * safezoneH;
    };
};
