/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "You need to select someone to transfer to"};
if(isNil "_unit") exitWith {hint "The player selected doesn't seem to exist?"};
if(_val > 999999) exitWith {hint "You can't transfer more then $999,999";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "That isn't in an actual number format."};
if(_val > life_atmcash) exitWith {hint "You don't have that much in your bank account!"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > life_atmcash) exitWith {hint format["You do not have enough money in your bank account, to transfer $%1 you will need $%2 as a tax fee.",_val,_tax]};

life_atmcash = life_atmcash - (_val + _tax);

[[_val,player getVariable["realname",name player]],"clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
hint format["You have transfered $%1 to %2.\n\nA tax fee of $%3 was taken for the wire transfer.",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[] call SOCK_fnc_updateRequest; //Silent Sync