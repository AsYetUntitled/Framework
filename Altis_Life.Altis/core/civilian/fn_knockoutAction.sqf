#include "..\..\script_macros.hpp"
/*
    File: fn_knockoutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Knocks out the target.
*/
private "_target";
_target = param [0,objNull,[objNull]];

//Error checks
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if (player distance _target > 4) exitWith {};


if (playerSide isEqualTo civilian) then {
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync",RCLIENT];
sleep 0.08;
[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;

} else {

_degrees = getDir player; 
_degreesu = getDir _target;
_totald = _degrees - _degreesu;

if !(_totald >= -90 && _totald < 1 || _totald <= 90 && _totald > -1 || _totald >= 270 || _totald <= -270) exitWith {
hint "You need to be behind your target to knock them out!";
};

player attachTo [_target, [0, -0.4, 0.1] ];
detach player; 
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player); 
player switchmove "AmovPpneMstpSnonWnonDnon";
_obj setPosATL (getPosATL player);  
player attachTo [_obj,[0,-0.3,0.7]]; 
detach player;
[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];
uiSleep 3;
life_knockout = false;
deleteVehicle _obj;

}
