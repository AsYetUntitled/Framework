#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2","_chopable"];
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_chopable = LIFE_SETTINGS(getArray,"chopShop_vehicles");
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,_chopable,25];
_vehicle = (_nearVehicles select _vehicle);
if (isNull _vehicle) exitWith {};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = CASH + _price;

if (life_HC_isActive) then {
    [player,_vehicle,_price,_price2] remoteExecCall ["HC_fnc_chopShopSell",HC_Life];
} else {
    [player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
};

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format ["chopped vehicle %1 for $%2  On Hand Cash(pre-chop): $%3",_vehicle,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        advanced_log = format ["%1 - %2 chopped vehicle %3 for $%4  On Hand Cash(pre-chop): $%5",profileName,(getPlayerUID player),_vehicle,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "advanced_log";
};

closeDialog 0;