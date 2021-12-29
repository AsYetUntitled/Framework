#include "\life_hc\hc_macros.hpp"
/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Creates the vehicle and adds a database entry if vehicle is purchased.
*/
params [
    ["_unit", objNull, [objNull]],
    ["_className","",[""]],
    ["_spawnPoint","",[""]],
    ["_color", "", [""]],
    ["_purchase",false,[false]]
];

if (isNull _unit || {_className isEqualTo "" || {_spawnPoint isEqualTo ""}}) exitWith {};

private _uid = getPlayerUID _unit;
private _plateFormat = LIFE_SETTINGS(getText,"vehicle_plateFormat");
private _platePrefix = LIFE_SETTINGS(getText,"vehicle_platePrefix");
private _plateForceUnique = LIFE_SETTINGS(getNumber,"vehicle_enforceUniquePlate") isEqualTo 1;
private _plateFormatArray = _plateFormat splitString "";
private _letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

private _plate = "";
while {_plate isEqualTo ""} do {
    private _randomPlate = [_platePrefix];
    {
        if (_x isEqualTo "$") then {
            _randomPlate pushBack (selectRandom _letterArray);
        } else {
            if (_x isEqualTo " ") then {
                _randomPlate pushBack " ";
            } else {
                _randomPlate pushBack (round(random 9));
            };
        };
    } forEach _plateFormatArray;

    _randomPlate = _randomPlate joinString "";
    if (_plateForceUnique) then {
        private _return = [format["checkPlate:%1",_randomPlate],2] call HC_fnc_asyncCall;
        if (_return isEqualTo []) exitWith {_plate = _randomPlate};
    } else {
        _plate = _randomPlate;
    };
};

private _vehicle = createVehicle [_className,getMarkerPos _spawnPoint,[],0];
_vehicle setDir (markerDir _spawnPoint);

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
_vehicle lock 2;
_vehicle disableTIEquipment true;

[_vehicle,_color] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle setVariable ["trunk_in_use",false,true];
_vehicle setVariable ["vehicle_info_owners",[[_uid,name _unit]],true];
_vehicle setPlateNumber _plate;
_vehicle setVariable ["plate", _plate, true]; //'Air' don't work properly for setPlateNumber

private _vid = -1;
if (_purchase) then {
    private _type = call {
        if (_vehicle isKindOf "Air") exitWith {"Air"};
        if (_vehicle isKindOf "Ship") exitWith {"Ship"};
        "Car"
    };

    private _side = [_unit,true] call life_util_fnc_sideToString;

    private _query = format ["insertVehicle:%1:%2:%3:%4:%5:%6", _side, _className, _type, _uid, _color, _plate];
    private _queryResult = [_query, 2] call HC_fnc_asyncCall;
    _queryResult params [["_vid",-1,[0]]];

    [_vehicle,_vid] spawn {
        params ["_vehicle","_vid"];
        uiSleep 0.3;
        _vehicle setVariable ["vehID",_vid];
    };
};

switch (side _unit) do {
    case west: {
        if (_className in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
            [_vehicle,"cop_offroad",true] call HC_fnc_vehicleAnimate;
        };
    };
    case civilian: {
        if (_className isEqualTo "B_Heli_Light_01_F" && !(_color isEqualTo "Digi Green")) then {
            [_vehicle,"civ_littlebird",true] call HC_fnc_vehicleAnimate;
        };
    };
    case independent: {
        if (_className isEqualTo "C_Offroad_01_F") then {
            [_vehicle,"med_offroad",true] call HC_fnc_vehicleAnimate;
        };
    };
};

[_uid,(side _unit),_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
