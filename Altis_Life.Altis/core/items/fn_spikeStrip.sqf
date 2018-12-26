#include "..\..\script_macros.hpp"
/*
    File: fn_spikeStrip.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Creates a spike strip and preps it.
*/
private _spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;

life_action_spikeStripDeploy = player addAction[localize "STR_ISTR_Spike_Place",{detach life_spikeStrip; life_spikeStrip = objNull; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull life_spikestrip'];
life_spikestrip = _spikeStrip;

if (isNull _spikeStrip) exitWith { life_spikestrip = objNull; };

_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
_spikeStrip setDamage 1;

[false,"spikeStrip",1] call life_fnc_handleInv;

if (life_HC_isActive) then {
    [_spikeStrip] remoteExec ["HC_fnc_spikeStrip", HC_Life];
} else {
    [_spikeStrip] remoteExec ["TON_fnc_spikeStrip", RSERV];
};
