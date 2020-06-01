#include "..\..\script_macros.hpp"
/*
    File: fn_copSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Returns information on the search.
*/

life_action_inUse = false;

params [
    ["_civ",objNull,[objNull]],
    ["_invs",[],[[]]],
    ["_robber",false,[false]]
];

if (isNull _civ) exitWith {};

private _inv = "";
if (count _invs > 0) then {
    private _illegal = 0;
    {
        _x params ["_var", "_count"];

        private _displayName = M_CONFIG(getText,"VirtualItems", _var, "displayName");
        _inv = _inv + format ["%1 %2<br/>", _count, _displayName];
        private _price = M_CONFIG(getNumber,"VirtualItems", _var, "sellPrice");
        if (!isNull (missionConfigFile >> "VirtualItems" >> _var >> "processedItem")) then {
            private _processed = M_CONFIG(getText,"VirtualItems", _var, "processedItem");
            _price = M_CONFIG(getNumber,"VirtualItems", _processed, "sellPrice");
        };

        if !(_price isEqualTo -1) then {
            _illegal = _illegal + (_count * _price);
        };
        true
    } count _invs;
    if (_illegal > 6000) then {

        if (life_HC_isActive) then {
            [getPlayerUID _civ,_civ getVariable ["realname",name _civ],"482"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _civ,_civ getVariable ["realname",name _civ],"482"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

    };

    if (life_HC_isActive) then {
        [getPlayerUID _civ,_civ getVariable ["realname",name _civ],"481"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
    } else {
        [getPlayerUID _civ,_civ getVariable ["realname",name _civ],"481"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    };

    [0,"STR_Cop_Contraband",true,[(_civ getVariable ["realname",name _civ]),[_illegal] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
} else {
    _inv = localize "STR_Cop_NoIllegal";
};

if (!alive _civ || {player distance _civ > 5}) exitWith {
    hint format [localize "STR_Cop_CouldntSearch",_civ getVariable ["realname",name _civ]]
};

hint parseText format ["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" + (localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>",
(_civ getVariable ["realname",name _civ]), _inv, ["", "Robbed the bank"] select _robber];

if (_robber) then {
    [0,"STR_Cop_Robber",true,[_civ getVariable ["realname",name _civ]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};
