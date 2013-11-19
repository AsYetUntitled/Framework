/*
	@file Version: 2.1.1
	@file name: init.sqf
	@file Author: TAW_Tonic
	@file edit: 7/14/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/
life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
server_query_running = false;
life_DB_queue = [];
serv_sv_use = [];
fed_bank setVariable["fed_rob_ip",false,true];
fed_bank setVariable["fed_locked",false,true];
_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", "CALL resetLifeVehicles();"]; //Reset vehicles active state to false.

publicVariable "life_fnc_vehStoreItem";
publicVariable "life_fnc_vehTakeItem";
publicVariable "life_fnc_vehInventory";
[] execVM "\life_server\vars.sqf";
[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[] call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";

//Only run if truly dedicated
if(!hasInterface) then
{
	//[] execVM "\life_server\anticheat_server.sqf";
};

[] spawn STS_fnc_cleanup;
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
		//sleep (20 * 60);
		waitUntil {(count ((missionNamespace getVariable["bis_functions_mainscope",objnull]) getVariable "BIS_fnc_MP_queue")) > 5};
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "life_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],true];
	};
};

fnc_serv_kick = {endMission "loser";};
publicVariable "fnc_serv_kick";
[] spawn DB_fnc_queueManagement;

//Server-side functions that need to be sent out.
publicVariable "STS_fnc_addVehicle2Chain";
publicVariable "life_fnc_fedSuccess";

[] spawn STS_fnc_federalUpdate;