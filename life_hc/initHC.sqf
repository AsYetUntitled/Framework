#include "hc_macros.hpp"
#define __EXIT(condition) if(condition) exitWith {}
/*
	File: fn_initHC.sqf
    Author: Nanou
	
	Description:
	Initialize the headless client.
	(extDB2 V.70)
*/

if(!(EXTDB_SETTINGS_BOOL("Enabled"))) exitWith {};

[] execVM "\life_hc\KRON_Strings.sqf";

life_server_extDB_notLoaded = "";
life_save_civ_position = if(EQUAL(LIFE_SETTINGS(getNumber,"save_civ_position"),0)) then {false} else {true};

diag_log "-------------------------------------------------------------------------------------------------------------------";
diag_log "-------------------------------- Starting initialization of 'extDB2-HC' by NANOU ----------------------------------";
diag_log "-------------------------------------------------------------------------------------------------------------------";

if(isNil {GVAR_UINS "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	CONSTVAR(life_sql_id);
	SVAR_UINS ["life_sql_id",life_sql_id];

	try {
		_result = EXTDB format["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Connection"};
		_result = EXTDB format["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Connection"};
	} catch {
		diag_log _exception;
		life_server_extDB_notLoaded = [true, _exception];
		PVAR_ALL("life_server_extDB_notLoaded");
	};

	__EXIT(!(EQUAL(life_server_extDB_notLoaded,"")));
	EXTDB "9:LOCK";
	diag_log "extDB2: Connected to Database";
} else {
	life_sql_id = GVAR_UINS "life_sql_id";
	CONSTVAR(life_sql_id);
	diag_log "extDB2: Still Connected to Database";
};

if(!(EQUAL(life_server_extDB_notLoaded,""))) exitWith {}; //extDB2-HC did not fully initialize so terminate the rest of the initialization process.

[] spawn {
    while {true} do {
        PVAR_SERV("serv_sv_use");
        uiSleep 60;
    };
};

["CALL resetLifeVehicles",1] call HC_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call HC_fnc_asyncCall;
["CALL deleteOldHouses",1] call HC_fnc_asyncCall;
["CALL deleteOldGangs",1] call HC_fnc_asyncCall;
	
[] execFSM "\life_hc\FSM\cleanup.fsm";

[] spawn HC_fnc_cleanup;
[] spawn HC_fnc_initHouses;

/* Initialize hunting zone(s) */
["hunting_zone",30] spawn HC_fnc_huntingZone;
	
// A list of allowed funcs to be passed on the hc (by external sources)
// Have to be written in only lower capitals
HC_MPAllowedFuncs = [

    "hc_fnc_insertrequest",
    "hc_fnc_insertvehicle",
    "hc_fnc_queryrequest",
    "hc_fnc_updatepartial",
    "hc_fnc_updaterequest",
	
	"hc_fnc_cleanup",
	"hc_fnc_huntingzone",
	
	"hc_fnc_setplaytime",
	"hc_fnc_getplaytime",
	
    "hc_fnc_insertgang",
    "hc_fnc_queryplayergang",
    "hc_fnc_removegang",
    "hc_fnc_updategang",

	"hc_fnc_inithouses",
    "hc_fnc_addcontainer",
    "hc_fnc_addhouse",
	"hc_fnc_deletedbcontainer",
	"hc_fnc_fetchplayerhouses",
	"hc_fnc_housecleanup",
	"hc_fnc_sellhouse",
	"hc_fnc_sellhousecontainer",
	"hc_fnc_updatehousecontainers",
	"hc_fnc_updatehousetrunk",
	
	"hc_fnc_keymanagement",
	"hc_fnc_vehiclecreate",
	"hc_fnc_spawnvehicle",
	"hc_fnc_vehiclestore",
	"hc_fnc_chopshopsell",
	"hc_fnc_getvehicles",
	"hc_fnc_vehicledelete",
	"hc_fnc_vehicleupdate",
	
	"hc_fnc_jailsys",
	
	"hc_fnc_spikestrip",
	
	"hc_fnc_wantedadd",
	"hc_fnc_wantedbounty",
	"hc_fnc_wantedcrimes",
	"hc_fnc_wantedfetch",
	"hc_fnc_wantedperson",
	"hc_fnc_wantedprofupdate",
	"hc_fnc_wantedremove"
];

CONSTVAR(HC_MPAllowedFuncs);

life_HC_isActive = true;
publicVariable "life_HC_isActive";

diag_log "---------------------------- HC is Ready --------------------------------";
diag_log "Published the needed vars over the network, ready for queries to recieve!";
diag_log "-------------------------------------------------------------------------";

life_server_isReady = true;
publicVariable "life_server_isReady";
