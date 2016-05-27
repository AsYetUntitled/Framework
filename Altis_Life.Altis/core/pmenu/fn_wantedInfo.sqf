/*
    File: fn_wantedInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_bounty","_mylist","_data"];
disableSerialization;

_data = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_mylist = [];
_data = call compile format["%1", _data];
if (isNil "_data") exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
if (!(_data isEqualType [])) exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
if (_data isEqualTo []) exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
lbClear _list;

_crimes = _data select 0;

{
    _crime = _x;
    if (!(_crime in _mylist)) then
    {
        _mylist pushBack _crime;
        _list lbAdd format[localize "STR_Wanted_Count",{_x == _crime} count _crimes,localize _crime];
    };
} forEach _crimes;

ctrlSetText[2403,format[localize "STR_Wanted_Bounty",[(_data select 1)] call life_fnc_numberText]];
