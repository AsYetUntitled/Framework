/*
    File: fn_medicRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies the medics that someone has requested emergency and prompts them
    if they want to take the request or not.
*/
params [
    ["_caller",objNull,[objNull]],
    ["_callerName","Unknown Player",[""]]
];

if (isNull _caller) exitWith {}; //Bad data

["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;
