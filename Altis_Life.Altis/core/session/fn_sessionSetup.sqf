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
cutText["Contacting server for player information...","BLACK FADED"];
0 cutFadeOut 9999999;
[[player,playerSide,getPlayerUID player],"TON_fnc_query",false,false] spawn life_fnc_MP;