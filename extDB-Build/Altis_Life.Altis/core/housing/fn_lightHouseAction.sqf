/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lights up the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(isNull (_house getVariable ["lightSource",ObjNull])) then {
	[[_house,true],"life_fnc_lightHouse",true,false] spawn life_fnc_MP;
} else {
	[[_house,false],"life_fnc_lightHouse",true,false] spawn life_fnc_MP;
};