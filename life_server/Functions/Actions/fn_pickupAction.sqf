#include "\life_server\script_macros.hpp"
/*
	File: fn_pickupAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Validates that the cash is not a lie
*/
params [
	["_obj",objNull,[objNull]],
	["_client",objNull,[objNull]],
	["_cash",false,[true]]
];

if(isNull _obj OR {isNull _client}) exitWith {systemChat "Obj or client is null?";}; //No.
if(!(_obj GVAR ["inUse",false])) exitWith {
	_client = owner _client;
	_obj SVAR ["inUse",true,true];
	if(_cash) then {
		_obj remoteExecCall ["life_fnc_pickupMoney",_client];
	} else {
		_obj remoteExecCall ["life_fnc_pickupItem",_client];
	};
};