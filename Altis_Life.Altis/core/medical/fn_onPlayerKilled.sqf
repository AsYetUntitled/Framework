#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerKilled.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    When the player dies collect various information about that player
    and pull up the death dialog / camera functionality.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if ((vehicle _unit) != _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
_unit setVariable ["Revive",true,true];
_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn {
    private["_maxTime","_RespawnBtn","_Timer"];
    disableSerialization;
    _RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
    _Timer = ((findDisplay 7300) displayCtrl 7301);

        if (LIFE_SETTINGS(getNumber,"respawn_timer") < 5) then {
            _maxTime = time + 5;
        } else {
            _maxTime = time + LIFE_SETTINGS(getNumber,"respawn_timer");
        };
    _RespawnBtn ctrlEnable false;
    waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
    round(_maxTime - time) <= 0 || isNull _this};
    _RespawnBtn ctrlEnable true;
    _Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
    private["_unit"];
    _unit = _this select 0;
    waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if (!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
    if (vehicle _killer isKindOf "LandVehicle") then {

        if (life_HC_isActive) then {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        //Get rid of this if you don't want automatic vehicle license removal.
        if (!local _killer) then {
            [2] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    } else {

        if (life_HC_isActive) then {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        if (!local _killer) then {
            [3] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    };
};

life_save_gear = [player] call life_fnc_fetchDeadGear;

_containers = nearestObjects[getPosATL player,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;

//Killed by cop stuff...
if (side _killer isEqualTo west && playerSide != west) then {
    life_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!life_use_atm && {CASH > 0}) then {
        [format[localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        CASH = 0;
    };
};

if (!isNull _killer && {_killer != _unit}) then {
    life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0;
life_is_alive = false;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_managesc",RSERV];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[4] call SOCK_fnc_updatePartial;
