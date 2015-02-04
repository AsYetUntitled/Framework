#include <macro.h>
/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className","_weight"];
_className = [_this,0,"",[""]] call BIS_fnc_param;
_weight = M_CONFIG(getNumber,CONFIG_VEHICLES,_className,"vItemSpace");

if(isNil "_weight") then {_weight = -1;};
_weight;