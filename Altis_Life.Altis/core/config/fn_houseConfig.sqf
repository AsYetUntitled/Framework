/*
    File: fn_houseConfig.sqf
    Author: BoGuu

    Description:
    Fetch data from Config_Housing/Garages
*/

_house = param[0,"",[""]];

if (_house isEqualTo "") exitWith {[]};

_houseConfig = missionConfigFile >> "Housing" >> worldName >> _house;
_garageConfig = missionConfigFile >> "Garages" >> worldName >> _house;

_isHouse = switch (true) do {
    case (isClass (_houseConfig)) : {true};
    case (isClass (_garageConfig)) : {false};
    default {nil};
};

if (isNil "_isHouse") exitWith {[]};

private _config = [_garageConfig,_houseConfig] select _isHouse;

private _price = getNumber(_config >> "price");
private _numberCrates = if (_isHouse) then {getNumber(_houseConfig >> "numberCrates")} else {0};

//Return
[_price,_numberCrates]
