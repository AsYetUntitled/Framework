/*
	File: fn_robFederal.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Short action for sending the request out to the server.
*/
private["_vault","_unit"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vault OR isNull _unit) exitWith {}; //Bad data passed

[[_vault,_unit],"TON_fnc_robReserve",false,false] spawn life_fnc_MP;