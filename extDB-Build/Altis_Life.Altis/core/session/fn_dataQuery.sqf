/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;
cutText[format["Sending request to server for player information UID [%1]",_uid],"BLACK FADED"];
0 cutFadeOut 999999999;

[[_uid,_side,_sender],"DB_fnc_queryRequest",false,false] call life_fnc_MP;