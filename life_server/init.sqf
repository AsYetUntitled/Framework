#include "script_macros.hpp"
#define __EXIT(condition) if(condition) exitWith {}
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the server and required systems.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
life_server_extDB_notLoaded = "";
serv_sv_use = [];
PVAR_ALL("life_server_isReady");

/*
	Prepare extDB before starting the initialization process
	for the server.
*/
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

if(!(EQUAL(life_server_extDB_notLoaded,""))) exitWith {}; //extDB did not fully initialize so terminate the rest of the initialization process.

/* Run stored procedures for SQL side cleanup */
["CALL resetLifeVehicles",1] call DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;

/* Map-based server side initialization. */
master_group attachTo[bank_obj,[0,0,0]];

{
	_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
	_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
	detach _var;
} foreach ["hospital_2","hospital_3"];

{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

/* Set the amount of gold in the federal reserve at mission start */
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";
[] call compile PreProcessFileLineNumbers "\life_server\eventhandlers.sqf";

/* Miscellaneous mission-required stuff */
[] spawn TON_fnc_cleanup;
life_wanted_list = [];
[] execFSM "\life_server\FSM\cleanup.fsm";

[] spawn {
	private["_logic","_queue"];
	while {true} do {
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];

		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2,Dealer_3];
	};
};

[] spawn TON_fnc_initHouses;

/* Setup the federal reserve building(s) */
private["_dome","_rsb"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;

/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
PVAR_ALL("life_server_isReady");

/* Initialize hunting zone(s) */
["hunting_zone",30] spawn TON_fnc_huntingZone;
