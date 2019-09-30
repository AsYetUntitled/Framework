/*
    File : fn_sellHouseContainer.sqf
    Author: NiiRoZz

    Description:
    Used in selling the house, container sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/
params [
    ["_container",objNull,[objNull]]
];
if (isNull _container) exitWith {};

private _containerID = _container getVariable ["container_id",-1];
if (_containerID isEqualTo -1) then {
    private _containerPos = getPosATL _container;
    private _ownerID = (_container getVariable "container_owner") select 0;
    [format ["UPDATE containers SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_containerPos],1] call DB_fnc_asyncCall;
} else {
    [format ["UPDATE containers SET owned='0', pos='[]' WHERE id='%1'",_containerID],1] call DB_fnc_asyncCall;
};

_container setVariable ["container_id",nil,true];
_container setVariable ["container_owner",nil,true];
deleteVehicle _container;

["CALL deleteOldContainers",1] call DB_fnc_asyncCall;
