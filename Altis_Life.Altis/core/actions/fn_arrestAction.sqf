/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid


[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[[0,format["%1 was arrested by %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;