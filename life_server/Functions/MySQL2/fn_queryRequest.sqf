/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;

if(_uid == "" || _side == sideUnknown) exitWith {"The UID or side passed had invalid inputs."};

//compile our query request
_query = switch(_side) do {
	case west: {format["SELECT playerid, name, cash, bankacc, coplevel, cop_gear, adminlevel, blacklist, donatorlvl FROM players WHERE playerid='%1'",_uid];};
	case civilian: {format["SELECT playerid, name, cash, bankacc, civ_licenses, arrested, adminlevel, donatorlvl, civ_gear FROM players WHERE playerid='%1'",_uid];};
	case independent: {format["SELECT playerid, cash, bankacc, mediclevel, donatorlvl, adminlevel FROM players WHERE playerid='%1'",_uid];};
};

_queryResult = [_query] call DB_fnc_asyncCall;
if(isNil {((_queryResult select 0) select 0)}) then {_return = [];} else {
	_return = ((_resultRequest select 0) select 0);
	if(count _return == 0) exitWith {};
	
	//Parse data for specific side.
	switch (_side) do {
		case west: {
			_new = [(_return select 6)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_return set[6,_new];
			_new = [(_return select 5)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_return set[5,_new];
			
			//Convert tinyint to boolean
			_old = _return select 5;
			for "_i" from 0 to (count _old)-1 do
			{
				_data = _old select _i;
				_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
			};
			_return set[5,_old];
		};
		
		case civilian: {
			_new = [(_return select 8)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_return set[8,_new];
			
			_new = [(_return select 4)] call DB_fnc_mresToArray;
			if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
			_return set[4,_new];
			
			//Convert tinyint to boolean
			_old = _return select 4;
			for "_i" from 0 to (count _old)-1 do
			{
				_data = _old select _i;
				_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
			};
			
			_return set[4,_old];
		};
	};
};

_return; //Send our result back.