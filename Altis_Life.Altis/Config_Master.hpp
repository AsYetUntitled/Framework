#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
    /* Persistent Player Settings */
    save_civ_weapons = false; //Allow civilians to save weapons on them?
    save_virtualItems = true; //Save Virtual items (all sides)?
    save_playerStats = true; //Save food, water and damage (all sides)?
    save_civ_position = true; //Save civilian location?
    save_civ_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.

    /* Persistent Vehicle Settings */
    save_veh_virtualItems = false; //Save Virtual items for vehicles (all sides)?
    save_veh_gear = false; //Save Gear for vehicles (all sides)?
    save_veh_fuel = false; //Save Vehicle fuel state
    save_veh_damage = false; //Save Vehicle Damage
    save_veh_items[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat" };

    /* Clothing related settings */
    clothing_noTP = false;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = true; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
    clothing_masks[] = { "H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "U_O_GhillieSuit", "U_I_GhillieSuit", "U_B_GhillieSuit", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F" };

    /* Cop related settings */
    cops_online_min = 5; //minimum cops online for robbing a bank

    /* Medic related settings*/
    allow_medic_weapons = true; // true allows medics to hold/use weapons - false disallows

    /* Revive system settings */
    revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 1500; //Revive fee that players have to pay and medics / EMS are rewarded

    /* House related settings */
    house_limit = 5; //Maximum amount of houses a player can own.

    /* Donor related settings */
    donor_level = false; //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules

    /* Gang related settings */
    gang_price = 75000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
    gang_upgradeMultiplier = 2.5; //Not sure if in use?

    /* Player-related systems */
    enable_fatigue = true; //Set to false to disable the ARMA 3 fatigue system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
    paycheck_period = 5; //Scaled in minutes

    /* Impound Variables */
    impound_car = 350; //Price for impounding cars
    impound_boat = 250; //Price for impounding boats
    impound_air = 850; //Price for impounding helicopters / planes

    /* Initial Bank Amount */
    bank_cop = 7000; //Amount of cash on bank for new cops
    bank_civ = 3000; //Amount of cash on bank for new civillians
    bank_med = 6500; //Amount of cash on bank for new medics

    /* Paycheck Amount */
    paycheck_cop = 500; //Payment for cops
    paycheck_civ = 350; //Payment for civillians
    paycheck_med = 450; //Payment for medics

    /* Federal Reserve settings */
    noatm_timer = 10; //Time in minutes that players won't be able to deposit his money after selling stolen gold

    /* Spyglass settings */
    spyglass_init = true; //Enable or disable spyglass

    /* ATM settings */
    global_ATM = true; //Allow users to access any ATM on the map.

    /* Fuel Station & Heli Service settings */
    Pump_service = false; //Allow users to use pump service on the map. Default = false
    fuel_cost = 80; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
    service_chopper = 1000; //Cost to service chopper at chopper service station.

    /* Skins settings */
    civ_skins = false; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)

    /* Vehicle Settings */
    vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "B_Boat_Armed_01_minigun_F" };
    vehicleShop_BuyMultiplicator = 1.5;
    vehicleGarage_SellMultiplicator = 0.75;
    vehicleGarage_StorFeeMultiplicator = 0.2;
    vehicleChopShop_Multiplicator = 0.5;

    /* Job-related stuff */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

    /* FuelTank Mission */
    FuelTank_WinMultiplier = 1; //Win Multiplier in FuelTank Missions. Increase for more Money! Default = 1

    /* Animal settings */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" };
    animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" };

    /* Wanted System related settings */
    /* crimes[] = {String, Bounty, Code} */
    crimes[] = {
        {"STR_Crime_187V","650","187V"},
        {"STR_Crime_187","2000","187"},
        {"STR_Crime_901","450","901"},
        {"STR_Crime_215","200","215"},
        {"STR_Crime_213","1000","213"},
        {"STR_Crime_211","100","211"},
        {"STR_Crime_207","350","207"},
        {"STR_Crime_207A","200","207A"},
        {"STR_Crime_390","1500","390"},
        {"STR_Crime_487","150","487"},
        {"STR_Crime_488","70","488"},
        {"STR_Crime_480","100","480"},
        {"STR_Crime_481","100","481"},
        {"STR_Crime_482","500","482"},
        {"STR_Crime_483","950","483"},
        {"STR_Crime_459","650","459"},
        {"STR_Crime_666","200","666"},
        {"STR_Crime_667","4500","667"},
        {"STR_Crime_668","1500","668"},
        {"STR_Crime_1","250","1"},
        {"STR_Crime_2","200","2"},
        {"STR_Crime_3","150","3"},
        {"STR_Crime_4","250","4"},
        {"STR_Crime_5","100","5"},
        {"STR_Crime_6","80","6"},
        {"STR_Crime_7","150","7"},
        {"STR_Crime_8","5000","8"},
        {"STR_Crime_9","5000","9"},
        {"STR_Crime_10","15000","10"},
        {"STR_Crime_11","10000","11"},
        {"STR_Crime_12","2500","12"},
        {"STR_Crime_13","1500","13"},
        {"STR_Crime_14","500","14"},
        {"STR_Crime_15","2500","15"},
        {"STR_Crime_16","1500","16"},
        {"STR_Crime_17","100","17"},
        {"STR_Crime_18","1500","18"},
        {"STR_Crime_19","2500","19"},
        {"STR_Crime_20","500","20"},
        {"STR_Crime_21","500","21"},
        {"STR_Crime_22","2000","22"},
        {"STR_Crime_23","5000","23"},
        {"STR_Crime_24","10000","24"},
        {"STR_Crime_25","20000","25"}
    };
};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"
