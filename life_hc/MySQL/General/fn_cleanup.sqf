#include "\life_hc\hc_macros.hpp"
/*
    File: fn_cleanup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Server-side cleanup script on vehicles, dealers and fed reserve.
*/
private _saveFuel = LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1;
private _minUnitDistance = LIFE_SETTINGS(getNumber,"vehicles_despawn_max_distance");

private _fnc_fedDealerUpdate = {
    {
        private _dealer = missionNamespace getVariable [_x, objNull];
        if !(isNull _dealer) then {
            _x setVariable ["sellers", [], true];
        };
    } forEach ["Dealer_1", "Dealer_2", "Dealer_3"];


    private _funds = fed_bank getVariable ["safe", 0];
    fed_bank setVariable ["safe", round(_funds+((count playableUnits)/2)), true];
};

private _fnc_cleanVehicles = {
    {
        private _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "vehicleClass");
        private _protect = _x getVariable ["NPC",false];

        if ((_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) && {!_protect}) then {
            private _noUnitsNear = (nearestObjects [_x, ["CAManBase"], _minUnitDistance]) findIf {isPlayer _x && {alive _x}} isEqualTo -1;

            if (crew _x isEqualTo [] && {_noUnitsNear}) then {
                private _fuel = if (_saveFuel) then {fuel _x} else {1};
                private _dbInfo = _x getVariable "dbInfo";

                deleteVehicle _x;

                if (isNil "_dbInfo") exitWith {};

                waitUntil {uiSleep 1; isNull _x};

                _dbInfo params [
                    "_uid",
                    "_plate"
                ];

                private _query = format ["cleanupVehicle:%1:%2:%3", _fuel, _uid, _plate];
                [_query, 1] call HC_fnc_asyncCall;
            };
        };
    } forEach vehicles;

    {
        if (!isNil {_x getVariable "item"}) then {
            deleteVehicle _x;
        };
        true
    } count (allMissionObjects "Thing");
};

//Array format: [parameters,function,delayTime]
private _routines = [
    [[], _fnc_fedDealerUpdate, 1800],
    [[], _fnc_cleanVehicles, 3600]
];

{
    _x pushBack (diag_tickTime + (_x # 2));
} forEach _routines;

for "_i" from 0 to 1 step 0 do {
    {
        _x params ["_params", "_function", "_delay", "_timeToRun"];
        if (diag_tickTime > _timeToRun) then {
            _params call _function;
            _x set [3, diag_tickTime + _delay];
        };
    } forEach _routines;
    uiSleep 1e-6;
};
