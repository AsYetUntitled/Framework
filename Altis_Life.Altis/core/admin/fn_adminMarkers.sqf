#include "..\..\script_macros.hpp"
/*
	File: fn_adminMarkers.sqf
	Sourced from Lystics Player Markers Loop
	Author:

	Description:

*/
private["_PlayerMarkers","_FinishedLoop"];
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
life_markers = !life_markers;
if(!life_markersvaar) then {
	_PlayerMarkers = [];
	_FinishedLoop = false;
	life_markersvaar = true;
	hint localize "STR_ANOTF_MEnabled";
	while{life_markers} do {
		{
			if !(_x in allUnits) then {
				deleteMarkerLocal str _x;
			};
		} forEach _PlayerMarkers;
		_PlayerMarkers = [];
		{
			if(alive _x && isplayer _x && side _x == west && playerSide != west) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
				_pSee setMarkerColorLocal ("ColorBLUFOR");
				_PlayerMarkers = _PlayerMarkers + [_x];
			};
			if(alive _x && isplayer _x && side _x == independent) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
				_pSee setMarkerColorLocal ("ColorIndependent");
				_PlayerMarkers = _PlayerMarkers + [_x];
			};
			if(alive _x && isplayer _x && side _x == civilian) then {
				if(!(playerSide == civilian && _x in (units (group player)))) then {
					deleteMarkerLocal str _x;
					_pSee = createMarkerLocal [str _x,getPos _x];
					_pSee setMarkerTypeLocal "mil_triangle";
					_pSee setMarkerPosLocal getPos _x;
					_pSee setMarkerSizeLocal [1,1];
					_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
					_pSee setMarkerColorLocal ("ColorCivilian");
					_PlayerMarkers = _PlayerMarkers + [_x];
				};
			};
	} forEach allUnits;
	sleep 0.2;
};
_FinishedLoop = true;
} else {
	if(isNil "_FinishedLoop") exitWith {};
	hint localize "STR_ANOTF_MDisabled";
	life_markersvaar = false;
	waitUntil{_FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach _PlayerMarkers;
};
