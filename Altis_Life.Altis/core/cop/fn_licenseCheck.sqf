#include "..\..\script_macros.hpp"
/*
    File: fn_licenseCheck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Returns the licenses to the cop.
*/

params [
    ["_cop",objNull,[objNull]]
];

if (isNull _cop) exitWith {}; //Bad entry

private _licenses = "";

//Config entries for licenses that are civilian
private _licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
    if (LICENSE_VALUE(configName _x, "civ")) then {
        _licenses = _licenses + getText(_x >> "displayName") + "<br/>";
    };
    true
} count _licensesConfigs;

if (_licenses isEqualTo "") then {
    _licenses = localize "STR_Cop_NoLicensesFound";
};
[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];
