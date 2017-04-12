/*
    File: fn_radar.sqf
    Author: Silly Aussie kid named Jaydon

    Description:
    Radar
*/

if !(playerSide isEqualTo west) exitWith {};

private _vehicle = cursorObject;
private _speed = round speed _vehicle;

if (_vehicle isKindOf "Car" && {currentWeapon player isEqualTo "hgun_P07_snds_F"}) then {
    switch (true) do {
        case (_speed > 33 && _speed <= 80): {
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" + (localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" + (localize "STR_Cop_VehSpeed"), round _speed];
        };

        case (_speed > 80): {
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" + (localize "STR_Cop_Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1'>" + (localize "STR_Cop_VehSpeed"), round _speed];
        };
    };
};
