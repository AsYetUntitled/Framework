/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	This is a gateway to the SQF->MySQL Query function, it is sort of a 
	lazy blockage and adding untainable functions for the client to not take.
*/
private["_unit","_side","_uid","_money","_bank","_uid","_misc","_licenses","_civGear"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_side = [_this,1,civilian,[sideUnknown]] call BIS_fnc_param;
_money = [_this,2,0,[0]] call BIS_fnc_param;
_bank = [_this,3,2500,[0]] call BIS_fnc_param;
_uid = [_this,4,"",[""]] call BIS_fnc_param;
_civGear = [_this,7,[],[[]]] call BIS_fnc_param;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
//Error check
if(isNull _unit OR _uid == "") exitWith {if(_uid == "" && !isNull _unit) then {diag_log format["%1 had a invalid UID.",name _unit];};};

_licenses = [_this,5,[],[[]]] call BIS_fnc_param;

switch (_side) do
{
	case west: {_misc = [_this,6,[],[[]]] call BIS_fnc_param;};
	case civilian: {_misc = [_this,6,false,[false]] call BIS_fnc_param;};
};

[[_uid,name _unit,_side,_money,_bank,_licenses,_misc,_civGear]] call DB_fnc_addQueue;