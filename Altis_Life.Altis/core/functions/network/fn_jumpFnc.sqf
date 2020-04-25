/*
    File: fn_jumpFnc.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Makes the target jump.
*/

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {};
if (animationState _unit == "AovrPercMrunSrasWrflDf") exitWith {};

private _oldPos = getPosATL _unit;

if (local _unit) then {
    private _v1 = 3.82;
    private _v2 = .4;
    private _dir = direction _unit;
    (velocity _unit) params ["_xVel","_yVel","_zVel"];
    _unit setVelocity [_xVel + (sin _dir*_v2), _yVel + (cos _dir*_v2), _zVel + _v1];
};

private _anim = animationState _unit;
_unit switchMove "AovrPercMrunSrasWrflDf";

if (local _unit) then {
    waitUntil {
        if ((getPos _unit select 2) > 4) then {
            _unit setPosATL _oldPos;
            _unit setVelocity [0, 0, 0];
        };
        animationState _unit != "AovrPercMrunSrasWrflDf"
    };
    _unit switchMove _anim;
};
