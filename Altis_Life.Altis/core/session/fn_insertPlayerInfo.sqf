#include "..\..\script_macros.hpp"
/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;

if(life_HC_isActive) then {
	[getPlayerUID player,profileName,CASH,BANK,player] remoteExecCall ["HC_fnc_insertRequest",HC_Life];
} else {
	[getPlayerUID player,profileName,CASH,BANK,player] remoteExecCall ["DB_fnc_insertRequest",RSERV];
};