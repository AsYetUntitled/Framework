/*
	Description:
	Plays a device sound for mining (Mainly Tempest device).
*/
if(isNull _this) exitWith {};
if(player distance _this > 2500) exitWith {}; //Don't run it... They're to far out..

while {true} do {
	if(isNull _this OR !alive _this) exitWith {};
	if(isNil {_this getVariable "mining"}) exitWith {};
	_this say3D "Device_disassembled_loop";
	sleep 28.6;
};