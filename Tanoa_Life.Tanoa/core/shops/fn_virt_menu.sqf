#include "..\..\script_macros.hpp"
/*
    File: fn_virt_menu.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Initialize the virtual shop menu.
*/

params [
    ["_shopNPC", objNull, [objNull]],
    "",
    "",
    ["_shopType", "", [""]]
];

if (isNull _shopNPC || {_shopType isEqualTo ""}) exitWith {};

private _shopSide = M_CONFIG(getText,"VirtualShops",_shopType,"side");

life_shop_type = _shopType;
life_shop_npc = _shopNPC;

private _exit = false;

if !(_shopSide isEqualTo "") then {
    private _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

private _conditions = M_CONFIG(getText,"VirtualShops",_shopType,"conditions");

if !([_conditions] call life_fnc_levelCheck) exitWith {hint localize "STR_Shop_Veh_NotAllowed";};

createDialog "shops_menu";

[] call life_fnc_virt_update;
