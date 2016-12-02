/*
    File: fn_levelCheck.sqf
    Author: BoGuu

    Description:
    xx
*/

if !(params [["_itemConfig", [], [[],""]]]) exitWith {};

scopeName "main";

private _return = false;

if (_itemConfig isEqualTo []) exitWith {diag_log localize "STR_NOTF_emptyArray_levelCheck"; _return};

if (_itemConfig isEqualType []) then {
    private _lastElement = _itemConfig select (count _itemConfig - 1);
    if (_lastElement isEqualType "") then {
        _itemConfig = _lastElement;
    } else {
        true breakOut "main";
    };
};

if (_itemConfig isEqualTo "") exitWith {true};

private _evaluation = call compile _itemConfig;

if (_evaluation isEqualType true) then {
    if (_evaluation) then {
        _return = true;
    };
} else {
    _return = true;
};

_return;
