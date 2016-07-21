/*
    File: fn_houseConfig.sqf
    Author: BoGuu

    Description:
    Fetch housing data from Config_Housing
*/

_house = param[0,"",[""]];

if (_house isEqualTo "") exitWith {[]};
if (!isClass (missionConfigFile >> "Housing" >> "Altis" >> _house)) exitWith {[]};

_price = getNumber(missionConfigFile >> "Housing" >> worldName >> _house >> "price");
_numberCrates = getNumber(missionConfigFile >> "Housing" >> worldName >> _house >> "numberCrates");

//Return
[_price,_numberCrates]
