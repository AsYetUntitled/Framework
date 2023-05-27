#include "..\..\script_macros.hpp"
/*
    File: fn_boltcutter.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Breaks the lock on a single door (Closet door to the player).
*/
private ["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = param [0,objNull,[objNull]];

private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call TON_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;

if (isNull _building) exitWith {};
if (!(_building isKindOf "House_F")) exitWith {hint localize "STR_ISTR_Bolt_NotNear";};
if (((nearestObject [_pos,"Land_Dome_Big_F"]) == _building || (nearestObject [_pos,_vaultHouse]) == _building) && (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops")))) exitWith {
    hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))];
};
if ((typeOf _building) == _vaultHouse && (nearestObject [_pos,"Land_Dome_Big_F"]) getVariable ["locked",true]) exitWith {hint localize "STR_ISTR_Bolt_Exploit"};
if (isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

_doors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _building),"numberOfDoors");
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
    _selPos = _building selectionPosition format ["Door_%1_trigger",_i];
    _worldSpace = _building modelToWorld _selPos;
        if (player distance _worldSpace < 2) exitWith {_door = _i;};
};
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if ((_building getVariable [format ["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

if ((nearestObject [_pos,"Land_Dome_Big_F"]) == _building || (nearestObject [_pos,_vaultHouse]) == _building) then {
    [[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
} else {
    [0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};

life_action_inUse = true;
//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
    case "Land_Dome_Big_F": {_cpRate = 0.003;};
    case "Land_Medevac_house_V1_F";
    case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
    default {_cpRate = 0.08;}
};

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    uiSleep 0.26;
    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_istazed) exitWith {}; //Tazed
    if (life_isknocked) exitWith {}; //Knocked
    if (life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;

if (life_boltcutter_uses >= 5) then {
    [false,"boltcutter",1] call life_fnc_handleInv;
    life_boltcutter_uses = 0;
};

_building setVariable [format ["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
_building setVariable ["locked",false,true];

if (life_HC_isActive) then {
    [getPlayerUID player,profileName,"459"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
    [getPlayerUID player,profileName,"459"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};
