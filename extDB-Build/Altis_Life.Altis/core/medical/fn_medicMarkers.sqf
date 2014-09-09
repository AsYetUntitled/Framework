/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units"];
_markers = [];
_units = [];

sleep 0.25;
if(visibleMap) then {
	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then {
			_units pushBack _x;
		};
	} foreach allDeadMen;
	
	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers pushBack _marker;
	} foreach _units;
	
	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};