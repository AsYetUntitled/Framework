#include "..\..\script_macros.hpp"
/*
    File: fn_virt_update.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Update and fill the virtual shop menu.
*/
disableSerialization;

//Setup control vars.
private _item_list = CONTROL(2400,2401);
private _gear_list = CONTROL(2400,2402);

//Purge list
lbClear _item_list;
lbClear _gear_list;

if (!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; hint localize "STR_NOTF_ConfigDoesNotExist";}; //Make sure the entry exists..
ctrlSetText[2403,localize (M_CONFIG(getText,"VirtualShops",life_shop_type,"name"))];
private _shopItems = M_CONFIG(getArray,"VirtualShops",life_shop_type,"items");

{
    private _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    private _price = M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice");
    if (!(_price isEqualTo -1)) then {
        _item_list lbAdd format ["%1  ($%2)",(localize _displayName),[_price] call life_fnc_numberText];
        _item_list lbSetData [(lbSize _item_list)-1,_x];
        _item_list lbSetValue [(lbSize _item_list)-1,_price];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _item_list lbSetPicture [(lbSize _item_list)-1,_icon];
        };
    };
} forEach _shopItems;

{
    private _name = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    private _val = ITEM_VALUE(_x);

    if (_val > 0) then {
        _gear_list lbAdd format ["%2 [x%1]",_val,(localize _name)];
        _gear_list lbSetData [(lbSize _gear_list)-1,_x];
        _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");
        if (!(_icon isEqualTo "")) then {
            _gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
        };
    };
} forEach _shopItems;
