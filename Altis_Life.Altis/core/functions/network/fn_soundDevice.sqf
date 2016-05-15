/*
    File: fn_soundDevice.sqf
    Author:

    Description:
    Plays a device sound for mining (Mainly Tempest device).
*/
if (isNull _this) exitWith {};
if (player distance _this > 2500) exitWith {}; //Don't run it... They're to far out..

for "_i" from 0 to 1 step 0 do {
    if (isNull _this || !alive _this) exitWith {};
    if (isNil {_this getVariable "mining"}) exitWith {};
    _this say3D "Device_disassembled_loop";
    sleep 28.6;
};