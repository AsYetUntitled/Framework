#include "..\..\script_macros.hpp"
/*
    File: fn_copBreakDoor.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Allows cops to 'kick' in the door?
*/
private ["_house","_door","_title","_titleText","_progressBar","_cpRate","_cP","_uid"];
_house = param [0,objNull,[objNull]];

if (isNull _house || !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_uid = (_house getVariable "house_owner") select 0;
if (!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};

_door = [_house] call life_fnc_nearestDoor;
if (_door isEqualTo 0) exitWith {hint localize "STR_Cop_NotaDoor"};
if ((_house getVariable [format ["bis_disabled_Door_%1",_door],0]) isEqualTo 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Progress";
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0092;

[2,"STR_House_Raid_NOTF",true,[(_house getVariable "house_owner") select 1]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

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
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {};
    if (life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if (!alive player) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_house animateSource [format ["Door_%1_source", _door], 1];
_house setVariable [format ["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
