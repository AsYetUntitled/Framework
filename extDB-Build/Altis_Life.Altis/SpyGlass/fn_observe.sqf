/*
	File: fn_observe.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is the observation part of SPY-GLASS, it reports to the RPT log
	of unusual activity by the player.
*/
private["_pName","_pUID","_pReason"];
_pName = [_this,0,"",[""]] call BIS_fnc_param;
_pUID = [_this,1,"",[""]] call BIS_fnc_param;
_pReason = [_this,2,"",[""]] call BIS_fnc_param;

if(_pName == "" OR _pUID == "" OR _pReason == "") exitWith {}; //Bad params passed..

diag_log format["||SPY-GLASS Observes|| Name: %1 | UID: %2 | Reason: %3",_pName,_pUID,_pReason]; //Outputs to RPT for external programs to parse,log,react to.