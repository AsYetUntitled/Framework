#include "\life_server\script_macros.hpp"
private["_market", "_query", "_price", "_name", "_goods","_endtime"];
/*
File: fn_syncPrices.sqf
Author: Derek Benson

Description:
refreshes the SQL database with the new sell prices
*/

while {true} do {
    diag_log format["Sync prices at uptime: %1",round(time/60)];
    _market = missionNamespace getVariable "MarketPrices";

    if (isNil "_market") then {
        [] call TON_fnc_loadPrices;
        _market = missionNamespace getVariable "MarketPrices";
    };

    _goods = [];

    {
        if ((_x select 1) != 0) then {
            _name = format["%1MarketGoodPrice",(_x select 0)];
            _price = missionNamespace getVariable _name;
            _goods pushBack [(_price select 0),(_price select 2)];
        };
    } forEach _market;

    {
        _name = (_x select 0);
        _price = (_x select 1);
        _query = format["UPDATE economy SET sellprice=%1 WHERE resource='%2'",_price,_name];

        waitUntil{sleep (random 0.3); !DB_Async_Active};
        _tickTime = diag_tickTime;
        [_query,1] call DB_fnc_asyncCall;

    } forEach _goods;

    _endtime = 4*60*60;
    _diff = _endtime - time;
    diag_log format["Sleeping sync prices at uptime: %1",round(time/60)];
    if (_diff > 15*60 || time > _endtime+5) then {
        sleep (15*60);
    } else {
        sleep (_diff - 5);
    };
    diag_log format["Waking sync prices at uptime: %1",round(time/60)];
};
