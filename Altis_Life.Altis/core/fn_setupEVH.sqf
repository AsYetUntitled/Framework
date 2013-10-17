/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onDeath}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this spawn life_fnc_onRespawn}];
"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};