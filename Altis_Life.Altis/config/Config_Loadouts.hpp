/*
    class PLAYERSIDE { // PLAYERSIDE can be: WEST (for cops), CIV (for civ/reb), GUER (for medics), EAST (for opfor)
        // NOTES:
        //     empty array means that nothing will be add on players
        //     CIV's loadout are selected randonly if he is not in jail,
        //         otherwise, for the other teams, player will get the uniform related to his level

        class lvl_X : lvl_0 { // where X is the level of the selected team and inherits from lvl_0
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
    class CIV {
        class lvl_0 {
            uniformClass = "U_C_Poloshirt_blue";
			backpack = "";
			linkedItems[] = {"ItemMap" , "ItemCompass", "ItemWatch"};
			weapons[] = {};
			items[] = {};
			magazines[] = {};
        };
        class lvl_1 : lvl_0 {
            uniformClass = "U_C_Poloshirt_burgundy";
        };
        class lvl_2 : lvl_0 {
            uniformClass = "U_C_Poloshirt_stripped";
        };
        class lvl_3 : lvl_0 {
            uniformClass = "U_C_Poloshirt_tricolour";
        };
        class lvl_4 : lvl_0 {
            uniformClass = "U_C_Poloshirt_salmon";
        };
        class lvl_5 : lvl_0 {
            uniformClass = "U_C_Poloshirt_redwhite";
        };
        class lvl_6 : lvl_0 {
            uniformClass = "U_C_Commoner1_1";
        };
        class lvl_arrested : lvl_0 {
            uniformClass = "U_C_WorkerCoveralls"; // Arrested player's uniform
            linkedItems[] = {};
        };
    };

    // COP
    class WEST {
		class lvl_0 {
            uniformClass = "U_Rangemaster";
			backpack = "";
			linkedItems[] = {"H_Cap_blk", "V_Rangemaster_belt", "ItemMap" , "ItemCompass", "ItemWatch"};
			weapons[] = {"hgun_P07_snds_F"};
			items[] = {};
            magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
		};
        class lvl_1 : lvl_0 {};
        class lvl_2 : lvl_0 {};
        class lvl_3 : lvl_0 {};
        class lvl_4 : lvl_0 {};
        class lvl_5 : lvl_0 {};
        class lvl_6 : lvl_0 {};
        class lvl_7 : lvl_0 {};
    };

    // MED
    class GUER {
        class lvl_0 {
            uniformClass = "U_Rangemaster";
			backpack = "";
			linkedItems[] = {"H_Cap_red", "ItemMap" , "ItemCompass", "ItemWatch"};
			weapons[] = {};
			items[] = {"FirstAidKit", "FirstAidKit"};
			magazines[] = {};
        };
        class lvl_1 : lvl_0 {};
        class lvl_2 : lvl_0 {};
        class lvl_3 : lvl_0 {};
        class lvl_4 : lvl_0 {};
        class lvl_5 : lvl_0 {};
    };
};
