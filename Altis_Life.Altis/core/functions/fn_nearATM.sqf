/*
    File: fn_nearATM.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz : for use with new command cursorObject

    Description:
    Checks if the player is near an ATM object on the map.

    RETURNS:
        0: BOOL (True for yes, false for no)
*/
private ["_objs","_return"];
_obj = cursorObject;
_return = false;

if ((["atm_",str(_obj)] call BIS_fnc_inString) && player distance _obj < 2.3) then {_return = true;};

_return;
