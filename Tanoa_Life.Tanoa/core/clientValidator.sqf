#include "..\script_macros.hpp"

/*
    File: clientValidator.sqf
    Author:

    Description:
    Loops through a list of variables and checks whether
    or not they are defined, if they are defined then trigger
    spyglass and kick the client to the lobby.
*/

private _vars = [
    "life_revive_fee", "life_gangPrice", "life_gangUpgradeBase", "life_enableFatigue", "life_paycheck_period", "life_vShop_rentalOnly", "life_weapon_shop_array",
    "life_garage_prices", "life_garage_sell", "life_houseLimit", "life_gangUpgradeMultipler", "life_impound_car", "life_impound_boat", "life_impound_air"
];

{
    if (!isNil {(missionNamespace getVariable _x)}) exitWith {
        [profileName, getPlayerUID player, format ["VariableSetBeforeInitialized_%1", _x]] remoteExecCall ["SPY_fnc_cookieJar", RSERV];
        [profileName, format [localize "STR_SpyDetect_VariableSetBeforeClientInitialized", _x]] remoteExecCall ["SPY_fnc_notifyAdmins", RCLIENT];
        sleep 0.5;
        failMission "SpyGlass";
    };
} forEach _vars;
