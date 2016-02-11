#include "..\..\script_macros.hpp"
/*
	File: fn_adminMarkers.sqf
	Sourced from Lystics Player Markers Loop
*/
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
life_markers = !life_markers;
if(life_markers) then {
	PlayerMarkers = [];
	FinishedLoop = false;
	hint localize "STR_ANOTF_MEnabled";
	while{life_markers} do {
		{
			if !(_x in allUnits) then {
				deleteMarkerLocal str _x;
			};
		} forEach PlayerMarkers;
		PlayerMarkers = [];
		{
			if(alive _x && isplayer _x && side _x == west && playerSide != west) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
				_pSee setMarkerColorLocal ("ColorBLUFOR");
				PlayerMarkers = PlayerMarkers + [_x];
			};
			if(alive _x && isplayer _x && side _x == independent) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
				_pSee setMarkerColorLocal ("ColorIndependent");
				PlayerMarkers = PlayerMarkers + [_x];
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
					PlayerMarkers = PlayerMarkers + [_x];
				};
			};
	} forEach allUnits;
	sleep 0.2;
};
FinishedLoop = true;
} else {
	if(isNil "FinishedLoop") exitWith {};
	hint localize "STR_ANOTF_MDisabled";
	waitUntil{FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach PlayerMarkers;	
};
