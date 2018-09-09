#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class life_headless_client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "life_hc.pbo";
        author[] = {"Nanou"};
    };
};

class CfgFunctions
{
    class Headless_Client
    {
        tag = "HC";
        class General
        {
            file = "\life_hc\MySQL\General";
            class asyncCall {};
            class bool {};
            class insertRequest {};
            class insertVehicle {};
            class mresArray {};
            class mresString {};
            class mresToArray {};
            class numberSafe {};
            class queryRequest {};
            class updatePartial {};
            class updateRequest {};
            class cleanup {};
            class huntingZone {};
            class receivekeyofServer {};
        };

        class PlayTime
        {
            file = "\life_hc\MySQL\PlayTime";
            class getPlayTime {};
            class setPlayTime {};
        };

        class Housing
        {
            file = "\life_hc\MySQL\Housing";
            class addContainer {};
            class addHouse {};
            class deleteDBContainer {};
            class fetchPlayerHouses {};
            class sellHouse {};
            class sellHouseContainer {};
            class updateHouseContainers {};
            class updateHouseTrunk {};
            class houseGarage {};
        };

        class Gangs
        {
            file = "\life_hc\MySQL\Gangs";
            class insertGang {};
            class queryPlayerGang {};
            class removeGang {};
            class updateGang {};
        };

        class Vehicles
        {
            file = "\life_hc\MySQL\Vehicles";
            class chopShopSell {};
            class getVehicles {};
            class spawnVehicle {};
            class keyManagement {};
            class vehicleStore {};
            class vehicleCreate {};
            class vehicleDelete {};
            class vehicleUpdate {};
        };

        class Wanted_Sys
        {
            file = "\life_hc\MySQL\WantedSystem";
            class wantedFetch {};
            class wantedPerson {};
            class wantedBounty {};
            class wantedRemove {};
            class wantedAdd {};
            class wantedCrimes {};
            class wantedProfUpdate {};
        };

        class Jail
        {
            file = "\life_hc\MySQL\Jail";
            class jailSys;
        };

        class Items
        {
            file = "\life_hc\MySQL\Items";
            class spikeStrip {};
        };

    };

};
