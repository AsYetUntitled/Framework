/*
    File: fn_wantedBounty.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Checks if the person is on the bounty list and awards the cop for killing them.
*/
private["_civ","_cop","_id","_half","_result","_queryResult","_amount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_civ = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_cop = [_this,2,objNull,[objNull]] call BIS_fnc_param;
_half = [_this,3,false,[false]] call BIS_fnc_param;
if (isNull _civ || isNull _cop) exitWith {};

_query = format["SELECT wantedID, wantedName, wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (count _queryResult != 0) then {
    _amount = _queryResult select 3;
    if (_amount != 0) then {
        if (_half) then {
            [((_amount) / 2),_amount] remoteExecCall ["life_fnc_bountyReceive",(owner _cop)];
        } else {
            [_amount,_amount] remoteExecCall ["life_fnc_bountyReceive",(owner _cop)];
        };
    };
};
