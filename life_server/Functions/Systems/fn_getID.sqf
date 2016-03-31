#include "\life_server\script_macros.hpp"
/*
	File: fn_getID.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for the admin menu returns the player ID for in-game bans/kicks.
	https://community.bistudio.com/wiki/Multiplayer_Server_Commands
*/
private["_id","_ret"];
_id = _this select 0;
_ret = _this select 1;
_id = owner _id;
_ret = owner _ret;

[_id] remoteExecCall ["life_fnc_adminid",_ret];