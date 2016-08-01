#include "..\..\script_macros.hpp"
/*
    File: fn_levelCheck.sqf
    Author: BoGuu

    Description:
    Level check function for the weapon config.
    WIP - Other shop configs
*/

private "_return";
_itemConfig = param [0, [], []];

_return = false;

if (_itemConfig isEqualTo []) exitWith {diag_log "An empty array was passed to fn_levelCheck.sqf"; _return};

if (count _itemConfig isEqualTo 5) then {
            
    _levelArray = _itemConfig param [4,[],[]];
    _levelName = _levelArray select 0;
    _levelType = _levelArray select 1;
    _levelValue = _levelArray select 2;
    if !(_levelValue isEqualTo -1) then {
        _level = missionNamespace getVariable _levelName;
        if (typeName _level isEqualTo "CODE") then {_level = FETCH_CONST(_level);};
        _return = switch(_levelType) do {
            case "SCALAR": {_level >= _levelValue};
            case "BOOL": {_level};
            case "EQUAL": {_level isEqualTo _levelValue};
            default {false};
        };
    } else {
        _return = true;
    };
} else {
    _return = true;
};

_return;
