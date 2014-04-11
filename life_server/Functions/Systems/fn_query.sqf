/*
	File: fn_query.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is a gateway to the SQF->MySQL Query function.
*/
private["_uid","_unit","_side","_ret","_ownerID"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_uid = [_this,2,"",[""]] call BIS_fnc_param;

//Error checks
if(isNull _unit OR _uid == "") exitWith 
{
	if(!isNull _unit) then
	{
		_ownerID = owner _unit;
		["Either your player was null or your PlayerID sent was invalid. Try re-logging in.","life_fnc_sessionReceive",_ownerID,false] spawn life_fnc_MP;
	};
};

_ownerID = owner _unit;

//Is the headless client active? If so let him take over.
if(!isNil "hc_1" && {life_HC_isActive}) exitWith {
	private["_packet"];
	_packet = [_unit,_side,_uid,_ownerID];
	[_packet,"HC_fnc_query",(owner hc_1),FALSE] spawn BIS_fnc_MP;
};

_ret = [_uid,_side] call DB_fnc_query;
waitUntil {typeName _ret == "ARRAY" OR typeName _ret == "STRING" OR isNil "_ret"};

if(!isNil "_ret") then
{
	[_ret,"life_fnc_sessionReceive",_ownerID,false] spawn life_fnc_MP;
}
	else
{
	[nil,"life_fnc_sessionReceive",_ownerID,false] spawn life_fnc_MP;
};