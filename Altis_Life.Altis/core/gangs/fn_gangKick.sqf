#include "..\..\script_macros.hpp"
/*
    File: fn_gangKick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Kicks a player from your gang.
*/
private ["_unit","_unitID","_members"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = getPlayerUID _unit;
_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_members = _members - [_unitID];
group player setVariable ["gang_members",_members,true];

remoteExecCall ["life_fnc_clientGangKick",_unit];

if (life_HC_isActive) then {
    [4,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};

[] call life_fnc_gangMenu;
