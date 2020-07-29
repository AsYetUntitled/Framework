/*
    File: fn_radar.sqf
    Author: Silly Aussie kid named Jaydon

    Description:
    Radar
*/

if !(playerSide isEqualTo west) exitWith {};

private _vehicle = cursorObject;
if (_vehicle isKindOf "Car" && {currentWeapon player isEqualTo "hgun_P07_snds_F"}) then {
    private _speed = round speed _vehicle;

    if (_speed > 80) then {
        hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" + (localize "STR_Cop_Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1'>" + (localize "STR_Cop_VehSpeed"), _speed];
    } else {
        if (_speed > 33) then {
            hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>" + (localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1'>" + (localize "STR_Cop_VehSpeed"), _speed];
        };
    };
};
