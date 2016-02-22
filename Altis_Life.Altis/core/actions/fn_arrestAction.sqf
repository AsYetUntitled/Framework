#include "..\..\script_macros.hpp"
/*
	File: fn_arrestAction.sqf
	Author:

	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit GVAR "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid

if(life_HC_isActive) then {
	[getPlayerUID _unit,_unit,player,false] remoteExecCall ["HC_fnc_wantedBounty",HC_Life];
} else {
	[getPlayerUID _unit,_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",RSERV];
};

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false] remoteExecCall ["life_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit GVAR ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
