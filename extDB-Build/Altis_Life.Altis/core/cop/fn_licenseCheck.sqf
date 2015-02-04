#include <macro.h>
/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop","_licenses","_licensesConfigs"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";

//Config entries for licenses that are civilian
_licensesConfigs = "getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "Licenses");

{
	if(LICENSE_VALUE(configName _x,"civ")) then {
		ADD(_licenses,localize getText(_x >> "displayName") + "<br/>");
	};
} foreach _licensesConfigs;

if(EQUAL(_licenses,"")) then {_licenses = (localize "STR_Cop_NoLicensesFound");};
[[profileName,_licenses],"life_fnc_licensesRead",_cop,FALSE] call life_fnc_MP;