/*
	File: fn_gangManagement.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for the gang 'management' menu.
*/
private["_sleep","_group","_gang","_owner","_ownerID","_units","_dialog","_members"];
disableSerialization;

_sleep = [_this,0,false,[false]] call BIS_fnc_param;
if(_sleep) then { sleep 1;};

_group = life_my_gang;
if(isNull _group) exitWith {closeDialog 0;};
_gang = [_group,life_gang_list] call fnc_index;
_gang = life_gang_list select _gang;
_owner = call compile format["%1",_gang select 3];
_ownerID = _gang select 4;
_units = units (group player);
waitUntil {!isNull (findDisplay 2620)};
_dialog = findDisplay 2620;
_members = _dialog displayCtrl 2621;

lbClear _members;

switch (true) do
{
	case (player == leader(group player)) :
	{
		if((_gang select 2)) then
		{
			ctrlShow[2622,false];
			ctrlShow[2623,true];
		}
			else
		{
			ctrlShow[2622,true];
			ctrlShow[2623,false];
		};
	};
	
	case ((getPlayerUID player) == _ownerID) :
	{
		if((_gang select 2)) then
		{
			ctrlShow[2622,false];
			ctrlShow[2623,true];
		}
			else
		{
			ctrlShow[2622,true];
			ctrlShow[2623,false];
		};
	};
	
	default
	{
		ctrlShow[2622,false];
		ctrlShow[2623,false];
		ctrlShow[2624,false];
		ctrlShow[2625,false];
	};
};

ctrlSetText[601,(_gang select 0)];

for "_i" from 0 to (count _units)-1 do
{
	switch (true) do
	{
		case ((_units select _i) == leader(group player)) :
		{
			_members lbAdd format["%1 [Leader]",name (_units select _i)];
		};
		
		case ((getPlayerUID (_units select _i)) == _ownerID) :
		{
			_members lbAdd format["%1 [Founder]", name (_units select _i)];
		};
		
		default 
		{
			_members lbAdd format["%1",name (_units select _i)];
		};
	};
	
	_members lbSetData [(lbSize _members)-1,str(_units select _i)];
};