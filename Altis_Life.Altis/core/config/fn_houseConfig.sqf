/*
    File: fn_houseConfig.sqf
    Author: BoGuu

    Description:
    Fetch housing data from Config_Housing
*/

_house = param[0,"",[""]];

if (_house isEqualTo "") exitWith {[]};
if (!isClass (missionConfigFile >> "Housing" >> "Altis" >> _house)) exitWith {[]};

_houseConfig = missionConfigFile >> "Housing" >> worldName >> _house;

_price = getNumber(_houseConfig >> "price");
_numberCrates = getNumber(_houseConfig >> "numberCrates");

//Return
[_price,_numberCrates]
