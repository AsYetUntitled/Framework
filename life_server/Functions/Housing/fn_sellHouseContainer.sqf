/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a
	stored procedure on restart.
*/
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_container = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {systemChat ":SERVER:sellHouse: Container is null";};

_containerID = _container getVariable["container_id",-1];
if(_houseID == -1) then {
	_containerPos = getPosATL _container;
	_ownerID = (_container getVariable "house_owner") select 0;
	_query = format["UPDATE containers SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_containerPos];
	//systemChat format[":SERVER:sellHouse: container_id does not exist"];
} else {
	//systemChat format[":SERVER:sellHouse: house_id is %1",_houseID];
	_query = format["UPDATE containers SET owned='0', pos='[]' WHERE id='%1'",_containerID];
};

_house setVariable["container_id",nil,true];
_house setVariable["container_owner",nil,true];
_radius = (((boundingBoxReal _container select 0) select 2) - ((boundingBoxReal _container select 1) select 2));
_containers = nearestObjects[(getPosATL _container),["Box_IND_Grenades_F","B_supplyCrate_F"],_radius];
{deleteVehicle _x} foreach _containers; //Fuck the way you do things Tonic, go fix it

[_query,1] call DB_fnc_asyncCall;
["CALL deleteOldContainers",1] call DB_fnc_asyncCall;
