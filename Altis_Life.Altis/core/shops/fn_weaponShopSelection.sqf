#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopSelection.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks the weapon & adds the price tag.
*/
private ["_control","_index","_shop","_priceTag","_price","_item","_itemArray","_bool"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if (isNull _control) exitWith {closeDialog 0;}; //Bad data
if (_index isEqualTo -1) exitWith {}; //Nothing selected

_priceTag = CONTROL(38400,38404);

if ((uiNamespace getVariable ["Weapon_Shop_Filter",0]) isEqualTo 1) then {
    _item = CONTROL_DATAI(_control,_index);
    _itemArray = M_CONFIG(getArray,"WeaponShops",_shop,"items");
    _itemArray append M_CONFIG(getArray,"WeaponShops",_shop,"mags");
    _itemArray append M_CONFIG(getArray,"WeaponShops",_shop,"accs");
    _item = [_item,_itemArray] call life_util_fnc_index;
    _price = ((_itemArray select _item) select 3);
    _priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
    _control lbSetValue[_index,_price];
} else {
    _price = _control lbValue _index;
    _item = CONTROL_DATAI(_control,_index);
    if (_price > CASH) then {
        _priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",[(_price)] call life_fnc_numberText,[(_price - CASH)] call life_fnc_numberText];
    } else {
        _priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
    };
    if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0 && (uiNamespace getVariable ["Weapon_Accessories",0]) isEqualTo 0) then {
            if (isClass (configFile >> "CfgWeapons" >> _item)) then {
                //Magazines menu
                if (isArray (configFile >> "CfgWeapons" >> _item >> "magazines")) then {
                    _itemArray = FETCH_CONFIG2(getArray,"CfgWeapons",_item,"magazines");
                    _bool = false;
                    {
                        _var = _x select 0;
                        _count = {_x == _var} count _itemArray;
                        if (_count > 0) exitWith {_bool = true};
                    } forEach M_CONFIG(getArray,"WeaponShops",_shop,"mags");
                    if (_bool) then {
                        ((findDisplay 38400) displayCtrl 38406) ctrlEnable true;
                    } else {
                        ((findDisplay 38400) displayCtrl 38406) ctrlEnable false;
                    };
                } else {
                    ((findDisplay 38400) displayCtrl 38406) ctrlEnable false;
                };

                //Accessories Menu
                if (isClass (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo")) then {
                    private ["_slotArray"];
                    _itemArray = [];
                    if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then {
                        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","CowsSlot","compatibleItems");
                        {
                            _itemArray pushBack _x;
                        } forEach _slotArray;
                    };
                    if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) then {
                        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","MuzzleSlot","compatibleItems");
                        {
                            _itemArray pushBack _x;
                        } forEach _slotArray;
                    };
                    if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems")) then {
                        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","PointerSlot","compatibleItems");
                        {
                            _itemArray pushBack _x;
                        } forEach _slotArray;
                    };
                    if (isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")) then {
                        _slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","UnderBarrelSlot","compatibleItems");
                        {
                            _itemArray pushBack _x;
                        } forEach _slotArray;
                    };

                    _bool = false;
                    {
                        _var = _x select 0;
                        _count = {_x == _var} count _itemArray;
                        if (_count > 0) exitWith {_bool = true};
                    } forEach M_CONFIG(getArray,"WeaponShops",_shop,"accs");
                    if (_bool) then {
                        ((findDisplay 38400) displayCtrl 38407) ctrlEnable true;
                    } else {
                        ((findDisplay 38400) displayCtrl 38407) ctrlEnable false;
                    };
                } else {
                    ((findDisplay 38400) displayCtrl 38407) ctrlEnable false;
                };
            } else {
            ((findDisplay 38400) displayCtrl 38406) ctrlEnable false;
            ((findDisplay 38400) displayCtrl 38407) ctrlEnable false;
        };
    };
};
