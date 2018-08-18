/*
    File : fn_sellHouseContainer.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Used in selling the house, container sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/

params [
    ["_container", objNull, [objNull]]
];

if (isNull _container) exitWith {};
_containerID = _container getVariable ["container_id",-1];

private "_query";

if (_containerID isEqualTo -1) then {
    _containerPos = getPosATL _container;
    private _ownerID = (_container getVariable "container_owner") select 0;
    _query = format ["deleteContainer:%1:%2", _ownerID, _containerPos];
} else {
    _query = format ["deleteContainer1:%1", _containerID];
};

_container setVariable ["container_id", nil, true];
_container setVariable ["container_owner", nil, true];
deleteVehicle _container;

[_query, 1] call HC_fnc_asyncCall;
["deleteOldContainers", 1] call HC_fnc_asyncCall;
