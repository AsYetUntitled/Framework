/*
    File: fn_vehicleDelete.sqf
    Author: Bryan "Tonic" Boardwine

    This file is for Nanou's HeadlessClient.

    Description:
    Doesn't actually delete since we don't give our DB user that type of
    access so instead we set it to alive=0 so it never shows again.
*/
diag_log "Script VehicleDelete HC";
private ["_vid","_sp","_pid","_query","_sql","_type","_thread"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,2500,[0]] call BIS_fnc_param;
_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param;
_type = [_this,4,"",[""]] call BIS_fnc_param;

if (_vid isEqualTo -1 || _pid isEqualTo "" || _sp isEqualTo 0 || isNull _unit || _type isEqualTo "") exitWith {};

_query = format ["UPDATE vehicles SET alive='0' WHERE pid='%1' AND id='%2'",_pid,_vid];

_thread = [_query,1] call HC_fnc_asyncCall;
