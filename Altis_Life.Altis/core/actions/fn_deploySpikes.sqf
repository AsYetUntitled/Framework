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
private _pos = getPosATL _spikeStrip;
_pos set [2,0];
_spikeStrip setPosATL _pos;
_spikeStrip setDamage 1;

player removeAction life_action_spikeStripDeploy;
life_action_spikeStripDeploy = nil;

if (life_HC_isActive) then {
    [_spikeStrip] remoteExec ["HC_fnc_spikeStrip",HC_Life]; //Send it to the HeadlessClient for monitoring.
} else {
    [_spikeStrip] remoteExec ["TON_fnc_spikeStrip",RSERV]; //Send it to the server for monitoring.
};
