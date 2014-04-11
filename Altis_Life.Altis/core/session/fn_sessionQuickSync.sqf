/*
	File: fn_sessionQuickSync.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends a silent but forceful sync, this syncs the cash,bank and gear.
*/
private["_packet"];
_packet = [getPlayerUID player,playerSide,life_cash,life_atmcash];

switch(playerSide) do
{
	case west: {
		[] call life_fnc_saveGear;
		_gear = cop_gear;
		_packet set[count _packet,_gear];
	};
	
	case civilian: {
		[] call life_fnc_civFetchGear;
		_packet set[count _packet,civ_gear];
	};
};

[_packet,"TON_fnc_silentSync",FALSE,FALSE] call life_fnc_MP;