
/*
    File: fn_fuelStore.sqf
    Author: Ulrich "Zero" Werren

    Description:
    Fuel Tank Job, Fill Truck with Fuel.
*/
params [
    ["_vehicle",objNull,[objNull]]
];

closeDialog 0;
if (_vehicle getVariable ["fuelTankWork",false]) exitWith {titleText[localize "STR_FuelTank_InUse","PLAIN"]};
if !(local _vehicle) exitWith {titleText[localize "STR_MISC_VehLocal","PLAIN"]};

life_action_inUse = true;

(_vehicle getVariable ["fuelTank",[]]) params [
    ["_fuelSpace",(getNumber(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _vehicle) >> "vFuelSpace")),[0]],
    ["_fuelState",0,[0]]
];

_vehicle setVariable ["fuelTankWork",true,true];
_vehicle remoteExec ["life_fnc_soundDevice",-2];
life_action_inUse = false;

disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["Tank  %1 Ltr / %2 Ltr",_fuelState,_fuelSpace];
private _fuelLevel = (1 / _fuelSpace) * _fuelState;
_progress progressSetPosition _fuelLevel;

waitUntil {
    if (!alive _vehicle || isNull _vehicle) exitWith {true};
    if (isEngineOn _vehicle) exitWith {titleText[localize "STR_FuelTank_Stopped","PLAIN"]; true};
    if !(_vehicle getVariable ["fuelTankWork",false]) exitWith {titleText[localize "STR_FuelTank_Stopped","PLAIN"]; true};
    if (player distance _vehicle > 20) exitWith {titleText[localize "STR_FuelTank_Stopped","PLAIN"]; true};
    if !(local _vehicle) exitWith {titleText[localize "STR_MISC_VehLocal","PLAIN"]};

    _fuelState = _fuelState + 100;
    _vehicle setVariable ["fuelTank",[_fuelSpace,_fuelState],true];
    _fuelLevel = (1 / _fuelSpace) * _fuelState;

    _progress progressSetPosition _fuelLevel;
    _pgText ctrlSetText format ["Tank  %1 Ltr / %2 Ltr",_fuelState,_fuelSpace];

    if (_fuelState >= _fuelSpace) exitWith {titleText [localize "STR_FuelTank_Full","PLAIN"]; true};
    sleep 0.5;
    false
};

"progressBar" cutText ["","PLAIN"];
_vehicle setVariable ["fuelTankWork",nil,true];