#include "..\..\script_macros.hpp"
/*
    File: fn_pickupItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master handling for picking up an item.
*/

#define RELEASE_USE(ENTITY) ENTITY setVariable ["inUse",false,true]

if ((time - life_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay"; RELEASE_USE(_this);};
if (isNull _this || {player distance _this > 3}) exitWith {RELEASE_USE(_this);};

private _itemInfo = _this getVariable ["item",[]];
if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _this;};

_itemInfo params ["_item", "_value"];

private _illegal = ITEM_ILLEGAL(_item);
private _itemName = ITEM_NAME(_item);

if (isLocalized _itemName) then {
    _itemName = localize _itemName;
};

life_action_delay = time;

if (playerSide isEqualTo west && {_illegal isEqualTo 1}) exitWith {
    private _evidencePrice = round(ITEM_SELLPRICE(_item) / 2);
    titleText[format [localize "STR_NOTF_PickedEvidence",_itemName,[_evidencePrice] call life_fnc_numberText],"PLAIN"];
    BANK = BANK + _evidencePrice;
    deleteVehicle _this;
    [1] call SOCK_fnc_updatePartial;
};

private _diff = [_item,_value,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff <= 0) exitWith {
    hint localize "STR_NOTF_InvFull";
    RELEASE_USE(_this);
};

if !(_diff isEqualTo _value) then {
    if ([true,_item,_diff] call life_fnc_handleInv) then {
        player playMove "AinvPknlMstpSlayWrflDnon";
        _this setVariable ["item",[_item,_value - _diff],true];
        
        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
    };
    RELEASE_USE(_this);
} else {
    if ([true,_item,_value] call life_fnc_handleInv) then {
        deleteVehicle _this;
        //waitUntil{isNull _this};
        player playMove "AinvPknlMstpSlayWrflDnon";

        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
    } else {
        RELEASE_USE(_this);
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
