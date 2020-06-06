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
ctrlSetText[2403, (M_CONFIG(getText,"VirtualShops",life_shop_type,"name"))];
private _shopItems = M_CONFIG(getArray,"VirtualShops",life_shop_type,"items");

{
    private _displayName = M_CONFIG(getText,"VirtualItems",_x,"displayName");
    private _price = M_CONFIG(getNumber,"VirtualItems",_x,"buyPrice");
    private _icon = M_CONFIG(getText,"VirtualItems",_x,"icon");

    //fill shop list
    if (!(_price isEqualTo -1)) then {
        private _id = _item_list lbAdd format ["%1  ($%2)",_displayName,[_price] call life_fnc_numberText];
        _item_list lbSetData [_id,_x];
        _item_list lbSetValue [_id,_price];
        if !(_icon isEqualTo "") then {
            _item_list lbSetPicture [_id,_icon];
        };
    };

    //fill player inventory list
    private _val = ITEM_VALUE(_x);
    if (_val > 0) then {
        private _id = _gear_list lbAdd format ["%2 [x%1]",_val,_displayName];
        _gear_list lbSetData [_id,_x];
        if !(_icon isEqualTo "") then {
            _gear_list lbSetPicture [_id,_icon];
        };
    };
} forEach _shopItems;
