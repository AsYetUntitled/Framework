/*
    File: fn_keyDrop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Drops the key.
*/
disableSerialization;

private _dialog = findDisplay 2700;
private _list = _dialog displayCtrl 2701;
private _sel = lbCurSel _list;
if (_sel isEqualTo -1) exitWith {hint localize "STR_NOTF_noDataSelected";};
if ((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
private _index = (parseNumber(_list lbData _sel));
private _vehicle = life_vehicles select _index;
if (_vehicle isKindOf "House_F") exitWith {hint localize "STR_NOTF_cannotRemoveHouseKeys";};
private _owners = _vehicle getVariable "vehicle_info_owners";

private _index2 = [(getPlayerUID player),_owners] call TON_fnc_index;
life_vehicles = life_vehicles - [_vehicle];
_owners deleteAt _index;
_vehicle setVariable ["vehicle_info_owners",_owners,true];

[] spawn life_fnc_keyMenu;
