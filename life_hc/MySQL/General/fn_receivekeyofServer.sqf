#include "\life_hc\hc_macros.hpp"
/*
	File: fn_receivekeyofServer.sqf
	Author: NiiRoZz

	This file is for Nanou's HeadlessClient.

	Description:
	Recup the key of player when reconnect
*/
private["_keyArr","_uid","_side"];
_keyArr = _this select 0;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //NULL
life_keyreceivedvar = _keyArr;
life_keyreceived = true;
