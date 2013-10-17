/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lockpicking a car.
*/
private["_car","_dice"];
_car = cursorTarget;
if(!(_car isKindOf "LandVehicle")) exitWith {hint "You can only lock pick cars!"};
if(player distance _car > 7) exitWith {hint "You need to be within 7m!"};
if(_car in life_vehicles) exitWith {hint "This vehicle is already in your keychain."};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;
_dice = random(100);

life_action_inUse = true;
for "_i" from 0 to 3 do
{
	if(player distance _car > 10) exitWith {};
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 0.5;
	waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
	if(_i == 2) then {sleep 0.2;};
};

if(player distance _car > 10) exitWith {life_action_inUse = false; titleText["The vehicle is not in range!","PLAIN"];};

life_action_inUse = false;
if(_dice < 30) then
{
	titleText["You now have keys to this vehicle.","PLAIN"];
	life_vehicles set[count life_vehicles,_car];
	serv_killed = [player,"487"];
	publicVariableServer "serv_killed";
}
	else
{
	serv_killed = [player,"215"];
	publicVariableServer "serv_killed";
	[[0,format["%1 was seen trying to lockpick at car.",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	titleText["The lockpick broke.","PLAIN"];
};