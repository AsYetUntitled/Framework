#include "..\..\script_macros.hpp"
/*
    File: fn_arrestAction.sqf
    Author:

    Description:
    Arrests the targeted person.
*/
params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || {!isPlayer _unit}) exitWith {}; //Not valid
if !(_unit getVariable "restrained") exitWith {}; //He's not restrained.
if !((side _unit) in [civilian,independent]) exitWith {}; //Not a civ

if (life_HC_isActive) then {
    [getPlayerUID _unit,_unit,player,false] remoteExecCall ["HC_fnc_wantedBounty",HC_Life];
} else {
    [getPlayerUID _unit,_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",RSERV];
};

detach _unit;
[_unit,false] remoteExecCall ["life_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_Arrested_BEF",_unit getVariable ["realname",name _unit]];
    } else {
        advanced_log = format [localize "STR_DL_AL_Arrested",profileName,(getPlayerUID player),_unit getVariable ["realname",name _unit]];
    };
    publicVariableServer "advanced_log";
};
