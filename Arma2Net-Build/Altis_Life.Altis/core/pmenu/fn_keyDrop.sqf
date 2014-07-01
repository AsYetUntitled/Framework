/*
	File: fn_keyDrop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Drops the key.
*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "No Data Selected";};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_vehicles select _index;
_impounded = if(_vehicle distance impound_obj < 50) then {true} else {false};
_owners = _vehicle getVariable "vehicle_info_owners";

if(_impounded) then
{
	if((getPlayerUID player) == (_owners select 0) select 0) then
	{
		life_vehicles = life_vehicles - [_vehicle];
		deleteVehicle _vehicle;
	}
		else
	{
		_index2 = [(getPlayerUID player),_owners] call fnc_index;
		life_vehicles = life_vehicles - [_vehicle];
		_owners set[_index,-1];
		_owners = _owners - [-1];
		_vehicle setVariable["vehicle_info_owners",_owners,true];
	};
}
	else
{
	_index2 = [(getPlayerUID player),_owners] call fnc_index;
	life_vehicles = life_vehicles - [_vehicle];
	_owners set[_index,-1];
	_owners = _owners - [-1];
	_vehicle setVariable["vehicle_info_owners",_owners,true];
};

[] spawn life_fnc_keyMenu;