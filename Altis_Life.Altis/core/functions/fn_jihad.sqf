#include "..\..\script_macros.hpp"
/*
	File: fn_jihad.sqf
	Author: Credits to Yolo Joe for Original Script / Fixed by @Heavy_Bob and @Liam0.
	Special thanks to @NiiRoZz and @tkcjesse for additional input.
	Description:
	A suicide vest. Yes this is a bomb. Handle with causion.
*/
private["_unit","_bomb","_sound"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,false,[true]] call BIS_fnc_param;
// checks
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if(life_isknocked || life_istazed || (vehicle _unit != _unit) || !alive _unit || (_unit GVAR ["restrained",false])) exitWith {};
if(vest _unit != "V_HarnessOGL_gry") exitWith {hint "You aren't wearing a suicide vest.";}; // Need add to localize but Jawshy i think do commit inside stringtable
if ((player distance (getmarkerpos "civ_terminal_1")) < 500) exitWith {hint "Some supernatural force prevents you from detonating a bomb in this holy place!"};
// execute
_bomb = "Bomb_04_F";
[_unit,"jihad"] remoteExec ["life_fnc_say3D",RANY];
sleep 24.800;
_unit setDamage 100;
_bomb createVehicle (position _unit);
removeVest _unit;
