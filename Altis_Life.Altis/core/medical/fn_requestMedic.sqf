#include "..\..\script_macros.hpp"
/*
    File: fn_requestMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    N/A
*/
private "_medicsOnline";
_medicsOnline = {_x != player && {side _x isEqualTo independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

life_corpse setVariable ["Revive",false,true]; //Set the corpse to a revivable state.
if (_medicsOnline) then {
    //There is medics let's send them the request.
    [life_corpse,profileName] remoteExecCall ["life_fnc_medicRequest",independent];
} else {
    //No medics were online, send it to the police.
    [life_corpse,profileName] remoteExecCall ["life_fnc_medicRequest",west];
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn  {
    ((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
    sleep (2 * 60);
    ((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};
