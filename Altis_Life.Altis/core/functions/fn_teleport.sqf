/*
    File: fn_teleport.sqf
    Author: ColinM9991
    Credits: To original script author(s)
    Description:
    Teleport to chosen position.
*/
params [
    "_xPos",
    "_yPos"
];
(vehicle player) setPos [_xPos, _yPos, 0];
onMapSingleClick "";
openMap [false, false];
hint localize "STR_NOTF_Teleport";
