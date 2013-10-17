/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayctrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];

if(life_adminlevel < 1) then
{
	ctrlShow[2405,false];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;