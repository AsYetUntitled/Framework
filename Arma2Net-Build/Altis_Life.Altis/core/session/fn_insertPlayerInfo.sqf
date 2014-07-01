/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
cutText["The server didn't find any player information matching your UID, attempting to add player to system.","BLACK FADED"];
0 cutFadeOut 9999999;

[[getPlayerUID player,player getVariable["realname",name player],life_cash,life_atmcash,player],"DB_fnc_insertRequest",false,false] spawn life_fnc_MP;