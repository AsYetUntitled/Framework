#include "..\..\script_macros.hpp"
/*
    File: fn_knockedOut.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts and monitors the knocked out state.
*/

params [
    ["_target",objNull,[objNull]],
    ["_who","",[""]]
];

if (isNull _target || {_who isEqualTo ""}) exitWith {};
if !(_target isEqualTo player) exitWith {};

titleText [format [localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "Incapacitated";
disableUserInput true;

private _obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL (visiblePositionASL player);
_obj setPosATL ASLTOATL (visiblePositionASL player);

life_isknocked = true;
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "AmovPpneMstpSrasWrflDnon";
disableUserInput false;
detach player;
deleteVehicle _obj;
life_isknocked = false;
player setVariable ["robbed",false,true];
