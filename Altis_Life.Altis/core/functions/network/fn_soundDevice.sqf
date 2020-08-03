/*
    File: fn_soundDevice.sqf
    Author:

    Description:
    Plays a device sound for mining (Mainly Tempest device).
*/
params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {};
if (player distance _vehicle > 2500) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if !(alive _vehicle) exitWith {};
    if (isNil {_vehicle getVariable "mining"}) exitWith {};
    _vehicle say3D ["Device_disassembled_loop",150,1];
    sleep 28.6;
};
