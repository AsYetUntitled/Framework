#include "..\..\script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out again.
*/
private["_value","_unit","_tax"];
_value = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_value > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > BANK) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_value] call life_fnc_taxRate;
if((_value + _tax) > BANK) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_value,_tax]};

BANK = BANK - (_value + _tax);

[_value,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[] call life_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_value] call life_fnc_numberText,_unit GVAR ["realname",name _unit],[_tax] call life_fnc_numberText];
[1] call SOCK_fnc_updatePartial;

if(EQUAL(LIFE_SETTINGS(getNumber,"player_moneyLog"),1)) then {
	if(EQUAL(LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging"),1)) then {
		money_log = format ["transfered %1 to %2. Bank Balance: %3  On Hand Balance: %4",_value,_unit GVAR ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
	} else {
		money_log = format ["%1 - %2 transfered %3 to %4. Bank Balance: %5  On Hand Balance: %6",profileName,(getPlayerUID player),_value,_unit GVAR ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
	};
	publicVariableServer "money_log";
};