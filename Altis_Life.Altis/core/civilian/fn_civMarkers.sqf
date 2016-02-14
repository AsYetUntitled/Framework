/*
	File: fn_civMarkers.sqf
	Author: 

	Description:
	Add markers for civilians in groups.
*/
private["_markers","_members"];
_markers = [];
_members = [];

while {true} do
{
	sleep 0.5;
	if(visibleMap) then
	{
		_members = units (group player);
		{
			if(_x != player) then {
				_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				_marker setMarkerColorLocal "ColorCivilian";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
				_markers pushBack [_marker,_x];
			};
		} foreach _members;

		while {visibleMap} do
		{
			{
				private["_marker","_unit"];
				_marker = _x select 0;
				_unit = _x select 1;
				if(!isNil "_unit" && !isNull _unit) then {
					  _marker setMarkerPosLocal (visiblePosition _unit);
				};
			} foreach _markers;
			if(!visibleMap) exitWith {};
			sleep 0.02;
		};

		{deleteMarkerLocal (_x select 0);} foreach _markers;
		_markers = [];
		_members = [];
	};
};
