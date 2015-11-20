#include "\life_server\script_macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
private["_unit","_vehicle","_price","_cash"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,2,500,[0]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;

//Error checks
if(isNull _vehicle OR isNull _unit) exitWith  {
	life_action_inUse = false;
	PVAR_ID("life_action_inUse",owner _unit);
};

_displayName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,typeOf _vehicle, "displayName");
_unit = owner _unit;

_dbInfo = _vehicle GVAR ["dbInfo",[]];
if(count _dbInfo > 0) then {
	_uid = SEL(_dbInfo,0);
	_plate = SEL(_dbInfo,1);

	_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	
	_sql = [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
life_action_inUse = false;
PVAR_ID("life_action_inUse",_unit);
CASH = _cash;
PVAR_ID("life_cash",_unit);
[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];