#include "..\..\script_macros.hpp"
/*
    File: fn_questionDealer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Questions the drug dealer and sets the sellers wanted.
*/

params [
    ["_dealer", objNull, [objNull]]
];

private _sellers = _dealer getVariable ["sellers", []];

if (_sellers isEqualTo []) exitWith {
    hint localize "STR_Cop_DealerQuestion"
};

life_action_inUse = true;
private _crimes = LIFE_SETTINGS(getArray,"crimes");

private _names = "";
{
    _x params ["_uid","_name","_value"];
    private _val = 0;
    if (_value > 150000) then {
        _val = round(_value / 16);
    } else {
        _val = ["483",_crimes] call life_util_fnc_index;
        _val = ((_crimes select _val) select 1);
        if (_val isEqualType "") then {
            _val = parseNumber _val;
        };
    };
    [_uid,_name,"483",_val] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    _names = _names + format ["%1<br/>",_name];

    true
} count _sellers;

hint parseText format [(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
_dealer setVariable ["sellers",[],true];
life_action_inUse = false;
