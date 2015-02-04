#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initiates the wire-transfer
*/
private["_value","_from"];
_value = [_this,0,0,[0]] call BIS_fnc_param;
_from = [_this,1,"",[""]] call BIS_fnc_param;

if(EQUAL(_value,0) OR EQUAL(_from,"") OR EQUAL(_from,profileName)) exitWith {}; //No
ADD(BANK,_value);
hint format["%1 has wire transferred $%2 to you",_from,[_value] call life_fnc_numberText];