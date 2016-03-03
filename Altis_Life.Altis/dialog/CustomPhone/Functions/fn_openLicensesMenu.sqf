#include "..\..\..\script_macros.hpp"
/*
	File: fn_openLicencesMenu.sqf
	Author: Travis Boi
	
	Description:
	Updates the players licences menu on Travis's Phone
*/
private["_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_struct"];
disableSerialization;

closeDialog 0;
createDialog 'Life_TR8_Licences';

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_lic = CONTROL(20058,1500);
_struct = "";

{
	_displayName = getText(_x >> "displayName");
	
	if(LICENSE_VALUE(configName _x,_side)) then {
		_struct = _struct + format["%1<br/>",localize _displayName];
	};
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));

if(EQUAL(_struct,"")) then {
	_struct = "No Licenses";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];