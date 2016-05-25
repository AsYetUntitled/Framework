#include "..\script_macros.hpp"
/*
    File: fn_initSpy.sqf
    Author:

    Description:
    Does some things that I made over-complicated / un-needed but blah.
    Will eventually include server-side checks but it's blah at this point.

    Will also become a standalone system which is why it's setup like this.
*/
private["_binConfigPatches","_cfgPatches","_endM"];
if (isServer && !hasInterface) exitWith {}; //Server doesn't need to know.
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define RCLIENT -2

CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_Pro_RE,"false");
CONST(E_X_T_A_S_Y_Car_RE,"false");
CONST(DO_NUKE,"false");
CONST(JxMxE_spunkveh,"false");
CONST(JxMxE_spunkveh2,"false");
CONST(JxMxE_spunkair,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

/*
    Compile our list of allowed addon patches, by default this DOES NOT ALLOW ANY ADDONS.

    If you want to white-list addons such as JSRS or Blastcore you need to start a test instance (Host locally and not the mission) and first fill the SPY_cfg_patchList array, once you executed it (Filled it)
    Run the following code and it will copy the list of addons / patches not in the list to your clipboard (Ctrl + V) and then add it to the array.

    _cfgPatches = [];
    _binConfigPatches = configFile >> "CfgPatches";
    for "_i" from 0 to count (_binConfigPatches)-1 do {
        _patchEntry = _binConfigPatches select _i;
        if (isClass _patchEntry) then {
            if (!((configName _patchEntry) in SPY_cfg_patchList)) then {
                _cfgPatches set[count _cfgPatches,(configName _patchEntry)];
            };
        };
    };

    copyToClipboard str(_cfgPatches);

    i.e
    ["cba_xeh","Extended_EventHandlers","CBA_Extended_EventHandlers","JSRS_Environment","WarFXPE","cba_common","cba_events","cba_hashes","cba_network","cba_strings","cba_ui","cba_vectors","JSRS2_120mm_Cannon","JSRS2_127","JSRS2_155mm_AMOS",
    "JSRS2_230mm_Titan","JSRS2_30mm_Cannon","JSRS2_35mm_Autocannon","JSRS2_4Five45","JSRS2_ACPC","JSRS2_Autocannon","JSRS2_Bullethits","JSRS2_DAGR","JSRS2_DAR","JSRS2_EBR","JSRS2_Explosions","JSRS2_Explosives","JSRS2_Filters","JSRS2_FS2000",
    "JSRS2_Gatling","JSRS2_GMG20","JSRS2_GMG40","JSRS2_Khaybar","JSRS2_LMGRCWS","JSRS2_M134","JSRS2_M200","JSRS2_M320R","JSRS2_M6","JSRS2_Minigun","JSRS2_MX","JSRS2_NLAW","JSRS2_P07","JSRS2_PDW","JSRS2_Rahim","JSRS2_Rook40","JSRS2_RPG32",
    "JSRS2_Scorpian","JSRS2_SDAR","JSRS2_Skalpel_ATGM","JSRS2_Skyfire","JSRS2_Sonic_Cracks","JSRS2_Titan","JSRS2_TRG20","JSRS2_Vector","JSRS2_Veh_Titan","JSRS2_Zafir","JSRS2_Zubr45","Blastcore_VEP","cba_ai","cba_arrays","cba_diagnostic","cba_help",
    "cba_ui_helper","cba_versioning","JSRS2_Movement","JSRS2_Silencers","cba_main","cba_main_a3","JSRS2_2S9_Sorcher","JSRS2_AFV4_Gorgon","JSRS2_AH99_Blackfoot","JSRS2_AH9_Pawnee","JSRS2_AMV7_Marshal","JSRS2_BTRK_Kamysh","JSRS2_CH49_Mohawk","JSRS2_Distance",
    "JSRS2_FighterPlane3","JSRS2_FV720_Mora","JSRS2_Hunter","JSRS2_Ifrit","JSRS2_IFV6a_Cheetah","JSRS2_IFV6c_Panther","JSRS2_M2A1_Slammer","JSRS2_M4_Scorcher","JSRS2_M5_Sandstorm","JSRS2_MBT52_Kuma","JSRS2_Mi48_Kajman","JSRS2_MSE3_Marid","JSRS2_Offroad",
    "JSRS2_Po30_Orca","JSRS2_Strider","JSRS2_SUV","JSRS2_T100_Varsuk","JSRS2_Truck1","JSRS2_Truck2","JSRS2_UAV_1","JSRS2_UH80_GhostHawk","JSRS2_Van","JSRS2_WY55_Hellcat","JSRS2_ZSU39_Tigris","cba_xeh_a3"]
*/
_patchList =
["life_server","A3Data","A3_3DEN_Language","A3_Functions_F","A3_Functions_F_EPA","A3_Functions_F_EPC","A3_LanguageMissions_F_Exp_A","A3_Data_F","A3_Data_F_Hook","A3_Data_F_ParticleEffects","A3_Dubbing_F","A3_Dubbing_F_Beta",
"A3_Dubbing_F_Gamma","A3_Dubbing_Radio_F","A3_Dubbing_Radio_F_Data_ENG","A3_Dubbing_Radio_F_Data_ENGB","A3_Dubbing_Radio_F_Data_GRE","A3_Dubbing_Radio_F_Data_PER","A3_Dubbing_Radio_F_Data_VR","A3_Editor_F","A3_EditorPreviews_F",
"A3_Functions_F_Curator","A3_Language_F","A3_Language_F_Beta","A3_Language_F_Gamma","A3_LanguageMissions_F","A3_LanguageMissions_F_Beta","A3_LanguageMissions_F_Gamma","A3_Misc_F","A3_Misc_F_Helpers","A3_Modules_F",
"A3_Modules_F_Data","A3_Modules_F_DynO","A3_Modules_F_Effects","A3_Modules_F_Events","A3_Modules_F_GroupModifiers","A3_Modules_F_Hc","A3_Modules_F_Intel","A3_Modules_F_LiveFeed","A3_Modules_F_Marta","A3_Modules_F_Misc",
"A3_Modules_F_Multiplayer","A3_Modules_F_ObjectModifiers","A3_Modules_F_Sites","A3_Modules_F_Skirmish","A3_Modules_F_StrategicMap","A3_Modules_F_Supports","A3_Modules_F_Uav","A3_Modules_F_Beta","A3_Modules_F_Beta_Data",
"A3_Modules_F_Beta_FiringDrills","A3_Modules_F_EPB","A3_Modules_F_EPB_Misc","A3_Music_F","A3_Music_F_Music","A3_Music_F_EPA","A3_Music_F_EPA_Music","A3_Music_F_EPB","A3_Music_F_EPB_Music","A3_Music_F_EPC","A3_Music_F_EPC_Music",
"A3_Plants_F","A3_Roads_F","A3_Rocks_F","A3_Rocks_F_Blunt","A3_Rocks_F_Sharp","A3_Rocks_F_Water","A3_Structures_F","A3_Structures_F_Bridges","A3_Structures_F_Civ","A3_Structures_F_Civ_Accessories","A3_Structures_F_Civ_Ancient",
"A3_Structures_F_Civ_BellTowers","A3_Structures_F_Civ_Calvaries","A3_Structures_F_Civ_Camping","A3_Structures_F_Civ_Chapels","A3_Structures_F_Civ_Constructions","A3_Structures_F_Civ_Dead","A3_Structures_F_Civ_Garbage",
"A3_Structures_F_Civ_Graffiti","A3_Structures_F_Civ_InfoBoards","A3_Structures_F_Civ_Kiosks","A3_Structures_F_Civ_Lamps","A3_Structures_F_Civ_Market","A3_Structures_F_Civ_Offices","A3_Structures_F_Civ_Pavements",
"A3_Structures_F_Civ_PlayGround","A3_Structures_F_Civ_SportsGrounds","A3_Structures_F_Civ_Statues","A3_Structures_F_Civ_Tourism","A3_Structures_F_Data","A3_Structures_F_Dominants","A3_Structures_F_Dominants_Amphitheater",
"A3_Structures_F_Dominants_Castle","A3_Structures_F_Dominants_Church","A3_Structures_F_Dominants_Hospital","A3_Structures_F_Dominants_Lighthouse","A3_Structures_F_Dominants_WIP","A3_Structures_F_Furniture",
"A3_Structures_F_Households","A3_Structures_F_Households_Addons","A3_Structures_F_Households_House_Big01","A3_Structures_F_Households_House_Big02","A3_Structures_F_Households_House_Shop01",
"A3_Structures_F_Households_House_Shop02","A3_Structures_F_Households_House_Small01","A3_Structures_F_Households_House_Small02","A3_Structures_F_Households_House_Small03","A3_Structures_F_Households_Slum",
"A3_Structures_F_Households_Stone_Big","A3_Structures_F_Households_Stone_Shed","A3_Structures_F_Households_Stone_Small","A3_Structures_F_Households_WIP","A3_Structures_F_Ind","A3_Structures_F_Ind_AirPort",
"A3_Structures_F_Ind_Cargo","A3_Structures_F_Ind_CarService","A3_Structures_F_Ind_ConcreteMixingPlant","A3_Structures_F_Ind_Crane","A3_Structures_F_Ind_DieselPowerPlant","A3_Structures_F_Ind_Factory",
"A3_Structures_F_Ind_FuelStation","A3_Structures_F_Ind_FuelStation_Small","A3_Structures_F_Ind_Pipes","A3_Structures_F_Ind_PowerLines","A3_Structures_F_Ind_ReservoirTank","A3_Structures_F_Ind_Shed",
"A3_Structures_F_Ind_SolarPowerPlant","A3_Structures_F_Ind_Tank","A3_Structures_F_Ind_Transmitter_Tower","A3_Structures_F_Ind_WavePowerPlant","A3_Structures_F_Ind_Windmill","A3_Structures_F_Ind_WindPowerPlant",
"A3_Structures_F_Items","A3_Structures_F_Items_Documents","A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Food","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Medical",
"A3_Structures_F_Items_Military","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools","A3_Structures_F_Items_Valuables","A3_Structures_F_Items_Vessels","A3_Structures_F_Mil","A3_Structures_F_Mil_BagBunker",
"A3_Structures_F_Mil_BagFence","A3_Structures_F_Mil_Barracks","A3_Structures_F_Mil_Bunker","A3_Structures_F_Mil_Cargo","A3_Structures_F_Mil_Flags","A3_Structures_F_Mil_Fortification","A3_Structures_F_Mil_Helipads",
"A3_Structures_F_Mil_Offices","A3_Structures_F_Mil_Radar","A3_Structures_F_Mil_Shelters","A3_Structures_F_Mil_TentHangar","A3_Structures_F_Naval","A3_Structures_F_Naval_Buoys","A3_Structures_F_Naval_Fishing",
"A3_Structures_F_Naval_Piers","A3_Structures_F_Naval_RowBoats","A3_Structures_F_Research","A3_Structures_F_System","A3_Structures_F_Training","A3_Structures_F_Training_InvisibleTarget","A3_Structures_F_Walls",
"A3_Structures_F_EPA","A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPA_Civ_Constructions","A3_Structures_F_EPA_Items_Electronics","A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical",
"A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPA_Walls","A3_Structures_F_EPB","A3_Structures_F_EPB_Civ_Accessories","A3_Structures_F_EPB_Civ_Camping","A3_Structures_F_EPB_Civ_Dead",
"A3_Structures_F_EPB_Civ_Garbage","A3_Structures_F_EPB_Civ_Graffiti","A3_Structures_F_EPB_Civ_PlayGround","A3_Structures_F_EPB_Furniture","A3_Structures_F_EPB_Items_Documents","A3_Structures_F_EPB_Items_Luggage",
"A3_Structures_F_EPB_Items_Military","A3_Structures_F_EPB_Items_Vessels","A3_Structures_F_EPB_Naval_Fishing","A3_Structures_F_EPC","A3_Structures_F_EPC_Civ_Accessories","A3_Structures_F_EPC_Civ_Camping",
"A3_Structures_F_EPC_Civ_Garbage","A3_Structures_F_EPC_Civ_InfoBoards","A3_Structures_F_EPC_Civ_Kiosks","A3_Structures_F_EPC_Civ_Playground","A3_Structures_F_EPC_Civ_Tourism","A3_Structures_F_EPC_Dominants_GhostHotel",
"A3_Structures_F_EPC_Dominants_Stadium","A3_Structures_F_EPC_Furniture","A3_Structures_F_EPC_Items_Documents","A3_Structures_F_EPC_Items_Electronics","A3_Structures_F_EPC_Walls","A3_UiFonts_F","A3_Animals_F",
"A3_Animals_F_Animconfig","A3_Animals_F_Fishes","A3_Animals_F_Kestrel","A3_Animals_F_Rabbit","A3_Animals_F_Seagull","A3_Animals_F_Snakes","A3_Animals_F_Turtle","A3_Animals_F_Beta","A3_Animals_F_Beta_Chicken",
"A3_Animals_F_Beta_Dog","A3_Animals_F_Beta_Goat","A3_Animals_F_Beta_Sheep","A3_Anims_F","A3_Anims_F_Config_Sdr","A3_Anims_F_Config_Sdr_WeaponSwitching","A3_Anims_F_Data","A3_Anims_F_EPA","A3_Anims_F_EPC","A3_Dubbing_F_EPA",
"A3_Dubbing_F_EPB","A3_Dubbing_F_EPC","A3_Language_F_EPA","A3_Language_F_EPB","A3_Language_F_EPC","A3_LanguageMissions_F_EPA","A3_LanguageMissions_F_EPB","A3_LanguageMissions_F_EPC","A3_Map_Data","A3_Map_Stratis",
"A3_Map_Stratis_Data","A3_Map_Stratis_Data_Layers","A3_Map_Stratis_Scenes_F","A3_Plants_F_Bush","A3_Signs_F","A3_Signs_F_Signs_Ad","A3_Structures_F_Signs_Companies","A3_Ui_F","A3_Ui_F_Data","A3_Ui_F_Curator","A3_Weapons_F",
"A3_Weapons_F_Ammoboxes","A3_Weapons_F_DummyWeapons","A3_Weapons_F_Explosives","A3_Weapons_F_Items","A3_Weapons_F_Launchers_NLAW","A3_Weapons_F_Launchers_RPG32","A3_Weapons_F_Launchers_Titan",
"A3_Weapons_F_LongRangeRifles_DMR_01","A3_Weapons_F_LongRangeRifles_EBR","A3_Weapons_F_LongRangeRifles_GM6","A3_Weapons_F_LongRangeRifles_M320","A3_Weapons_F_Machineguns_M200","A3_Weapons_F_Machineguns_Zafir",
"A3_Weapons_F_Pistols_ACPC2","A3_Weapons_F_Pistols_P07","A3_Weapons_F_Pistols_Pistol_Heavy_01","A3_Weapons_F_Pistols_Pistol_Heavy_02","A3_Weapons_F_Pistols_Rook40","A3_Weapons_F_Rifles_Khaybar","A3_Weapons_F_Rifles_MK20",
"A3_Weapons_F_Rifles_MX","A3_Weapons_F_Rifles_MX_Black","A3_Weapons_F_Rifles_SDAR","A3_Weapons_F_Rifles_TRG20","A3_Weapons_F_SMGs_Pdw2000","A3_Weapons_F_SMGs_SMG_01","A3_Weapons_F_SMGs_SMG_02","A3_Weapons_F_Beta",
"A3_Weapons_F_Beta_Ammoboxes","A3_Weapons_F_Beta_LongRangeRifles_EBR","A3_Weapons_F_Beta_LongRangeRifles_GM6","A3_Weapons_F_Beta_LongRangeRifles_M320","A3_Weapons_F_Beta_Rifles_Khaybar","A3_Weapons_F_Beta_Rifles_MX",
"A3_Weapons_F_Beta_Rifles_TRG20","A3_Weapons_F_Gamma","A3_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_Gamma_LongRangeRifles_EBR","A3_Weapons_F_Gamma_Rifles_MX","A3_Characters_F","A3_Characters_F_BLUFOR","A3_Characters_F_Civil",
"A3_Characters_F_Heads","A3_Characters_F_OPFOR","A3_Characters_F_Proxies","A3_Characters_F_Beta","A3_Characters_F_Beta_INDEP","A3_Characters_F_Gamma","A3_Data_F_Curator","A3_Data_F_Curator_Eagle","A3_Data_F_Curator_Intel",
"A3_Data_F_Curator_Misc","A3_Data_F_Curator_Respawn","A3_Data_F_Kart","A3_Data_F_Kart_ParticleEffects","A3_Language_F_Curator","A3_Language_F_Kart","A3_LanguageMissions_F_Kart","A3_Map_Altis","A3_Map_Altis_Data",
"A3_Map_Altis_Data_Layers","A3_Map_Altis_Scenes_F","A3_Missions_F","A3_Missions_F_Data","A3_Missions_F_Video","A3_Missions_F_Beta","A3_Missions_F_Beta_Data","A3_Missions_F_Beta_Video","A3_Missions_F_Gamma",
"A3_Missions_F_Gamma_Data","A3_Missions_F_Gamma_Video","A3_Modules_F_Curator","A3_Modules_F_Curator_Animals","A3_Modules_F_Curator_CAS","A3_Modules_F_Curator_Curator","A3_Modules_F_Curator_Effects",
"A3_Modules_F_Curator_Environment","A3_Modules_F_Curator_Flares","A3_Modules_F_Curator_Intel","A3_Modules_F_Curator_Lightning","A3_Modules_F_Curator_Mines","A3_Modules_F_Curator_Misc","A3_Modules_F_Curator_Multiplayer",
"A3_Modules_F_Curator_Objectives","A3_Modules_F_Curator_Ordnance","A3_Modules_F_Curator_Respawn","A3_Modules_F_Curator_SmokeShells","A3_Modules_F_Kart","A3_Modules_F_Kart_Data","A3_Modules_F_Kart_TimeTrials","A3_Sounds_F",
"A3_Sounds_F_Arsenal","A3_Sounds_F_Characters","A3_Sounds_F_Environment","A3_Sounds_F_Sfx","A3_Sounds_F_Vehicles","A3_Sounds_F_EPB","A3_Sounds_F_EPC","A3_Sounds_F_Kart","A3_Static_F","A3_Static_F_Mortar_01","A3_Static_F_Beta",
"A3_Static_F_Beta_Mortar_01","A3_Static_F_Gamma","A3_Static_F_Gamma_Mortar_01","A3_Structures_F_Kart","A3_Structures_F_Kart_Civ_SportsGrounds","A3_Structures_F_Kart_Mil_Flags","A3_Structures_F_Kart_Signs_Companies",
"A3_Ui_F_Kart","A3_Weapons_F_Acc","A3_Weapons_F_Beta_Acc","A3_Weapons_F_EPA","A3_Weapons_F_EPA_Acc","A3_Weapons_F_EPA_Ammoboxes","A3_Weapons_F_EPB","A3_Weapons_F_EPB_Acc","A3_Weapons_F_EPB_Ammoboxes",
"A3_Weapons_F_EPB_LongRangeRifles_GM6","A3_Weapons_F_EPC","A3_Weapons_F_Gamma_Acc","A3_Weapons_F_Kart","A3_Weapons_F_Kart_Pistols_Pistol_Signal_F","A3_Air_F","A3_Air_F_Heli_Light_01","A3_Air_F_Heli_Light_02","A3_Air_F_Beta",
"A3_Air_F_Beta_Heli_Attack_01","A3_Air_F_Beta_Heli_Attack_02","A3_Air_F_Beta_Heli_Transport_01","A3_Air_F_Beta_Heli_Transport_02","A3_Air_F_Beta_Parachute_01","A3_Air_F_Beta_Parachute_02","A3_Air_F_Gamma",
"A3_Air_F_Gamma_Plane_Fighter_03","A3_Anims_F_Kart","A3_Armor_F","A3_Armor_F_Beta","A3_Armor_F_Beta_APC_Tracked_01","A3_Armor_F_Beta_APC_Tracked_02","A3_Armor_F_Gamma","A3_Armor_F_Gamma_MBT_01","A3_Armor_F_Gamma_MBT_02",
"A3_Boat_F","A3_Boat_F_Boat_Armed_01","A3_Boat_F_Boat_Transport_01","A3_Boat_F_Beta","A3_Boat_F_Beta_Boat_Armed_01","A3_Boat_F_Beta_Boat_Transport_01","A3_Boat_F_Beta_SDV_01","A3_Boat_F_Gamma","A3_Boat_F_Gamma_Boat_Civil_01",
"A3_Boat_F_Gamma_Boat_Civil_04","A3_Boat_F_Gamma_Boat_Transport_01","A3_Characters_F_Common","A3_Characters_F_EPA","A3_Characters_F_EPB","A3_Characters_F_EPB_Heads","A3_Characters_F_EPC","A3_Characters_F_Kart",
"A3_Data_F_Bootcamp","A3_Data_F_Curator_Characters","A3_Data_F_Curator_Virtual","A3_Data_F_Heli","A3_Data_F_Mark","A3_Dubbing_F_Bootcamp","A3_Dubbing_F_Heli","A3_Dubbing_F_Mark","A3_Dubbing_F_MP_Mark","A3_Functions_F_Bootcamp",
"A3_Functions_F_Heli","A3_Functions_F_Mark","A3_Functions_F_MP_Mark","A3_Language_F_Bootcamp","A3_Language_F_Heli","A3_Language_F_Mark","A3_Language_F_MP_Mark","A3_LanguageMissions_F_Bootcamp","A3_LanguageMissions_F_Heli",
"A3_LanguageMissions_F_Mark","A3_LanguageMissions_F_MP_Mark","A3_Map_VR","A3_Map_VR_Scenes_F","A3_Missions_F_EPA","A3_Missions_F_EPA_Data","A3_Missions_F_EPA_Video","A3_Missions_F_EPB","A3_Missions_F_EPC","A3_Modules_F_Bootcamp"
,"A3_Modules_F_Bootcamp_Misc","A3_Modules_F_Curator_Chemlights","A3_Modules_F_Heli","A3_Modules_F_Heli_Misc","A3_Modules_F_Mark","A3_Modules_F_Mark_FiringDrills","A3_Modules_F_MP_Mark","A3_Modules_F_MP_Mark_Objectives",
"A3_Music_F_Bootcamp","A3_Music_F_Bootcamp_Music","A3_Music_F_Heli","A3_Music_F_Heli_Music","A3_Music_F_Mark","A3_Music_F_Mark_Music","A3_Soft_F","A3_Soft_F_MRAP_01","A3_Soft_F_MRAP_02","A3_Soft_F_Offroad_01",
"A3_Soft_F_Quadbike_01","A3_Soft_F_Beta","A3_Soft_F_Beta_MRAP_03","A3_Soft_F_Beta_Quadbike_01","A3_Soft_F_Beta_Truck_01","A3_Soft_F_Beta_Truck_02","A3_Soft_F_Gamma","A3_Soft_F_Gamma_Hatchback_01","A3_Soft_F_Gamma_Offroad_01",
"A3_Soft_F_Gamma_Quadbike_01","A3_Soft_F_Gamma_SUV_01","A3_Soft_F_Gamma_Truck_01","A3_Soft_F_Gamma_Truck_02","A3_Soft_F_Gamma_Van_01","A3_Sounds_F_Bootcamp","A3_Sounds_F_Heli","A3_Sounds_F_Mark","A3_Static_F_AA_01",
"A3_Static_F_AT_01","A3_Static_F_Mark","A3_Static_F_Mark_Designator_01","A3_Static_F_Mark_Designator_02","A3_Structures_F_Mil_Scrapyard","A3_Structures_F_Wrecks","A3_Structures_F_Bootcamp","A3_Structures_F_Bootcamp_Civ_Camping",
"A3_Structures_F_Bootcamp_Civ_SportsGrounds","A3_Structures_F_Bootcamp_Ind_Cargo","A3_Structures_F_Bootcamp_Items_Electronics","A3_Structures_F_Bootcamp_Items_Food","A3_Structures_F_Bootcamp_Items_Sport",
"A3_Structures_F_Bootcamp_System","A3_Structures_F_Bootcamp_Training","A3_Structures_F_Bootcamp_VR_Blocks","A3_Structures_F_Bootcamp_VR_CoverObjects","A3_Structures_F_Bootcamp_VR_Helpers","A3_Structures_F_EPA_Mil_Scrapyard",
"A3_Structures_F_Heli","A3_Structures_F_Heli_Civ_Accessories","A3_Structures_F_Heli_Civ_Constructions","A3_Structures_F_Heli_Civ_Garbage","A3_Structures_F_Heli_Civ_Market","A3_Structures_F_Heli_Furniture",
"A3_Structures_F_Heli_Ind_Airport","A3_Structures_F_Heli_Ind_Cargo","A3_Structures_F_Heli_Ind_Machines","A3_Structures_F_Heli_Items_Airport","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F_Heli_Items_Food",
"A3_Structures_F_Heli_Items_Luggage","A3_Structures_F_Heli_Items_Sport","A3_Structures_F_Heli_Items_Tools","A3_Structures_F_Heli_VR_Helpers","A3_Structures_F_Mark","A3_Structures_F_Mark_Items_Military",
"A3_Structures_F_Mark_Items_Sport","A3_Structures_F_Mark_Mil_Flags","A3_Structures_F_Mark_Training","A3_Structures_F_Mark_VR_Helpers","A3_Structures_F_Mark_VR_Shapes","A3_Structures_F_Mark_VR_Targets","A3_Supplies_F_Heli",
"A3_Supplies_F_Heli_Bladders","A3_Supplies_F_Heli_CargoNets","A3_Supplies_F_Heli_Fuel","A3_Supplies_F_Heli_Slingload","A3_Supplies_F_Mark","A3_Ui_F_Bootcamp","A3_Ui_F_Heli","A3_Ui_F_Mark","A3_Ui_F_MP_Mark",
"A3_Weapons_F_Bootcamp","A3_Weapons_F_Bootcamp_Ammoboxes","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6_Camo","A3_Weapons_F_Bootcamp_LongRangeRifles_M320_Camo","A3_Weapons_F_Mark","A3_Weapons_F_Mark_Acc",
"A3_Weapons_F_Mark_LongRangeRifles_DMR_01","A3_Weapons_F_Mark_LongRangeRifles_DMR_02","A3_Weapons_F_Mark_LongRangeRifles_DMR_03","A3_Weapons_F_Mark_LongRangeRifles_DMR_04","A3_Weapons_F_Mark_LongRangeRifles_DMR_05",
"A3_Weapons_F_Mark_LongRangeRifles_DMR_06","A3_Weapons_F_Mark_LongRangeRifles_EBR","A3_Weapons_F_Mark_LongRangeRifles_GM6","A3_Weapons_F_Mark_LongRangeRifles_GM6_Camo","A3_Weapons_F_Mark_LongRangeRifles_M320",
"A3_Weapons_F_Mark_LongRangeRifles_M320_Camo","A3_Weapons_F_Mark_Machineguns_M200","A3_Weapons_F_Mark_Machineguns_MMG_01","A3_Weapons_F_Mark_Machineguns_MMG_02","A3_Weapons_F_Mark_Machineguns_Zafir",
"A3_Weapons_F_Mark_Rifles_Khaybar","A3_Weapons_F_Mark_Rifles_MK20","A3_Weapons_F_Mark_Rifles_MX","A3_Weapons_F_Mark_Rifles_SDAR","A3_Weapons_F_Mark_Rifles_TRG20","A3_Air_F_EPB","A3_Air_F_EPB_Heli_Light_03","A3_Air_F_EPC",
"A3_Air_F_EPC_Plane_CAS_01","A3_Air_F_EPC_Plane_CAS_02","A3_Air_F_EPC_Plane_Fighter_03","A3_Air_F_Heli","A3_Air_F_Heli_Heli_Attack_01","A3_Air_F_Heli_Heli_Attack_02","A3_Air_F_Heli_Heli_Light_01","A3_Air_F_Heli_Heli_Light_02",
"A3_Air_F_Heli_Heli_Light_03","A3_Air_F_Heli_Heli_Transport_01","A3_Air_F_Heli_Heli_Transport_02","A3_Air_F_Heli_Heli_Transport_03","A3_Air_F_Heli_Heli_Transport_04","A3_Anims_F_Bootcamp","A3_Anims_F_Heli","A3_Anims_F_Mark",
"A3_Anims_F_Mark_Deployment","A3_Armor_F_Beta_APC_Wheeled_01","A3_Armor_F_Beta_APC_Wheeled_02","A3_Armor_F_EPB","A3_Armor_F_EPB_APC_Tracked_03","A3_Armor_F_EPB_MBT_03","A3_Armor_F_EPC","A3_Armor_F_EPC_MBT_01",
"A3_Armor_F_Gamma_APC_Wheeled_03","A3_Boat_F_EPC","A3_Boat_F_EPC_Submarine_01","A3_Boat_F_Heli","A3_Boat_F_Heli_Boat_Armed_01","A3_Boat_F_Heli_SDV_01","A3_Cargoposes_F","A3_Cargoposes_F_Heli","A3_Characters_F_Bootcamp",
"A3_Characters_F_Bootcamp_Common","A3_Characters_F_Mark","A3_Data_F_Exp_A","A3_Data_F_Exp_B","A3_Drones_F","A3_Drones_F_Air_F_Gamma_UAV_01","A3_Drones_F_Air_F_Gamma_UAV_02","A3_Drones_F_Characters_F_Gamma",
"A3_Drones_F_Soft_F_Gamma_UGV_01","A3_Drones_F_Weapons_F_Gamma_Ammoboxes","A3_Drones_F_Weapons_F_Gamma_Items","A3_Functions_F_Exp_A","A3_Language_F_Exp_A","A3_Language_F_Exp_B","A3_Missions_F_Curator","A3_Missions_F_Kart",
"A3_Missions_F_Kart_Data","A3_Modules_F_Exp_A","A3_Props_F_Exp_A","A3_Props_F_Exp_A_Military","A3_Props_F_Exp_A_Military_Equipment","A3_Soft_F_EPC","A3_Soft_F_EPC_Truck_03","A3_Soft_F_Kart","A3_Soft_F_Kart_Kart_01",
"A3_Sounds_F_Exp_A","A3_Structures_F_Exp_A","A3_Structures_F_Exp_A_VR_Blocks","A3_Structures_F_Exp_A_VR_Helpers","A3_Ui_F_Exp_A","A3_3DEN","A3_Anims_F_Exp_A","A3_Data_F_Exp_A_Virtual","A3_Missions_F_Bootcamp",
"A3_Missions_F_Bootcamp_Data","A3_Missions_F_Bootcamp_Video","A3_Missions_F_Heli","A3_Missions_F_Heli_Data","A3_Missions_F_Heli_Video","A3_Missions_F_Mark","A3_Missions_F_Mark_Data","A3_Missions_F_Mark_Video",
"A3_Missions_F_MP_Mark","A3_Missions_F_MP_Mark_Data","A3_Soft_F_Bootcamp","A3_Soft_F_Bootcamp_Offroad_01","A3_Soft_F_Bootcamp_Quadbike_01","A3_Soft_F_Bootcamp_Van_01","A3_Soft_F_Heli","A3_Soft_F_Heli_Hatchback_01",
"A3_Soft_F_Heli_MRAP_01","A3_Soft_F_Heli_MRAP_02","A3_Soft_F_Heli_MRAP_03","A3_Soft_F_Heli_Quadbike_01","A3_Soft_F_Heli_SUV_01","A3_Soft_F_Heli_UGV_01","A3_Soft_F_Heli_Van_01","A3_BaseConfig_F","3DEN","A3_Animals_F_Chicken",
"A3_Animals_F_Dog","A3_Animals_F_Goat","A3_Animals_F_Sheep","A3_Armor_F_Panther","A3_Armor_F_AMV","A3_Armor_F_Marid","A3_Armor_F_APC_Wheeled_03","A3_Armor_F_Slammer","A3_Armor_F_T100K","A3_Boat_F_SDV_01",
"A3_Boat_F_EPC_Submarine_01_F","A3_Boat_F_Civilian_Boat","A3_Boat_F_Trawler","A3_Characters_F_INDEP","A3_Air_F_Gamma_UAV_01","A3_Air_F_Gamma_UAV_02","A3_UAV_F_Characters_F_Gamma","A3_Soft_F_Crusher_UGV",
"A3_UAV_F_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_gamma_Items","A3_Map_Altis_Scenes","A3_Map_Stratis_Scenes","Map_VR","A3_Map_VR_Scenes","A3_Modules_F_Heli_SpawnAi","A3_Modules_F_Mark_Objectives","A3_Signs_F_AD",
"A3_Soft_F_Quadbike","A3_Soft_F_MRAP_03","A3_Soft_F_Beta_Quadbike","A3_Soft_F_HEMTT","A3_Soft_F_TruckHeavy","A3_Soft_F_Bootcamp_Quadbike","A3_Soft_F_Bootcamp_Truck","A3_Soft_F_Car","A3_Soft_F_Gamma_Offroad",
"A3_Soft_F_Gamma_Quadbike","A3_Soft_F_SUV","A3_Soft_F_Gamma_HEMTT","A3_Soft_F_Gamma_TruckHeavy","A3_Soft_F_Truck","A3_Soft_F_Heli_Car","A3_Soft_F_Heli_Quadbike","A3_Soft_F_Heli_SUV","A3_Soft_F_Heli_Crusher_UGV",
"A3_Soft_F_Heli_Truck","A3_Static_F_Gamma_AA","A3_Static_F_Gamma_AT","A3_Structures_F_Items_Cans","A3_Weapons_F_NATO","A3_Weapons_F_CSAT","A3_Weapons_F_AAF","A3_weapons_F_FIA","A3_Weapons_F_ItemHolders","A3_Weapons_F_Headgear",
"A3_Weapons_F_Uniforms","A3_Weapons_F_Vests","A3_Weapons_F_Launchers_LAW","A3_Weapons_F_EPA_LongRangeRifles_DMR_01","A3_Weapons_F_EBR","A3_Weapons_F_EPB_Rifles_MX_Black","A3_Weapons_F_Pistols_PDW2000",
"A3_Weapons_F_Rifles_Vector","a3_weapons_f_rifles_SMG_02","A3_Weapons_F_beta_EBR","A3_Weapons_F_EPA_LongRangeRifles_GM6","A3_Weapons_F_EPB_LongRangeRifles_M320","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6",
"A3_Weapons_F_Bootcamp_LongRangeRifles_M320","A3_Weapons_F_EPB_LongRangeRifles_GM3","A3_Weapons_F_EPA_EBR","A3_Weapons_F_EPA_Rifles_MX","A3_Weapons_F_Mark_EBR","CuratorOnly_Air_F_Beta_Heli_Attack_01",
"CuratorOnly_Air_F_Beta_Heli_Attack_02","CuratorOnly_Air_F_Gamma_UAV_01","CuratorOnly_Armor_F_AMV","CuratorOnly_armor_f_beta_APC_Tracked_02","CuratorOnly_Armor_F_Marid","CuratorOnly_Armor_F_Panther","CuratorOnly_Armor_F_Slammer"
,"CuratorOnly_Armor_F_T100K","CuratorOnly_Boat_F_Boat_Armed_01","CuratorOnly_Characters_F_BLUFOR","CuratorOnly_Characters_F_Common","CuratorOnly_Characters_F_OPFOR","CuratorOnly_Modules_F_Curator_Animals",
"CuratorOnly_Modules_F_Curator_Chemlights","CuratorOnly_Modules_F_Curator_Effects","CuratorOnly_Modules_F_Curator_Environment","CuratorOnly_Modules_F_Curator_Flares","CuratorOnly_Modules_F_Curator_Lightning",
"CuratorOnly_Modules_F_Curator_Mines","CuratorOnly_Modules_F_Curator_Objectives","CuratorOnly_Modules_F_Curator_Ordnance","CuratorOnly_Modules_F_Curator_Smokeshells","CuratorOnly_Signs_F","CuratorOnly_Soft_F_Crusher_UGV",
"CuratorOnly_Soft_F_MRAP_01","CuratorOnly_Soft_F_MRAP_02","CuratorOnly_Soft_F_Quadbike","CuratorOnly_Static_F_Gamma","CuratorOnly_Static_F_Mortar_01","CuratorOnly_Structures_F_Civ_Ancient","CuratorOnly_Structures_F_Civ_Camping",
"CuratorOnly_Structures_F_Civ_Garbage","CuratorOnly_Structures_F_EPA_Civ_Constructions","CuratorOnly_Structures_F_EPB_Civ_Dead","CuratorOnly_Structures_F_Ind_Cargo","CuratorOnly_Structures_F_Ind_Crane",
"CuratorOnly_Structures_F_Ind_ReservoirTank","CuratorOnly_Structures_F_Ind_Transmitter_Tower","CuratorOnly_Structures_F_Items_Vessels","CuratorOnly_Structures_F_Mil_BagBunker","CuratorOnly_Structures_F_Mil_BagFence",
"CuratorOnly_Structures_F_Mil_Cargo","CuratorOnly_Structures_F_Mil_Fortification","CuratorOnly_Structures_F_Mil_Radar","CuratorOnly_Structures_F_Mil_Shelters","CuratorOnly_Structures_F_Research","CuratorOnly_Structures_F_Walls",
"CuratorOnly_Structures_F_Wrecks","A3_Missions_F_Exp_A","A3_Missions_F_Exp_A_Data"];

uiNamespace setVariable["RscDisplayRemoteMissions",displayNull]; //For Spy-Glass..
uiNamespace setVariable["RscDisplayMultiplayer",displayNull];

_binConfigPatches = configFile >> "CfgPatches";
for "_i" from 0 to count (_binConfigPatches)-1 do {
    _patchEntry = _binConfigPatches select _i;
    if (isClass _patchEntry) then {
        if (!((configName _patchEntry) in _patchList)) exitWith {
            [profileName,getPlayerUID player,(configName _patchEntry)] remoteExec ["SPY_fnc_cookieJar",RSERV];
            [profileName,format["Unknown Addon Patch: %1",(configName _patchEntry)]] remoteExec ["SPY_fnc_notifyAdmins",RCLIENT];
            sleep 0.5;
            failMission "SpyGlass";
        };
    };
};

//Check for copy-pasters of Dev-Con styled execution.
//Because I am nice, add these to the following below to allow CBA; "CBA_CREDITS_CONT_C","CBA_CREDITS_M_P
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = [
"Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole",
"Version","TraffLight","Feedback","MessageBox"
];

{
    if (!((configName _x) in _allowedChildren)) exitWith {
        [profileName,getPlayerUID player,"Modified_MPInterrupt"] remoteExec ["SPY_fnc_cookieJar",RSERV];
        [profileName,"Devcon like executor detected"] remoteExec ["SPY_fnc_notifyAdmins",RCLIENT];
        sleep 0.5;
        failMission "SpyGlass";
    };
} forEach _children;

/*
    Display Validator
    Loops through and makes sure none of the displays were modified..

    TODO: Run check every x minutes and validate all displays.
*/
{
    _onLoad = getText(configFile >> (_x select 0) >> "onLoad");
    _onUnload = getText(configFile >> (_x select 0) >> "onUnload");
    if (_onLoad != (_x select 1) || _onUnload != (_x select 2)) exitWith {
        [profileName,getPlayerUID player,format["Modified_Method_%1",_x select 0]] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
        [profileName,format["Modified Display Method %1 (Memory Edit)",_x select 0]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
        sleep 0.5;
        vehicle player setVelocity[1e10,1e14,1e18]; //It's a surprise.
        sleep 3;
        preProcessFile "SpyGlass\endoftheline.sqf";
        sleep 2.5;
        failMission "SpyGlass";
    };
}
forEach [
    ["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInterrupt"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayStart","[2] call compile preprocessFileLineNumbers getText (configfile >> 'CfgFunctions' >> 'init'); ['onLoad',_this,'RscDisplayLoading','Loading'] call (uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'3DENDisplaysTemp'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"],
    ["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uiNamespace getVariable 'BIS_fnc_initDisplay')"]
];

/* Forgot to include this but this is also also a popular method for "unreleased" stuff */
if (getText(configFile >> "CfgFunctions" >> "init") != "A3\functions_f\initFunctions.sqf") then {
    [profileName,getPlayerUID player,"Modified_Functions_Init"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
    [profileName,"Modified_Functions_Init"] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
    sleep 0.5;
    vehicle player setVelocity[1e10,1e14,1e18]; //It's a surprise.
    sleep 3;
    preProcessFile "SpyGlass\endoftheline.sqf";
    sleep 2.5;
    failMission "SpyGlass";
};

[] execVM "SpyGlass\fn_cmdMenuCheck.sqf";
[] execVM "SpyGlass\fn_variableCheck.sqf";
[] execVM "SpyGlass\fn_menuCheck.sqf";
