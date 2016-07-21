/*
    price - Cost of the building
    numberCrates - Allowed number of crates
    restrictedPos[] - Same as the old fn_getBuildingPositions. A list of restricted building positions (i.e, to stop spawning outside, or by windows etc)
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
    // Houses with Garages
        class Land_Hotel_01_F {
            price = 960000;
            numberCrates = 5;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {-1.27246,-11.4361,-5.63821};
            garageSpawnDir = 0;
        };
        
        class Land_Hotel_02_F {
            price = 2000000;
            numberCrates = 8;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {14.1128,1.51736,-4.18449};
            garageSpawnDir = 0;
        };
        
        class Land_GarageShelter_01_F {
            price = 80000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {0.241684,-5.72266,-1.46744};
            garageSpawnDir = 0;
        };
        
        
        class Land_House_Big_02_F {
            price = 450000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {12.8365,0.414551,-1.81252};
            garageSpawnDir = 0;
        };
        
        class Land_School_01_F {
            price = 3000000;
            numberCrates = 8;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {-6.91215,-11.5288,-1.70768};
            garageSpawnDir = 0;
        };
        
        class Land_House_Big_04_F {
            price = 140000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {12.308,-0.228027,-3.34715};
            garageSpawnDir = 0;
        };
        
        class Land_House_Big_03_F {
            price = 900000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = true;
            garageSpawnPos[] = {14.9072,0.394043,-3.60528};
            garageSpawnDir = 0;
        };
        
        // Houses without Garages
        class Land_House_Big_01_F {
            price = 350000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_House_Small_03_F {
            price = 600000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_House_Small_06_F {
            price = 700000;
            numberCrates = 3;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_Slum_03_F {
            price = 450000;
            numberCrates = 4;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_Addon_04_F {
            price = 120000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_Slum_01_F {
            price = 200000;
            numberCrates = 1;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_House_Small_05_F {
            price = 100000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_House_Small_02_F {
            price = 160000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
        
        class Land_House_Small_04_F {
            price = 130000;
            numberCrates = 2;
            restrictedPos[] = {};
            canGarage = false;
            garageSpawnPos[] = {};
            garageSpawnDir = 0;
        };
    };
};
