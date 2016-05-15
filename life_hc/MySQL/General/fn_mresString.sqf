/*
    File: fn_mresString.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Makes the string safe to be passed to MySQL (strips various stuff).
*/
private["_string","_filter"];
_string = [_this,0,"",[""]] call BIS_fnc_param;
_filter = "'/\`:|;,{}-""<>";

_string = toArray _string; //Blow it up to an array
_filter = toArray _filter; //Blow it up to an array

{
    if (_x in _filter) then {
        _string deleteAt _forEachIndex;
    };
} forEach _string;

toString _string;
