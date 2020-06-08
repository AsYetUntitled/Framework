#include "..\..\script_macros.hpp"
/*
    File: fn_pickupMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Picks up money
*/
params [
    ["_money", objNull, [objNull]]
];

if ((time - life_action_delay) < 1.5) exitWith {
    hint localize "STR_NOTF_ActionDelay";
    _money setVariable ["inUse",false,true];
};
if (isNull _money || {player distance _money > 3}) exitWith {
    _money setVariable ["inUse",false,true];
};

private _value = (_money getVariable "item") select 1;
if (!isNil "_value") exitWith {
    deleteVehicle _money;

    private _pickupLimit = LIFE_SETTINGS(getNumber,"cash_pickup_limit");
    _value = _value min _pickupLimit;

    player playMove "AinvPknlMstpSlayWrflDnon";
    titleText [format [localize "STR_NOTF_PickedMoney",[_value] call life_fnc_numberText],"PLAIN"];
    CASH = CASH + _value;
    [0] call SOCK_fnc_updatePartial;
    life_action_delay = time;

    if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
        if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            money_log = format [localize "STR_DL_ML_pickedUpMoney_BEF",[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
        } else {
            money_log = format [localize "STR_DL_ML_pickedUpMoney",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
        };
        publicVariableServer "money_log";
    };
};
