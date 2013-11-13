/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {hint "You need to look at the vehicle you want to refuel!"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "You need to be closer to the vehicle!"};

if(!([false,"fuelF",1] call life_fnc_handleInv)) exitWith {};
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
titleText[format["Refuelling %1.....",_displayName],"PLAIN"];
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.5);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.5);
		};
	};
	
	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.2);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.2);
		};
	};
	
	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[[[_vehicle],{_this select 0 setFuel ((Fuel (_this select 0)) + 0.35);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.35);
		};
	};
};
titleText[format["You have refuelled that %1",_displayName],"PLAIN"];
[true,"fuelE",1] call life_fnc_handleInv;