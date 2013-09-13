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

publicVariable "life_fnc_vehStoreItem";
publicVariable "life_fnc_vehTakeItem";
[] execVM "\life_server\vars.sqf";
[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[] call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";

//Only run if truly dedicated
if(!hasInterface) then
{
	//[] execVM "\life_server\anticheat_server.sqf";
};

//[] spawn STS_fnc_cleanup;
life_fnc_wantedAdd = compileFinal PreprocessFileLineNumbers "\life_server\wanted_add.sqf";
life_fnc_wantedRemove = compileFinal PreprocessFileLineNumbers "\life_server\wanted_remove.sqf";
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
		waitUntil {(count ((missionNamespace getVariable["bis_functions_mainscope",objnull]) getVariable "BIS_fnc_MP_queue")) > 50};
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],true];
	};
};

[] spawn
{
	while {true} do
	{
		sleep (40 * 60);
		{deleteVehicle _x} foreach (nearestObjects[[0,0,0],["Land_BottlePlastic_V1_F","Land_Can_V3_F","Land_Suitcase_F","Land_Sack_F"],10000]);
	};
};

fnc_serv_kick = {endMission "loser";};
publicVariable "fnc_serv_kick";
[] spawn DB_fnc_queueManagement;

_building = nearestObjects[getMarkerPos "Meth",["Building"],5] select 0;
_building setVariable["bis_disabled_Door_1",1,true];
_building setVariable["bis_disabled_Door_2",1,true];
_building setVariable["bis_disabled_Door_5",1,true];
_building setVariable["bis_disabled_Door_6",1,true];