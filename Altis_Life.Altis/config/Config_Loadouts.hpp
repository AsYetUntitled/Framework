/*
    class PLAYERSIDE {
        loadOut[] = {
            "", // Uniform - empty ("" or {""} or {}) will load nothing...Otherwise, use "" for a unique uniform or {"",""} for a randomly selected uniform
            "", // Vest - empty ("") will load nothing
            "", // Backpack - empty ("") will load nothing
            "", // Weapon - empty ("") will load nothing
            {{"",0}}, // Mags, amount - empty ({"",0}) will load nothing
            {} // Specific items to be loaded on player - empty ({}) will load nothing...Otherwise, {"ItemName", Amount}
        };
    };
*/
class Loadouts {
    commonItems[] = {"ItemMap","ItemCompass","ItemWatch"}; // Common link items between sides - empty ({} or {""}) will load nothing

    // COP
    class WEST {
        loadOut[] = {
            "U_Rangemaster",
            "V_Rangemaster_belt",
            "",
            "hgun_P07_snds_F",
            {{"16Rnd_9x21_Mag",6}},
            {}
        };
    };

    // CIV
    class CIV {
        loadOut[] = {
            {"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"},
            "",
            "",
            "",
            {{"",0}},
            {}
        };
    };

    // MED
    class GUER {
        loadOut[] = {
            "U_Rangemaster",
            "V_Rangemaster_belt",
            "",
            "hgun_P07_snds_F",
            {{"16Rnd_9x21_Mag",1}},
            {{"FirstAidKit",2}}
        };
    };
};