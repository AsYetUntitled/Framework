#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
__CONST__(LIFE_SCHEMA_NAME,"'arma3life'");//CHANGE THIS IF YOUR DATABASE IS NOT CALLED ARMA3LIFE KEEP THE ' '
publicVariable "LIFE_SCHEMA_NAME";

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

[] execVM "\life_server\fn_initHC.sqf";

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

server_query_running = false;
life_DB_queue = [];
serv_sv_use = [];

//Run procedures for SQL cleanup on mission start.
"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", "CALL resetLifeVehicles();",(call LIFE_SCHEMA_NAME)]; //Reset vehicles active state to false.
"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", "CALL deleteDeadVehicles();",(call LIFE_SCHEMA_NAME)]; //Delete dead / non-usable vehicles for cleanup.

fed_bank setVariable["safe",(count playableUnits),true];
life_animals_spawned = false;
life_animals_array = [];

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
//[] call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf"; Not currently used

//Double the cleanup for connecting clients and disconnecting clients.
_onDisconnect = ["SERV_onClientDisconnect","onPlayerDisconnected","TON_fnc_clientDisconnect"] call BIS_fnc_addStackedEventHandler;
_onConnect = ["SERV_onClientConnected","onPlayerConnected","TON_fnc_clientDisconnect"] call BIS_fnc_addStackedEventHandler;

[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

bank_obj setVariable["rob_in_sess",false,true];
robbery_success = 0;
publicVariable "robbery_success";

[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2,Dealer_3];
	};
};

//Strip NPC's of weapons
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

//Lockup the dome
private["_dome","_rsb"];
_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;