/*
	File: fn_processOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Processes it, will be overhauled with fuel system implementation.
*/
disableSerialization;
private["_target","_oil","_hasLicense","_price","_ui","_progress","_pgText","_cP"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_oil = life_inv_oilu;
_hasLicense = license_civ_oil;
_price = _oil * 1000;
if(_oil < 1) exitWith {};

//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Processing Oil (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.4;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Processing Oil (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
		if(player distance _target > 10) exitWith {};
	};
	
	if(player distance _target > 10) exitWith {hint "You need to stay within 10m to process oil!"; 5 cutText ["","PLAIN"];};
	if(!([false,"oilu",_oil] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"oilp",_oil] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,"oilu",_oil] call life_fnc_handleInv;};
	5 cutText ["","PLAIN"];
	titleText[format["You have processed %1 oil.",_oil],"PLAIN"];
}
	else
{
	if(life_cash < _price) exitWith {hint format["You need $%1 to process oil without a license!",[_price] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Processing Oil (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
		if(player distance _target > 10) exitWith {};
	};
	
	if(player distance _target > 10) exitWith {hint "You need to stay within 10m to process oil!"; 5 cutText ["","PLAIN"];};
	if(life_cash < _price) exitWith {hint format["You need $%1 to process oil without a license!",[_price] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
	if(!([false,"oilu",_oil] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"oilp",_oil] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,"oilu",_oil] call life_fnc_handleInv;};
	5 cutText ["","PLAIN"];
	life_cash = life_cash - _price;
	titleText[format["You have processed %1 oil for $%2",_oil,[_pirce] call life_fnc_numberText],"PLAIN"];
};	