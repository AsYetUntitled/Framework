#include <macro.h>
/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash","_victim","_robber"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
_victim = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_robber = [_this,2,objNull,[objNull]] call BIS_fnc_param;
if(_robber == _victim) exitWith {};
if(EQUAL(_cash,0)) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

ADD(CASH,_cash);
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];