/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,sell_array] call fnc_index;
if(_index == -1) exitWith {};
_price = (sell_array select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call fnc_isnumber)) exitWith {hint "You didn't enter an actual number";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "You don't have that many items to sell!"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format["You sold %1 %2 for $%3",_amount,_name,[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	[] call life_fnc_virt_update;
	
};