/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*/
class CfgSpawnPoints {
    class Civilian {
        class Kavala {
            displayName = "Kavala";
            spawnMarker = "civ_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira";
            spawnMarker = "civ_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos";
            spawnMarker = "civ_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Sofia {
            displayName = "Sofia";
            spawnMarker = "civ_spawn_4";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class RebelS {
            displayName = "Northern Rebel Base";
            spawnMarker = "Rebelop";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license = "rebel";
            level[] = { "", "", -1 };
        };

        class RebelN {
            displayName = "Southern Rebel Base";
            spawnMarker = "Rebelop_1";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license = "rebel";
            level[] = { "", "", -1 };
        };

        class RebelE {
            displayName = "Eastern Rebel Base";
            spawnMarker = "Rebelop_2";
            icon = "\a3\ui_f\data\map\MapControl\bunker_ca.paa";
            license = "rebel";
            level[] = { "", "", -1 };
        };
    };

    class Cop {
        class Kavala {
            displayName = "Kavala HQ";
            spawnMarker = "cop_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira HQ";
            spawnMarker = "cop_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos HQ";
            spawnMarker = "cop_spawn_2";
            icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Air {
            displayName = "Air HQ";
            spawnMarker = "cop_spawn_4";
            icon = "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 2 };
        };

        class HW {
            displayName = "HW Patrol";
            spawnMarker = "cop_spawn_5";
            icon = "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa";
            license = "";
            level[] = { "life_coplevel", "SCALAR", 3 };
        };
    };

    class Medic {
        class Kavala {
            displayName = "Kavala Hospital";
            spawnMarker = "medic_spawn_1";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Athira {
            displayName = "Athira Regional";
            spawnMarker = "medic_spawn_2";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };

        class Pyrgos {
            displayName = "Pyrgos Hospital";
            spawnMarker = "medic_spawn_3";
            icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
            license = "";
            level[] = { "", "", -1 };
        };
    };
};
