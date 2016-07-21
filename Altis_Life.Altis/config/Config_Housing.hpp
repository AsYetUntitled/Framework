/*

    price - Cost of the building
    numberCrates - Allowed number of crates
    restrictedPos[][] - Same as the old fn_getBuildingPositions. A list of restricted building positions (i.e, to stop spawning outside, or by windows etc)
    canGarage - True if the building can be used as a garage (need to buy ontop)
    garageSpawnPos[] - worldToModel position to spawn vehicles, leave {} if canGarage is false.
    garageSpawnDir - Offset to garage direction to spawn at (+-90 etc). It will be used in the manner: getDir _garage + spawnDir
        default: 0

*/

class Housing {
  
    class Altis {

        class Land_i_House_Big_02_V1_F {
            price = 1550000;
            numberCrates = 3;
            restrictedPos[] = {0,1,2,3,4};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
        class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

        class Land_i_House_Big_01_V1_F {
            price = 2200000;
            numberCrates = 4;
            restrictedPos[] = {2,3};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };

        class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
        class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};

        class Land_i_House_Small_01_V1_F {
            price = 1050000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };

        class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
        class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

        class Land_i_House_Small_02_V1_F {
            price = 1000500;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };

        class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
        class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};

        class Land_i_House_Small_03_V1_F {
            price = 1250000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };

        class Land_i_Stone_HouseSmall_V1_F {
            price = 750000;
            numberCrates = 1;
            restrictedPos[] = {0,1,3,4};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };

        class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F{};
        class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F{};

    };

    class Tanoa {};

};
