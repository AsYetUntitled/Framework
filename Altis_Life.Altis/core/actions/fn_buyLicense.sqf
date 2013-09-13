/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(life_cash < _price) exitWith {hint format["You do not have $%1 for a %2",[_price] call life_fnc_numberText,_license select 1];};

life_cash = life_cash - _price;
titleText[format["You bought a %1 for $%2", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];