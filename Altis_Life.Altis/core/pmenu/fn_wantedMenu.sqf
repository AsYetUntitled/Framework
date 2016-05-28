#include "..\..\script_macros.hpp"
/*
    File: fn_wantedMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_list2","_name","_crimes","_bounty","_units"];
disableSerialization;

if (playerSide != west) exitWith {}; // Only for cops open this menu

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch (side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} forEach playableUnits;

_list2 = CONTROL(2400,2407);
lbClear _list2; //Purge the list

_crimes = LIFE_SETTINGS(getArray,"crimes");
{
  if (isLocalized (_x select 0)) then {
    _list2 lbAdd format["%1 - $%2 (%3)",localize (_x select 0),(_x select 1),(_x select 2)];
  } else {
    _list2 lbAdd format["%1 - $%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
  };
    _list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} forEach _crimes;

ctrlSetText[2404,"Establishing connection..."];

if (FETCH_CONST(life_coplevel) < 3 && FETCH_CONST(life_adminlevel) isEqualTo 0) then {
    ctrlShow[2405,false];
};

if (life_HC_isActive) then {
    [player] remoteExec ["HC_fnc_wantedFetch",HC_Life];
} else {
    [player] remoteExec ["life_fnc_wantedFetch",RSERV];
};
