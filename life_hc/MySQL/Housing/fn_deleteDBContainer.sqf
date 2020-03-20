/*
    File : fn_deleteDBContainer.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Delete Container and remove Container in Database
*/

params [
    ["_container", objNull, [objNull]]
];

if (isNull _container) exitWith  {diag_log "container null";};
_containerID = _container getVariable ["container_id", -1];

private "_query";

if (_containerID isEqualTo -1) then {
    _containerPos = getPosATL _container;
    private _ownerID = (_container getVariable "container_owner") select 0;
    _query = format ["deleteContainer:%1:%2", _ownerID, _containerPos];
} else {
    _query = format ["deleteContainer1:%1",_containerID];
};
_container setVariable ["container_id", nil, true];
_container setVariable ["container_owner", nil, true];

[_query, 1] call HC_fnc_asyncCall;

["deleteOldContainers", 1] call HC_fnc_asyncCall;
deleteVehicle _container;
