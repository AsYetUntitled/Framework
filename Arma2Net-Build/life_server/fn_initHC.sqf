/*
	File: fn_initHC.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server checks for the headless client and initializes?
*/
private["_HC_Monitor"];
if(isNil "life_HC_isActive") then {life_HC_isActive = false;};
//Check to see if our headless client has went away if he disconnects so we know..

HC_DC = ["HC_Disconnected","onPlayerDisconnected",{if(!isNil "HC_UID" && {_uid == HC_UID}) then {life_HC_isActive = false;};}] call BIS_fnc_addStackedEventHandler;

//Setup the PVEH so the server can update the HC_UID if the headless client was swapped.
"life_HC_isActive" addPublicVariableEventHandler {
	HC_UID = getPlayerUID hc_1;
};

//Let's see if he is here on mission start..
if(isNil "HC_UID" && {!isNil "hc_1"} && {!isNull hc_1}) then {
	HC_UID = getPlayerUID hc_1;
	life_HC_isActive = true;
};