/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt"];
disableSerialization;

if(life_adminlevel < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};


_dialog = findDisplay 2001;
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_near = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
_mstatus = _dialog displayCtrl 2015;
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;

switch (playerSide) do
{
	case west:
	{
		_licenses = ["license_cop_air","license_cop_swat","license_cop_cg"];
	};
	
	case civilian:
	{
		_licenses = ["license_civ_driver","license_civ_air","license_civ_boat","license_civ_dive","license_civ_gun","license_civ_oil","license_civ_heroin","license_civ_gang","license_civ_rebel","license_civ_truck"];
	};
};

//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",name _x, side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",name _x, side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;

_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='icons\bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='icons\money.paa'/> <t size='0.8'>$%2</t>",[life_atmcash] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
ctrlSetText[2009,format["Weight: %1 / %2", life_carryWeight, life_maxWeight]];
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
} foreach life_inv_items;
{
	_str = [_x] call life_fnc_varToStr;
	_val = missionNamespace getVariable _x;
	if(_val) then
	{
		_struct = _struct + format["%1<br/>",_str];
	};
} foreach _licenses;

if(_struct == "") then
{
	_struct = "No Licenses";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];