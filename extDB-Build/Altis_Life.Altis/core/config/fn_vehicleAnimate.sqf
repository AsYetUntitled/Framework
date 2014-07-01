/*
	File: fn_vehicleAnimate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pass what you want to be animated.
*/
private["_vehicle","_animate","_state"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isnull _vehicle) exitwith {}; //FUCK
_animate = [_this,1,"",["",[]]] call BIS_fnc_param;
_preset = [_this,2,false,[false]] call BIS_fnc_param;

if(!_preset) then
{
	if(count _animate > 1) then
	{
		{
			_vehicle animate[_x select 0,_x select 1];
		} foreach _animate;
	}
		else
	{
		_vehicle animate[_animate select 0,_animate select 1];
	};
}
	else
{
	switch (_animate) do
	{
		case "civ_littlebird":
		{
			waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			_vehicle animate ["addDoors",1];
			_vehicle animate ["addBenches",0];
			_vehicle animate ["addTread",0];
			_vehicle animate ["AddCivilian_hide",1];
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};
		
		case "service_truck":
		{
			//waitUntil{!isNil {_vehicle getVariable "color"}};
			_vehicle animate ["HideServices", 0];
			_vehicle animate ["HideDoor3", 1];
		};
		
		case "med_offroad":
		{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			};
			_vehicle animate ["HidePolice", 0];
			_vehicle setVariable["lights",false,true];
		};
		
		case "cop_offroad":
		{
			if(typeOf _vehicle == "C_Offroad_01_F") then {
				waitUntil {!isNil {_vehicle getVariable "Life_VEH_color"}};
			};
			_vehicle animate ["HidePolice", 0];
			_vehicle animate ["HideBumper1", 0];
			_vehicle setVariable["lights",false,true];
		};
	};
};