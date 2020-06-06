#include "..\..\script_macros.hpp"
/*
    File: fn_wantedMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the Wanted menu and connects to the APD.
*/
disableSerialization;

if !(playerSide isEqualTo west) exitWith {}; // Only for cops open this menu

createDialog "life_wanted_menu";

private _display = findDisplay 2400;
private _list = _display displayCtrl 2401;
private _players = _display displayCtrl 2406;
private _units = [];

lbClear _list;
lbClear _players;

{
    private _side = switch (side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format ["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} forEach playableUnits;

private _list2 = CONTROL(2400,2407);
lbClear _list2; //Purge the list

private _crimes = LIFE_SETTINGS(getArray,"crimes");
{
    _x params [
        "_name",
        "_bounty",
        "_code"
    ];

    private _id = _list2 lbAdd format ["%1 - $%2 (%3)",_name,_bounty,_code];
    _list2 lbSetData [_id, _code];
} forEach _crimes;

ctrlSetText[2404,"Establishing connection..."];

if (FETCH_CONST(life_coplevel) < 3 && {FETCH_CONST(life_adminlevel) isEqualTo 0}) then {
    ctrlShow[2405,false];
};

if (life_HC_isActive) then {
    [player] remoteExec ["HC_fnc_wantedFetch",HC_Life];
} else {
    [player] remoteExec ["life_fnc_wantedFetch",RSERV];
};
