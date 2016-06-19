#include "\life_server\script_macros.hpp"
/*
File: fn_adjustPrices.sqf
Author: worldtrade1101
Edited by: Derek Benson
Description:
Updates the variables serverside.
*/

//[[0,player,life_shop_type,_amount,_price,_var],"TON_fnc_adjustPrices",false,false] spawn life_fnc_MP;
private["_type","_side","_data","_unit","_ret","_tickTime","_queryResult","_var","_price","_amount","_market","_cfgDelay","_factor","_good","_itemArray","_priceChanges","_delay","_changeco","_endtime","_diff"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_data = [_this,2,"",[""]] call BIS_fnc_param;
_amount = [_this,3,0,[0]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_var = [_this,5,"",[""]] call BIS_fnc_param;

/* Randomizes when changes hit the market */
_endtime = (LIFE_SETTINGS(getNumber, "end_time"));
_diff = _endtime - time;
_cfgDelay = (LIFE_SETTINGS(getNumber, "adjustment_delay"));
_delay = _cfgDelay + random(_cfgDelay/10);

if (_diff < _delay) then {
    _delay = _diff - 10;
    if (_delay < 0) then {
        _delay = 0;
    };
};

sleep _delay;
//Error checks

diag_log format ["%1   %2    %3    %4      %5      %6",_unit,_type,_data,_amount,_price,_var];
if( (_data == "") OR (isNull _unit)) exitWith
{
diag_log "data or unit null";
};

_unit = owner _unit; //for hack purpose!

_market = missionNamespace getVariable "MarketPrices";

_good = missionNamespace getVariable format["%1MarketGoodPrice",_var];

if(isNil "_good") exitWith {format["ERROR: _good variable was nil in adjust prices. _var = %1", _var]};
_itemArray = [];

//we check the factor of the object
_factor = (_good select  6);
if (_factor == 0) exitwith {};//the factor 0 is not a real group

{
    if((_x select 1) == _factor) then {
        _name = format["%1MarketGoodPrice",(_x select 0)];
        _itemArray pushBack (missionNamespace getVariable _name);
    };
} forEach _market;

_sellingfactor =((count _itemArray)-1);

{
    _ressource = _x select 0;
    _buyprice =  (_x select 1);
    _sellprice =  (_x select 2);
    _varprice =  (_x select 3);
    _minprice = (_x select 4);
    _maxprice = (_x select 5);
    _changeco = 0.3 + random 1.4;
    _x set [7, _sellprice];
    if (_ressource == _var) then {
        if (_type == 0) then {
            if ((_sellprice - (_varprice * _amount * _sellingfactor)) > _minprice) then {
                _sellprice = _sellprice - (_varprice * _amount * _sellingfactor);
            } else {
                _sellprice = _minprice;
            };
            if (_buyprice != 0) then {
                if ((_sellprice >= _buyprice)) then {
                    _buyprice=_sellprice + 15;
                };
            };
        };
    } else {
        _varprice = _varprice * _changeco;
        if (_type == 0) then {
            if ((_sellprice + (_varprice * _amount)) < _maxprice) then {
                _sellprice = round(_sellprice + (_varprice * _amount));
            } else {
                _sellprice = _maxprice;
            };
        };
    };

    _x set [2, _sellprice];
    _name = format["%1MarketGoodPrice",(_x select 0)];
    missionNamespace setVariable [_name,_x];
    publicVariable _name;
} forEach _itemArray;
