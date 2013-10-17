/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(str(_target) in life_dp_points) then
{
	private["_point"];
	_point = life_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = life_dp_points call BIS_fnc_selectRandom;
};

life_dp_start = _target;

life_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format["You are to delivery this package to %1",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format["Deliver this package to %1",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!life_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",["You failed to deliver the package because you died."]] call BIS_fnc_showNotification;
		life_delivery_in_progress = false;
		life_dp_point = nil;
	};
};