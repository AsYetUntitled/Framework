/*
	File: fn_calWeightDiff.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Calculates weight differences in the _cWeight (current Weight) against the _mWeight (Max Weight)
	Multiple purpose system for this life mission.
*/
private["_item","_value","_cWeight","_mWeight","_sum","_weight"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
_cWeight = [_this,2,-1,[0]] call BIS_fnc_param;
_mWeight = [_this,3,-1,[0]] call BIS_fnc_param;

if(_item == "" OR _value == -1 OR _cWeight == -1 OR _mWeight == -1) exitWith {};
_weight = ([_item] call life_fnc_itemWeight) * _value;
_sum = _value;

if((_cweight + _weight) > _mWeight) then
{
	while {true} do
	{
		_sum = _sum - 1;
		if(_sum < 1) exitWith {};
		_weight = ([_item] call life_fnc_itemweight) * _sum;
		if((_cWeight + _weight) <= _mWeight) exitWith {};
	};
};

_sum;