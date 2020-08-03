#include "..\..\script_macros.hpp"
/*
    File: fn_pickupItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master handling for picking up an item.
*/
params [
    ["_object", objNull, [objNull]]
];

#define RELEASE_USE(ENTITY) ENTITY setVariable ["inUse",false,true]

if ((time - life_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay"; RELEASE_USE(_object);};
if (isNull _object || {player distance _object > 3}) exitWith {RELEASE_USE(_object);};

private _itemInfo = _object getVariable ["item",[]];
if (_itemInfo isEqualTo []) exitWith {deleteVehicle _object;};

_itemInfo params ["_item", "_value"];

private _illegal = ITEM_ILLEGAL(_item);
private _itemName = ITEM_NAME(_item);

life_action_delay = time;

if (playerSide isEqualTo west && {_illegal isEqualTo 1}) exitWith {
    private _evidencePrice = round(ITEM_SELLPRICE(_item) / 2);
    titleText[format [localize "STR_NOTF_PickedEvidence",_itemName,[_evidencePrice] call life_fnc_numberText],"PLAIN"];
    BANK = BANK + _evidencePrice;
    deleteVehicle _object;
    [1] call SOCK_fnc_updatePartial;
};

private _diff = [_item,_value,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff <= 0) exitWith {
    hint localize "STR_NOTF_InvFull";
    RELEASE_USE(_object);
};

if !(_diff isEqualTo _value) then {
    if ([true,_item,_diff] call life_fnc_handleInv) then {
        player playMove "AinvPknlMstpSlayWrflDnon";
        _object setVariable ["item",[_item,_value - _diff],true];

        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
    };
    RELEASE_USE(_object);
} else {
    if ([true,_item,_value] call life_fnc_handleInv) then {
        deleteVehicle _object;
        player playMove "AinvPknlMstpSlayWrflDnon";
        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
    } else {
        RELEASE_USE(_object);
    };
};

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_pickedUp_BEF",_diff,_itemName];
    } else {
        advanced_log = format [localize "STR_DL_AL_pickedUp",profileName,(getPlayerUID player),_diff,_itemName];
    };
    publicVariableServer "advanced_log";
};
