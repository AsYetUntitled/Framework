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
_query = "SELECT resource, sellprice FROM economy";

_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_marketPrices = [];

{
    _varName = _x select 0;
    _sellPrice = _x select 1;
    _marketPrices pushBack [_varName, ITEM_FACTOR(_varName)];
    _name = format["%1MarketGoodPrice", _varName];
    _info = [
                _varName,
                ITEM_BUYPRICE(_varName),
                _sellPrice,
                ITEM_VARPRICE(_varName),
                ITEM_MINPRICE(_varName),
                ITEM_MAXPRICE(_varName),
                ITEM_FACTOR(_varName),
                _sellPrice,
                _sellPrice
            ];
    missionNamespace setVariable [_name, _info];
    publicVariable _name;
} forEach _queryResult;

missionNamespace setVariable ["MarketPrices", _marketPrices];
publicVariable "MarketPrices";
