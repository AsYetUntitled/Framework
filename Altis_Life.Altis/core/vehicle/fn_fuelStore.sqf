
/*
    File: fn_fuelStore.sqf
    Author: Ulrich "Zero" Werren

    Description:
    Fuel Tank Job, Fill Truck with Fuel.
*/

private ["_vehicle","_fuelSpace","_fuelState","_fuelLevel","_ui","_progress","_pgText"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {};
if (!isNil {_vehicle getVariable "fuelTankWork"}) exitWith {titleText[localize "STR_FuelTank_InUse","PLAIN"];};
closeDialog 0;
life_action_inUse = true;
if (isNil {_vehicle getVariable "fuelTank"}) then{
    _fuelSpace = getNumber(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _vehicle) >> "vFuelSpace");
    _fuelState = 0;
    _vehicle setVariable ["fuelTank",[_fuelSpace,_fuelState],true];
}else{
    _fuelSpace = (_vehicle getVariable "fuelTank") select 0;
    _fuelState = (_vehicle getVariable "fuelTank") select 1;
};

_vehicle setVariable ["fuelTankWork",true,true];
_vehicle remoteExec ["life_fnc_soundDevice",-2];
life_action_inUse = false;

disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["Tank  %1 Ltr / %2 Ltr",_fuelState,_fuelSpace];
_fuelLevel = (1 / _fuelSpace) * _fuelState;
_progress progressSetPosition _fuelLevel;

waitUntil {
    if (!alive _vehicle || isNull _vehicle) exitWith {true};
    if (isEngineOn _vehicle) exitWith {titleText[localize "STR_FuelTank_Stopped","PLAIN"]; true};
    if (isNil {_vehicle getVariable "fuelTankWork"}) exitWith {titleText[localize "STR_FuelTank_Stopped","PLAIN"]; true};
    if (player distance _vehicle > 20) exitWith {titleText[localize "STR_FuelTank_Stopped","PLAIN"]; true};

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