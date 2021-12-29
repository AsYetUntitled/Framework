#include "..\..\script_macros.hpp"
/*
    File: fn_deploySpikes.sqf
    Author: DomT602

    Description:
    Deploys a spike strip
*/

if (isNull life_spikeStrip) exitWith {};
private _spikeStrip = life_spikeStrip;
life_spikeStrip = objNull;

detach _spikeStrip;
private _pos = getPosASL _spikeStrip;
private _intersects = lineIntersectsSurfaces [_pos,_pos vectorAdd [0,0,-50],_spikeStrip,objNull,true,1,"GEOM","NONE"];
_intersects params ["_firstObjectData"];
_firstObjectData params ["_posASL","_surfaceNormal"];
_spikeStrip setPosASL _posASL;
_spikeStrip setVectorUp _surfaceNormal;
_spikeStrip setVariable ["item","spikeDeployed",true]; //only set this once deployed to prevent others picking up

player removeAction life_action_spikeStripDeploy;
life_action_spikeStripDeploy = nil;

if (life_HC_isActive) then {
    [_spikeStrip] remoteExec ["HC_fnc_spikeStrip",HC_Life];
} else {
    [_spikeStrip] remoteExec ["TON_fnc_spikeStrip",RSERV];
};
