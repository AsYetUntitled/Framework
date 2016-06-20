#include "..\..\script_macros.hpp"
/*
    File: fn_updatePrice.sqf
    Author: Worldtrade1101
    Edited by: Derek
    Base on Tonic script
    Description:
    Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price","_icon"];
disableSerialization;
params [
    ["_type", 0],
    ["_array", []]
];

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shop_data = M_CONFIG(getArray,"VirtualShops",life_shop_type,"items");

if (count _array isEqualTo 0) exitwith {};

{
    if ((_x select 1) > 1 ) then {
        _name = ITEM_NAME(_x select 0);
        _price = _x select 1;
        _item_list lbAdd format["%1  ($%2)",(localize _name),[_price] call life_fnc_numberText];
        _item_list lbSetData [(lbSize _item_list)-1,_x select 0];
        _item_list lbSetValue [(lbSize _item_list)-1,_price];
        _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
        if (!(_icon isEqualTo "")) then {
            _item_list lbSetPicture [(lbSize _item_list)-1,_icon];
        };
    };
} forEach _array;

{
    if ((_x select 2) > 1 ) then {
        _val = ITEM_VALUE(_x select 0);
        _name = ITEM_NAME(_x select 0);
        if(_val > 0) then {
            _price = _x select 2;
            _gear_list lbAdd format["%2 [x%1]",_val,(localize _name)];
            _gear_list lbSetData [(lbSize _gear_list)-1,_x select 0];
            _gear_list lbSetValue [(lbSize _gear_list)-1,_price];
            _icon = M_CONFIG(getText,"VirtualItems",(_x select 0),"icon");
            if (!(_icon isEqualTo "")) then {
                _gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
            };
        };
    };
} forEach (_array);

lbSort _item_list;
lbSort _gear_list;
