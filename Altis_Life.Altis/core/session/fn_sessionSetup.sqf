/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_sessionSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the setup process for the player retrieving their saved
	information from the server, the player will not ever fully initializing
	without this process being completed.
*/
waitUntil {!isNull player && player == player};
private["_unit"];
_unit = player;
cutText["Contacting server for player information...","BLACK FADED"];
0 cutFadeOut 9999999;
[[_unit,playerSide],"STS_fnc_query",false,false] spawn BIS_fnc_MP;