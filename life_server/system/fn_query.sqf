/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is a gateway to the SQF->MySQL Query function, it is sort of a 
	lazy blockage and adding untainable functions for the client to not take.
*/
private["_uid","_unit","_side","_ret","_ownerID"];
systemChat format["SERVER QUERY: %1",_this];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;

//Error checks
if(isNull _unit) exitWith {};

_uid = getPlayerUID _unit;
_ownerID = owner _unit;

_ret = [_uid,_side] call DB_fnc_query;
sleep 0.1;
if(typeName _ret != "ARRAY") then {_ret = [];};
[_ret,"life_fnc_sessionReceive",_ownerID,false] spawn BIS_fnc_MP;