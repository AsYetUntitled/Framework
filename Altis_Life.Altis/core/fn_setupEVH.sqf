/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onDeath}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this spawn life_fnc_onRespawn}];