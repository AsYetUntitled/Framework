/*
    File: fn_vehicleColor3DRefresh.sqf
    Author: 
    Modified: NiiRoZz

    Description:
    Called when a new selection is made in the rsc box and paint the vehicle with the color selected.
*/
if (isNull life_3dPreview_object) exitWith {};
private _color = lbText [2304, (lbCurSel 2304)];

[life_3dPreview_object, _color] call life_fnc_colorVehicle;