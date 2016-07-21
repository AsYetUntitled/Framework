/*
    File: fn_houseConfig.sqf
    Author: BoGuu

    Description:
    Fetch data from Config_Housing/Garages
*/

private _house = param[0,"",[""]];

if (_house isEqualTo "") exitWith {[]};

private _houseConfig = missionConfigFile >> "Housing" >> worldName >> _house;
private _garageConfig = missionConfigFile >> "Garages" >> worldName >> _house;

private _isHouse = switch (true) do {
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
