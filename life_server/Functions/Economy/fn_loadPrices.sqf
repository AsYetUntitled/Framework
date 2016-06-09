#include "\life_server\script_macros.hpp"
/*
File: fn_loadPrices.sqf
Author: Derek Benson

Description:
Loads the SQL database into the economy variable: marketPrices and dynamically
created variables for each good.
*/
//private["_marketPrices"];

/*
Structure of each price variable
0 - ressource
1 - buyprice
2 - sellprice
3 - varprice
4 - minprice
5 - maxprice
6 - factor
7 - shoptype
8 - recent sell price
9 - server start sell price
*/
_query = format["loadPrices"];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Load Prices Request -------------",
		format["QUERY: %1",_query],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"-------------------------------------------------"
	]] call TON_fnc_logIt;
};
_marketPrices = [];

{
    _marketPrices pushBack [SEL(_x,0),SEL(_x,6),SEL(_x,7)];
    _name = format["%1MeccaMarketGoodPrice",SEL(_x,0)];
    _x pushBack SEL(_x,2);
    _x pushBack SEL(_x,2);
    missionNamespace setVariable [_name, _x];
    publicVariable _name;
} forEach _queryResult;

missionNamespace setVariable ["MeccaMarketPrices", _marketPrices];
publicVariable "MeccaMarketPrices";