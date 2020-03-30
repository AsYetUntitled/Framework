#include "..\..\script_macros.hpp"
/*
    File: fn_adminSpectate.sqf
    Author: ColinM9991

    Description:
    Spectate the chosen player.
*/
if (FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0;};

private _unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format ["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

closeDialog 0;

_unit switchCamera "INTERNAL";
hint format [localize "STR_NOTF_nowSpectating",_unit getVariable ["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit]; player switchCamera 'INTERNAL'; hint localize 'STR_NOTF_stoppedSpectating';}; false"];
