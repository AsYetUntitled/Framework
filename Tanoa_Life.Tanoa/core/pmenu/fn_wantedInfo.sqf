/*
    File: fn_wantedInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls back information about the wanted criminal.
*/
disableSerialization;

private _data = param [0,[],[[]]];
private _display = findDisplay 2400;
private _list = _display displayCtrl 2402;
private _mylist = [];

if (isNil "_data") exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
if !(_data isEqualType []) exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
if (_data isEqualTo []) exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};

lbClear _list;

private _crimes = _data select 0;

{
    _crime = _x;
    if !(_crime in _mylist) then {
        _mylist pushBack _crime;
        _list lbAdd format [localize "STR_Wanted_Count",{_x == _crime} count _crimes,localize _crime];
    };
} forEach _crimes;

ctrlSetText[2403,format [localize "STR_Wanted_Bounty",[(_data select 1)] call life_fnc_numberText]];