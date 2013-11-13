/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh"];
_veh = cursorTarget;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		titleText["Repairing vehicle.....","PLAIN"];
		player removeItem "ToolKit";
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 3.5;
		if(player != vehicle player) exitWith {titleText["You must be outside of the vehicle to fix it. Sorry that this prevents you from exploiting the system, well not really.","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		_veh setFuel 1;
		titleText["You have repaired that vehicle.","PLAIN"];
	};
};