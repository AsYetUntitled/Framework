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

if (isNull _unit) exitWith {}; //Bad data

if (animationState _unit == "AovrPercMrunSrasWrflDf") exitWith {};

if (local _unit) then {
    private _v1 = 3.82;
    private _v2 = .4;
    private _dir = direction player;
    private _vel = velocity _unit;
    _unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
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
