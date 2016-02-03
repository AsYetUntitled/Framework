/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if(EQUAL(LIFE_SETTINGS(getNumber,"spyglass_init"),1)) then {[] execVM "SpyGlass\fn_initSpy.sqf";};
[] execVM "core\init.sqf";
