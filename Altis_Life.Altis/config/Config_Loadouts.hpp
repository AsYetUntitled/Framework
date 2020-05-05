#define true 1
#define false 0
/*
    class PLAYERSIDE { // PLAYERSIDE can be: WEST (for cops), CIV (for civ/reb), GUER (for medics), EAST (for opfor)
        // NOTES:
        //     empty array means that nothing will be add on players
        //     CIV's loadout are selected randonly if he is not in jail,
        //         otherwise, for the other teams, player will get the uniform related to his level

		// Unit Loadout Array detailed information: https://community.bistudio.com/wiki/Unit_Loadout_Array
        class side_level_X : side_level_0 { // where side can be: civ, cop or med. And X is a level number of the given side
            uniformClass = "";
            backpack = "";
            linkedItems[] = {};
            weapons[] = {};
            items[] = {};
            magazines[] = {};
        };
    };
*/
class Loadouts {
    // CIV
    civilian_randomClothing = true; // true: select a random uniform from 'civRandomClothing' and adds into 'civ_level_random' class - false: use 'civ_level_random' class as it is
    civRandomClothing[] = {"U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_C_Commoner1_1"}; // Clothes that a civilian can spawn with
    class civ_level_random {
        uniformClass = "U_C_Commoner1_1";
        backpack = "";
        linkedItems[] = {"ItemMap" , "ItemCompass", "ItemWatch"};
        weapons[] = {};
        items[] = {};
        magazines[] = {};
    };
    class civ_level_arrested { // Arrested player's loadout
        uniformClass = "U_C_WorkerCoveralls";
        backpack = "";
        linkedItems[] = {};
        weapons[] = {};
        items[] = {};
        magazines[] = {};
    };

    // COP
    class cop_level_0 {
        uniformClass = "U_Rangemaster";
        backpack = "";
        linkedItems[] = {"H_Cap_blk", "V_Rangemaster_belt", "ItemMap" , "ItemCompass", "ItemWatch"};
        weapons[] = {"hgun_P07_snds_F"};
        items[] = {};
        magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
    };
    class cop_level_1 : cop_level_0 {};
    class cop_level_2 : cop_level_0 {};
    class cop_level_3 : cop_level_0 {};
    class cop_level_4 : cop_level_0 {};
    class cop_level_5 : cop_level_0 {};
    class cop_level_6 : cop_level_0 {};
    class cop_level_7 : cop_level_0 {};

    // MED
    class med_level_0 {
        uniformClass = "U_Rangemaster";
        backpack = "";
        linkedItems[] = {"H_Cap_red", "ItemMap" , "ItemCompass", "ItemWatch"};
        weapons[] = {};
        items[] = {"FirstAidKit", "FirstAidKit"};
        magazines[] = {};
    };
    class med_level_1 : med_level_0 {};
    class med_level_2 : med_level_0 {};
    class med_level_3 : med_level_0 {};
    class med_level_4 : med_level_0 {};
    class med_level_5 : med_level_0 {};

    // EAST
    class east_level_0 {
        uniformClass = "U_C_Commoner1_1";
        backpack = "";
        linkedItems[] = {"ItemMap" , "ItemCompass", "ItemWatch"};
        weapons[] = {};
        items[] = {};
        magazines[] = {};
    };
};
