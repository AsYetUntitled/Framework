#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
/*
	File: initPlayerServer.sqf
	Author:

	Description:
	Executed only on server when a player joins mission.
*/
if(EQUAL(LIFE_SETTINGS(getNumber,"player_deathLog"),0)) exitWith {};

_this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneit}];
