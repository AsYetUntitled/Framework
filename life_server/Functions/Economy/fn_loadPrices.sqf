#include "\life_server\script_macros.hpp"
/*
	File: fn_loadPrices.sqf
	Author: Derek Benson

	Description:
	Loads the SQL database into the economy variable: marketPrices and dynamically
	created variables for each good.
*/
private["_marketPrices", "_query", "_tickTime", "_queryResult", "_name"];

/*
	Structure of each price variable
	0 - ressource
	1 - buyprice
	2 - sellprice
	3 - varprice
	4 - minprice
	5 - maxprice
	6 - factor shoptype
	7 - recent sell price
	8 - server start sell price
*/
_query = "SELECT resource, buyprice, sellprice, varprice, minprice, maxprice, factor FROM economy";

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_marketPrices = [];

{
    _marketPrices pushBack [(_x select 0),(_x select 6)];
    _name = format["%1MarketGoodPrice",(_x select 0)];
    _x pushBack (_x select 2);
    _x pushBack (_x select 2);
    missionNamespace setVariable [_name, _x];
    publicVariable _name;
} forEach _queryResult;

missionNamespace setVariable ["MarketPrices", _marketPrices];
publicVariable "MarketPrices";
