#include "..\..\script_macros.hpp"
/*
	File: fn_addsubtract.sqf
	Author: Worldtrade1101
	Edited by: Derek
	Base on Tonic script
	Description:
	add or remove one from the rscEdit
*/
private["_amount", "_item_list", "_gear_list", "_shop_data", "_name", "_price"];

_type = [_this, 0, -1, [0]] call BIS_fnc_param; //buy or sell
_add = [_this, 1, -1, [0]] call BIS_fnc_param; // add or substract
disableSerialization;


if (_type == -1) exitwith {};


switch (_add) do {
	case 0:
		{
			if (_type == 0) then {
				_amount = ctrlText 2404;
				if (!([_amount] call TON_fnc_isnumber)) exitWith {
					hint localize "STR_Shop_Virt_NoNum";
				};
				_amount = parseNumber _amount + 1;
				_display = findDisplay 2400;
				_amounttext = _display displayCtrl 2404;
				_amounttext ctrlSetText format["%1", _amount];

			}
			else {
				_amount = ctrlText 2405;
				if (!([_amount] call TON_fnc_isnumber)) exitWith {
					hint localize "STR_Shop_Virt_NoNum";
				};
				_amount = parseNumber _amount + 1;
				_display = findDisplay 2400;
				_amounttext = _display displayCtrl 2405;
				_amounttext ctrlSetText format["%1", _amount];
			};

		};
	case 1:
		{
			if (_type == 0) then {
				_amount = ctrlText 2404;
				if (!([_amount] call TON_fnc_isnumber)) exitWith {
					hint localize "STR_Shop_Virt_NoNum";
				};
				_amount = parseNumber _amount - 1;
				_display = findDisplay 2400;
				_amounttext = _display displayCtrl 2404;
				_amounttext ctrlSetText format["%1", _amount];
			}
			else {
				_amount = ctrlText 2405;
				if (!([_amount] call TON_fnc_isnumber)) exitWith {
					hint localize "STR_Shop_Virt_NoNum";
				};

				if (parseNumber _amount == 0) exitwith {};
				_amount = parseNumber _amount - 1;
				_display = findDisplay 2400;
				_amounttext = _display displayCtrl 2405;
				_amounttext ctrlSetText format["%1", _amount];
			};
		};

};
