/*
    File: fn_keyGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a copy of the key for the selected vehicle to the selected player.
*/
disableSerialization;

private _dialog = findDisplay 2700;
private _list = _dialog displayCtrl 2701;
private _pList = _dialog displayCtrl 2702;

private _vehIndex = lbCurSel _list;
if (_vehIndex isEqualTo -1) exitWith {hint localize "STR_NOTF_didNotSelectVehicle"};
private _playerIndex = lbCurSel _pList;
if (_playerIndex isEqualTo -1) exitWith {hint localize "STR_NOTF_didNotSelectPlayer"};

private _vehicle = life_vehicles select (_list lbValue _vehIndex);
private _unit = call compile format ["%1", (_pList select _playerIndex)];
if (isNil "_unit" || {isNull _unit}) exitWith {};

private _uid = getPlayerUID _unit;
private _owners = _vehicle getVariable "vehicle_info_owners";
private _insertedIndex = _owners pushBackUnique [_uid,_unit getVariable ["realname",name _unit]];

if (_insertedIndex != -1) then {
    _vehicle setVariable ["vehicle_info_owners",_owners,true];
};

hint format [localize "STR_NOTF_givenKeysTo",_unit getVariable ["realname",name _unit],typeOf _vehicle];
[_vehicle,profileName] remoteExecCall ["life_fnc_clientGetKey",_unit];
