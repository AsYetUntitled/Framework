/*
	File: fn_callBackup.sqf
	Author: Robin Withes

	Description:
	Allows cops with a panic button to call for backup.
*/
private["_sleeptime"];
_sleeptime = 60;
if(playerSide != west) exitWith {};
if(!([false,"panicbutton",1] call life_fnc_handleInv)) exitWith {hint "You can not do that without a panic button in your inventory."};
closeDialog 0;
hint "You have pressed your panic button.";
[true,"panicbutton",1] call life_fnc_handleInv;
uiSleep 3;
_marker = createMarker [format ["MarkerPanicButton%1",name player], position player];
_marker setMarkerColor "ColorRed"; //setMarkerColor
_marker setMarkerText format ["**PANIC BUTTON PRESSED BY %1**",name player]; //setMarkerText
_marker setMarkerType "mil_warning";  //setMarkerType

[1,format ["DISPATCH: A PANIC BUTTON WAS JUST PRESSED BY %1.",name player]] remoteExecCall ["life_fnc_broadcast",west];
sleep _sleeptime;
deleteMarker _marker;
