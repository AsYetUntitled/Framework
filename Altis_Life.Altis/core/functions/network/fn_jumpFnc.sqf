/*
    File: fn_jumpFnc.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Makes the target jump.
*/
params [
    ["_unit",objNull,[objNull]]
];
private _oldpos = getPosATL _unit;

if (isNull _unit || {animationState _unit == "AovrPercMrunSrasWrflDf"}) exitWith {};

if (local _unit) then {
    _v1 = 3.82;
    _v2 = .4;
    _dir = direction player;
    (velocity _unit) params ["_xVel","_yVel","_zVel"];
    _unit setVelocity[_xVel + (sin _dir*_v2),_yVel + (cos _dir*_v2),_zVel + _v1];
};

private _anim = animationState _unit;
_unit switchMove "AovrPercMrunSrasWrflDf";

if (local _unit) then {
    waitUntil {
        if ((getPos _unit select 2) > 4) then {
            _unit setposATL _oldpos;
            _unit setVelocity [0, 0, 0];
        };
        animationState _unit != "AovrPercMrunSrasWrflDf"
    };
    _unit switchMove _anim;
};
