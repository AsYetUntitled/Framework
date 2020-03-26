/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Creates the vehicle and adds a database entry if vehicle is purchased.
*/
params [
    ["_unit", objNull, [objNull]],
    ["_className","",[""]],
    ["_spawnPoint","",[""]],
    ["_color", -1, [0]],
    ["_purchase",false,[false]]
];

if (isNull _unit || {{_className isEqualTo ""} || {_spawnPoint isEqualTo ""}}) exitWith {};

private _uid = getPlayerUID _unit;
private _className = typeOf _vehicle;

private _plateFormat = LIFE_SETTINGS(getText,"vehicle_plateFormat");
private _plateFormatArray = _plateFormat splitString "";
private _letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

private _plate = "";
while {_plate isEqualTo ""} do {
    {
        private _randomPlate = [];
        if (_x isEqualTo "$") then {
            _randomPlate pushBack (selectRandom _letterArray);
        } else {
            if (_x isEqualTo " ") then {
                _randomPlate pushBack " ";
            } else {
                _randomPlate pushBack (round(random 9));
            };
        };
        _randomPlate = _randomPlate joinString "";

        private _return = [format["checkPlate:%1",_randomPlate],2] call DB_fnc_asyncCall;
        if (_return isEqualTo []) exitWith {_plate = _randomPlate};
    } forEach _plateFormatArray;
};

if (_purchase) then {
    private _type = call {
        if (_vehicle isKindOf "Car") exitWith {"Car"};
        if (_vehicle isKindOf "Air") exitWith {"Air"};
        if (_vehicle isKindOf "Ship") exitWith {"Ship"};
    };

    private _side = switch (side _unit) do {
        case west:{"cop"};
        case civilian: {"civ"};
        case independent: {"med"};
        default {"Error"};
    };

    private _query = format ["insertVehicle:%1:%2:%3:%4:%5:%6", _side, _className, _type, _uid, _color, _plate];
    [_query, 1] call DB_fnc_asyncCall;
};

private _vehicle = createVehicle [_className,getMarkerPos _spawnPoint,[],0];
_vehicle setDir (markerDir _spawnPoint);

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
_vehicle lock 2;
_vehicle disableTIEquipment true;

[_vehicle,_colorIndex] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle setVariable ["trunk_in_use",false,true];
_vehicle setVariable ["vehicle_info_owners",[[_uid,name _unit]],true];
_vehicle setPlateNumber _plate;
//_vehicle setVariable ["plate", _plate, true]; what happens to ships/air?

switch (side _unit) do {
    case west: {
        [_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
    };
    case civilian: {
        if ((life_veh_shop select 2) isEqualTo "civ" && {_className == "B_Heli_Light_01_F"}) then {
            [_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
        };
    };
    case independent: {
        [_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
    };
};

[_uid,(side _unit),_vehicle,1] call TON_fnc_keyManagement;
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];