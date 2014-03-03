/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

//Make NPC's to normal stance..
{
	if(!isPlayer _x) then {
		_x switchMove "";
	};
} foreach allUnits;