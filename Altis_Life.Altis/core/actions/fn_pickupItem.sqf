#include "..\..\script_macros.hpp"
#define INUSE(ENTITY) ENTITY setVariable ["inUse",false,true]
/*
    File: fn_pickupItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master handling for picking up an item.
*/
if ((time - life_action_delay) < 2) exitWith {hint localize "STR_NOTF_ActionDelay"; INUSE(_this);};
if (isNull _this || {player distance _this > 3}) exitWith {INUSE(_this);};

private _itemInfo = _this getVariable ["item",[]]; 
_itemInfo params [
    ["_oldItem","",[""]],
    ["_value",0,[0]]
];
if (count _itemInfo isEqualTo 0) exitWith {deleteVehicle _this;};
private _illegal = ITEM_ILLEGAL(_oldItem);
private _itemName = ITEM_NAME(_oldItem);
if (isLocalized _itemName) then {
    _itemName = (localize _itemName);
};

if (playerSide isEqualTo west && _illegal isEqualTo 1) exitWith {
    titleText[format [localize "STR_NOTF_PickedEvidence",_itemName,[round(ITEM_SELLPRICE(_itemInfo select 0) / 2)] call life_fnc_numberText],"PLAIN"];
    BANK = BANK + round(ITEM_SELLPRICE(_oldItem) / 2);
    deleteVehicle _this;
    [1] call SOCK_fnc_updatePartial;
    life_action_delay = time;
};

life_action_delay = time;
private _diff = [_oldItem,_value,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff <= 0) exitWith {hint localize "STR_NOTF_InvFull"; INUSE(_this);};

if !(_diff isEqualTo _value) then {
    if ([true,_oldItem,_diff] call life_fnc_handleInv) then {
        player playMove "AinvPknlMstpSlayWrflDnon";

        _this setVariable ["item",[_oldItem,_value - _diff],true];
        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
        INUSE(_this);
    } else {
        INUSE(_this);
    };
} else {
    if ([true,_oldItem,_value] call life_fnc_handleInv) then {
        deleteVehicle _this;
        //waitUntil{isNull _this};
        player playMove "AinvPknlMstpSlayWrflDnon";

        titleText[format [localize "STR_NOTF_Picked",_diff,_itemName],"PLAIN"];
    } else {
        INUSE(_this);
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
