/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the storage for a house blah blah
*/
private["_house"];
_container = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {diag_log format["Oups1"];};

_trunkData = _container getVariable["Trunk",[[],0]];
_containerID = _container getVariable["container_id",-1];

if(_containerID == -1) exitWith {diag_log format["Oups2"];}; //Dafuq?

_trunkData = [_trunkData] call DB_fnc_mresArray;
_query = format["UPDATE containers SET inventory='%1' WHERE id='%2'",_trunkData,_containerID];
diag_log format["Query House Trunk: %1",_query];

[_query,1] call DB_fnc_asyncCall;
