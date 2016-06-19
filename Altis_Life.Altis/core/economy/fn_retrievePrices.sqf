#include "..\..\script_macros.hpp"
/*
File: fn_retrievePrices.sqf
Author: Derek

Description:
Searches through the economy public variables to locate the correct ones
*/
private["_type","_side","_data","_ret","_tickTime","_queryResult","_market","_priceArray","_varname"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_data= [_this,1,"",[""]] call BIS_fnc_param;


//Error checks

diag_log format ["%1   %2",_type,_data];
if( _data == "") exitWith
{
    diag_log "data null";
};


_market = missionNamespace getVariable "MarketPrices";

_itemArray = [];
_shopItems = [];

switch (_data) do {
    case "economy" :{
        {
            _name = (_x select 0);
            _fact = (_x select 1);
            if (_fact != 0) then {
                _varname = format["%1MarketGoodPrice",_name];
                _priceArray = missionNamespace getVariable (_varname);
                _itemArray pushBack _priceArray;
            };
        } forEach _market;
    };
    default {
        _shopItems = M_CONFIG(getArray,"VirtualShops",_data, "items");
        {
            _name = (_x select 0);
            _fact = (_x select 1);
            if (_name in _shopItems) then {
                _varname = format["%1MarketGoodPrice",_name];
                _priceArray = missionNamespace getVariable (_varname);
                _itemArray pushBack _priceArray;
            };
        } forEach _market;
    };
};





if (_data == "economy") exitwith {[_type,_itemArray] spawn life_fnc_updateEconomy};

[_type,_itemArray] spawn life_fnc_updatePrice;
