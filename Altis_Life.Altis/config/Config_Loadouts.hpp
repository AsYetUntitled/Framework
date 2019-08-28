class LifeStartupLoadouts {
    commonItens[] = {"ItemMap","ItemCompass","ItemWatch"}; //Common link items between sides
    class WEST {
        life_loadOutItens[] = {
            "U_Rangemaster", //Uniform - empty ("" or {""} or {}) will load nothing...Otherwise, use "" for a unique uniform or {"",""} for a randomly selected uniform
            "V_Rangemaster_belt", //Vest - empty ("") will load nothing
            "", //Backpack - empty ("") will load nothing
            "hgun_P07_snds_F", //Weapon - empty ("") will load nothing
            {"16Rnd_9x21_Mag",6}, //Mags, amount - empty ("",0) will load nothing
            {} //Specific items to be loaded on player - empty ({}) will load nothing...Otherwise, {"ItemName", Amount}
        };
    };

    class CIV {
        life_loadOutItens[] = {
            {"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"}, //Uniform - empty ("" or {""}) will load nothing...Otherwise, use "" for a unique uniform or {"",""} for a randomly selected uniform
            "", //Vest - empty ("") will load nothing
            "", //Backpack - empty ("") will load nothing
            "", //Weapon - empty ("") will load nothing
            {"",0}, //Mags, amount - empty ("",0) will load nothing
            {} //Specific items to be loaded on player - empty ({}) will load nothing...Otherwise, {"ItemName", Amount}
        };
    };

    class GUER {
        life_loadOutItens[] = {
            "U_I_HeliPilotCoveralls", //Uniform - empty ("" or {""}) will load nothing...Otherwise, use "" for a unique uniform or {"",""} for a randomly selected uniform
            "V_Rangemaster_belt", //Vest - empty ("") will load nothing
            "", //Backpack - empty ("") will load nothing
            "hgun_P07_snds_F", //Weapon - empty ("") will load nothing
            {"16Rnd_9x21_Mag",1}, //Mags, amount - empty ("",0) will load nothing
            {{"FirstAidKit",2}} //Specific items to be loaded on player - empty ({}) will load nothing...Otherwise, {"ItemName", Amount}
        };
    };
};