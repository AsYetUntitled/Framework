#include "..\..\script_macros.hpp"
/*
    File: fn_gutAnimal.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Guts the animal?
*/

params [
    ["_animalCorpse", objNull, [objNull]]
];

if (isNull _animalCorpse) exitWith {}; //Object passed is null?

life_interrupted = false;
if (player distance _animalCorpse > 3.5) exitWith {};
life_action_inUse = true;

private _animalInfo = switch (typeOf _animalCorpse) do {
    case "Hen_random_F": {["STR_ANIM_chicken", "hen_raw"]};
    case "Cock_random_F": {["STR_ANIM_Rooster", "rooster_raw"]};
    case "Goat_random_F": {["STR_ANIM_Goat", "goat_raw"]};
    case "Sheep_random_F": {["STR_ANIM_Sheep", "sheep_raw"]};
    case "Rabbit_F": {["STR_ANIM_Rabbit", "rabbit_raw"]};
    default {["", ""]};
};

_animalInfo params ["_displayName", "_item"];
_displayName = localize _displayName;

if (_displayName isEqualTo "") exitWith {life_action_inUse = false;};

private _upp = format [localize "STR_NOTF_Gutting",_displayName];
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    uiSleep 0.15;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (!alive player) exitWith {};
    if (isNull _animalCorpse) exitWith {};
    if !(isNull objectParent player) exitWith {};
    if (life_interrupted) exitWith {};
};

life_action_inUse = false;
"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (isNull _animalCorpse) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

if ([true,_item,1] call life_fnc_handleInv) then {
    deleteVehicle _animalCorpse;
    titleText[format [(localize "STR_NOTF_Guttingfinish"),_displayName],"PLAIN"];
} else {
    titleText[(localize "STR_NOTF_InvFull"),"PLAIN"];
};
