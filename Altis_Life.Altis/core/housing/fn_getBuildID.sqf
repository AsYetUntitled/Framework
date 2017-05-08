/*
    File: fn_getBuildID.sqf
    Author: John "Paratus" VanderZwet

    Description:
    Returns the Object ID of a static building.
*/
private ["_build","_name","_start","_stop","_i","_char"];

_build = _this select 0;

_name = toArray (str (_build));
_start = false;
_stop = false;
_id = [];

for "_i" from 0 to ((count _name) - 1) do {
    _char = _name select _i;
    if (_char == 58) then {
        _stop = true;
    };
    if (_start && !_stop) then {
        _id pushBack _char;
    };
    if (_char == 35) then {
        _start = true;
    };
};

if (count _id > 1 ) then {
    _id set [0, -1];
    _id = _id - [-1];
    _id = toString (_id);
} else {
    _id = 0;
};

_id;