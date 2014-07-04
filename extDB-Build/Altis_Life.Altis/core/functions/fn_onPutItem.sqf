/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Syncs changes to containers in houses?
*/
private["_unit","_item","_house","_container"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL _container);
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
};