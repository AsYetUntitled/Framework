/*
Anything defined in Config_Garages is strictly just a garage, it will not act like a house.
price - Cost of the garage
garageSpawnPos[] - worldToModel position to spawn vehicles
garageSpawnDir - Offset to garage direction to spawn at (+-90 etc). It will be used in the manner: getDir _garage + spawnDir
*/

class Garages {

    class Altis {

        class Land_i_Garage_V1_F {
        price = 500000;
        garageSpawnPos[] = {-11.5,0,0};
        garageSpawnDir = -90;
        };

        class Land_i_Garage_V2_F : Land_i_Garage_V1_F{};

    };

    class Tanoa {};

        class Land_SM_01_shed_F {
        price = 140000;
        garageSpawnPos[] = {-11.404,3.81494,-1.64553};
        garageSpawnDir = 0;
        };

        class Land_SM_01_shed_F : Land_i_Shed_Ind_F{};

        class Land_Addon_05_F {
        price = 130000;
        garageSpawnPos[] = {0.0668793,-13.8677,-1.85385};
        garageSpawnDir = 0;
        };

        class Land_DPP_01_smallFactory_F {
        price = 160000;
        garageSpawnPos[] = {-1.13538,6.99512,-2.21416};
        garageSpawnDir = 0;
        };

        class Land_Warehouse_03_F {
        price = 180000;
        garageSpawnPos[] = {-3.90981,-8.46338,-2.53567};
        garageSpawnDir = 0;
        };
    };
};
