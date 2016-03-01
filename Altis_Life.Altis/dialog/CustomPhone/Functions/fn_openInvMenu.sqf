#include "..\..\..\script_macros.hpp"
/*
	File: fn_openInvMenu.sqf
	Author: Travis Boi
	
	Description:
	Updates the players inventory menu on Travis's Phone
*/
private["_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_struct"];
disableSerialization;

closeDialog 0;
createDialog 'playerMenu';

_inv = CONTROL(20057,1500);
_plist = CONTROL(20057,2100);
lbClear _plist;

{
	if(ITEM_VALUE(configName _x) > 0) then {
		_inv lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
		_inv lbSetData [(lbSize _inv)-1,configName _x];
		_icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_inv lbSetPicture [(lbSize _inv)-1,_icon];
		};
	};
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

_near_units = [];
{ if(player distance _x < 20) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then {
		_plist lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_plist lbSetData [(lbSize _plist)-1,str(_x)];
	};
} foreach _near_units;