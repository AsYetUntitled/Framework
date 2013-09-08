/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_cash < 50) exitWith {hint "You do not have $50 to be healed."};
titleText["Doctor Alan is healing you... Don't be scared...","PLAIN"];
sleep 2;
titleText["Opps, I think I stuck the needle in the wrong spot..","PLAIN"];
sleep 5;
if(player distance (_this select 0) > 5) exitWith {titleText["You need to be within 5m while the doctor is healing you.","PLAIN"]};
titleText["You are now fully healed!","PLAIN"];
player setdamage 0;
life_cash = life_cash - 50;