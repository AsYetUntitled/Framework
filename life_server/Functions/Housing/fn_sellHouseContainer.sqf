/*
    File : fn_sellHouseContainer.sqf
    Author: NiiRoZz

    Description:
    Used in selling the house, container sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/
private["_house","_houseID","_ownerID","_housePos","_query","_radius","_containers"];
_container = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _container) exitWith {};

_containerID = _container getVariable["container_id",-1];
if (_containerID isEqualTo -1) then {
    _containerPos = getPosATL _container;
    _ownerID = (_container getVariable "container_owner") select 0;
    _query = format["UPDATE containers SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_containerPos];
} else {
    _query = format["UPDATE containers SET owned='0', pos='[]' WHERE id='%1'",_containerID];
};

_container setVariable["container_id",nil,true];
_container setVariable["container_owner",nil,true];
deleteVehicle _container;

[_query,1] call DB_fnc_asyncCall;
["CALL deleteOldContainers",1] call DB_fnc_asyncCall;
