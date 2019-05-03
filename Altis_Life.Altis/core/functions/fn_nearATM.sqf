/*
    File: fn_nearATM.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz : for use with new command cursorObject

    Description:
    Checks if the player is near an ATM object on the map.

    RETURNS:
        0: BOOL (True for yes, false for no)
*/

private _obj = cursorObject;
private _return = false;

if ((str(_obj) find "atm_") != -1 && {player distance _obj < 2.3}) then { _return = true; };

_return;
