/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
private["_search"];
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search == 0) exitWith {hint "There isn't a chopper on the helipad!"};
if(life_cash < 1000) exitWith {hint "You need $1,000 to service your chopper"};

titleText[format["Servicing %1...",typeOf (_search select 0)],"PLAIN"];
titleFadeOut 10;
sleep 10;

if(!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {hint "The vehicle is no longer alive or on the helipad!"};
(_search select 0) setFuel 1;
(_search select 0) setDamage 0;

titleText ["Your chopper is now repaired and refueled.","PLAIN"];
life_cash = life_cash - 1000;