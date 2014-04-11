/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units"];
_markers = [];
_units = [];

sleep 0.35;
if(visibleMap) then {
	{
		if(!isNil {(_x getVariable "name")} && {!(_x getVariable ["Revive",FALSE])}) then 
		{
			_units set[count _units,_x]
		};
	} foreach allDeadMen;
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers set[count _markers,[_marker,_x]];
	} foreach _units;
		
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_cops = [];
};