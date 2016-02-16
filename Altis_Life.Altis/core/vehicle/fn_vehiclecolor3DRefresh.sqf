/*
	File: fn_vehiclecolor3DRefresh.sqf
	Author: Jawshy
  Modified : NiiRoZz

	Description:
	Called when a new selection is made in the rsc box and paint the vehicle with the color selected
*/
disableSerialization;
_display = findDisplay 2300;
_colorIndex = lbValue[2304,(lbCurSel 2304)];
if (isNull Life_Preview_3D_Vehicle_object) exitWith {};

[life_Preview_3D_Vehicle_object,_colorIndex] call life_fnc_colorVehicle;
