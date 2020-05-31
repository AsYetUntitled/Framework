/*
    File: fn_wantedBounty.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    This file is for Nanou's HeadlessClient.

    Description:
    Checks if the person is on the bounty list and awards the cop for killing them.
*/

params [
    ["_uid","",[""]],
    ["_civ",objNull,[objNull]],
    ["_cop",objNull,[objNull]],
    ["_half",false,[false]]
];

if (isNull _civ || isNull _cop) exitWith {};

private _query = format ["selectWanted:%1", _uid];
private _queryResult = [_query,2] call HC_fnc_asyncCall;

private "_amount";
if !(_queryResult isEqualTo []) then {
    _amount = _queryResult param [3];
    if !(_amount isEqualTo 0) then {
        if (_half) then {
            [((_amount) / 2),_amount] remoteExecCall ["life_fnc_bountyReceive", _cop];
        } else {
            [_amount,_amount] remoteExecCall ["life_fnc_bountyReceive", _cop];
        };
    };
};
