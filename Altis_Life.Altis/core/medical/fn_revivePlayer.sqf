#include "..\..\script_macros.hpp"
/*
    File: fn_revivePlayer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the revive process on the player.
*/
if !(params[["_target", objNull, [objNull]]]) exitWith {};

private _reviveCost = LIFE_SETTINGS(getNumber, "revive_fee");
private _revivable = _target getVariable ["Revive", false];

if (_revivable) exitWith {};
if (_target getVariable ["Reviving", objNull] isEqualTo player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if (player distance _target > 5) exitWith {};

private _targetName = _target getVariable ["name", "Unknown"];
private _title = format [localize "STR_Medic_Progress", _targetName];
life_action_inUse = true; //Lockout the controls.

_target setVariable ["Reviving", player, true];
disableSerialization;
"progressBar" cutRsc ["life_progress", "PLAIN"];
private _ui = uiNamespace getVariable ["life_progress", displayNull];
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...", "%", _title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

private _badDistance = false;
for "_i" from 0 to 1 step 0 do {
    if !(animationState player isEqualTo "ainvpknlmstpsnonwnondnon_medic_1") then {
        [player, "AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync", RCLIENT];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    uiSleep .15;
    _cP = _cP + .01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...", round(_cP * 100), "%", _title];
    if (_cP >= 1 || {!alive player}) exitWith {};
    if (life_istazed || {life_isknocked} || {life_interrupted}) exitWith {};
    if (player getVariable ["restrained", false]) exitWith {};
    if (player distance _target > 4) exitWith {_badDistance = true;};
    if (_target getVariable ["Revive", false]) exitWith {};
    if !(_target getVariable ["Reviving", objNull] isEqualTo player) exitWith {};
};

//Kill the UI display and check for various states
"progressBar" cutText ["", "PLAIN"];
player playActionNow "stop";

if !(_target getVariable ["Reviving", objNull] isEqualTo player) exitWith {hint localize "STR_Medic_AlreadyReviving"; life_action_inUse = false;};
_target setVariable ["Reviving", nil, true];

if (!alive player || {life_istazed} || {life_isknocked}) exitWith {life_action_inUse = false;};
if (_target getVariable ["Revive", false]) exitWith {hint localize "STR_Medic_RevivedRespawned"; life_action_inUse = false;};
if (player getVariable ["restrained", false]) exitWith {life_action_inUse = false;};
if (_badDistance) exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel", "PLAIN"]; life_action_inUse = false;};

life_action_inUse = false;
_target setVariable ["Revive", true, true];
[profileName] remoteExecCall ["life_fnc_revived", _target];

if (playerSide isEqualTo independent) then {
    titleText[format [localize "STR_Medic_RevivePayReceive", _targetName,[_reviveCost] call life_fnc_numberText], "PLAIN"];
    BANK = BANK + _reviveCost;
    [1] call SOCK_fnc_updatePartial;
};

sleep .6;
player reveal _target;
