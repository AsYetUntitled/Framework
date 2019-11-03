/*
    class PLAYERSIDE { // PLAYERSIDE can be: WEST (for cops), CIV (for civ/reb), GUER (for medics), EAST (for opfor)
        // NOTES:
        //     empty array means that nothing will be add on players
        //     if you put more than a cloth on thev CIV's class, they will be selected randonly,
        //         otherwise, for the other teams, player will get the cloth related to his level

        itemType[] = { // itemType can be: cloth, vest, backpack, weapon, items or linkedItems
            { "classname", "conditions" }
        };
    };
*/
class Loadouts {
    // COP
    class WEST {
        cloth[] = {
            {"U_Rangemaster", "call life_copLevel >= 0"}
        };
        vest[] = {
            {"V_Rangemaster_belt", "call life_copLevel >= 0"}
        };
        backpack[] = {};
        weapon[] = {
            {"hgun_P07_snds_F", "call life_copLevel >= 0"}
        };
        mags[] = {
            {"16Rnd_9x21_Mag", 6, "call life_copLevel >= 0"}
        };
        items[] = {};
        linkedItems[] = {
            "ItemMap",
            "ItemCompass",
            "ItemWatch"
        };
    };

    // CIV
    class CIV {
        cloth[] = {
            {"U_C_Poloshirt_blue", "!life_is_arrested"},
            {"U_C_Poloshirt_burgundy", "!life_is_arrested"},
            {"U_C_Poloshirt_stripped", "!life_is_arrested"},
            {"U_C_Poloshirt_tricolour", "!life_is_arrested"},
            {"U_C_Poloshirt_salmon", "!life_is_arrested"},
            {"U_C_Poloshirt_redwhite", "!life_is_arrested"},
            {"U_C_Commoner1_1", "!life_is_arrested"}
        };
        vest[] = {};
        backpack[] = {};
        weapon[] = {};
        mags[] = {};
        items[] = {};
        linkedItems[] = {
            "ItemMap",
            "ItemCompass",
            "ItemWatch"
        };
    };

    // MED
    class GUER {
        cloth[] = {
            {"U_Rangemaster", "call life_medicLevel >= 1"}
        };
        vest[] = {
            {"V_Rangemaster_belt", "call life_medicLevel >= 1"}
        };
        backpack[] = {};
        weapon[] = {
            {"hgun_P07_snds_F", "call life_medicLevel >= 1"}
        };
        mags[] = {
            {"16Rnd_9x21_Mag", 1, "call life_medicLevel >= 1"}
        };
        items[] = {
            {"FirstAidKit", 2, "call life_medicLevel >= 1"}
        };
        linkedItems[] = {
            "ItemMap",
            "ItemCompass",
            "ItemWatch"
        };
    };
};
