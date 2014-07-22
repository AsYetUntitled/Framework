/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;

_query = format["INSERT INTO houses (pid, pos, inventory, containers, owned) VALUES('%1', '%2', '""[[],0]""', '""[]""', '1')",_uid,_housePos];
diag_log format["Query: %1",_query];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

sleep 0.3;
waitUntil{!DB_Async_Active};
_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1'",_housePos,_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format["House ID assigned: %1",_queryResult select 0];
_house setVariable["house_id",(_queryResult select 0),true];