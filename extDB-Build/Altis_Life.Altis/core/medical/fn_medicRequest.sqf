/*
	File: fn_medicRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the medics that someone has requested emergency and prompts them
	if they want to take the request or not.
*/
private["_caller","_callerName"];
_caller = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_callerName = [_this,1,"Unknown Player",[""]] call BIS_fnc_param;
if(isNull _caller) exitWith {}; //Bad data

["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;