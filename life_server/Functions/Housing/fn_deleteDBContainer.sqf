/*
    File : fn_deleteDBContainer.sqf
    Author: NiiRoZz

    Description:
    Delete Container and remove Container in Database
*/
params [
    ["_container",objNull,[objNull]]
];
if (isNull _container) exitWith  {diag_log "container null";};

private _containerID = _container getVariable ["container_id",-1];
if (_containerID isEqualTo -1) then {
    private _containerPos = getPosATL _container;
    private _ownerID = (_container getVariable "container_owner") select 0;
    private _query = format ["UPDATE containers SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND owned='1'",_ownerID,_containerPos];
} else {
    private _query = format ["UPDATE containers SET owned='0', pos='[]' WHERE id='%1'",_containerID];
};
_container setVariable ["container_id",nil,true];
_container setVariable ["container_owner",nil,true];

[_query,1] call DB_fnc_asyncCall;

["CALL deleteOldContainers",1] call DB_fnc_asyncCall;
deleteVehicle _container;
