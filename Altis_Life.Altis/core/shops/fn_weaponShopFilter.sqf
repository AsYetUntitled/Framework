#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopFilter.sqf
    Author: Bryan "Tonic" Boardwine
    Edit: Added level checks - BoGuu

    Description:
    Applies the filter selected and changes the list.
*/

private _index = (lbCurSel 38402);
private _shop = uiNamespace getVariable ["Weapon_Shop",""];

if (_index isEqualTo -1 || {_shop isEqualTo ""}) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

uiNamespace setVariable ["Weapon_Shop_Filter",_index];
//Setup List Control & Purge it.

private _priceTag = ((findDisplay 38400) displayCtrl 38404);
_priceTag ctrlSetStructuredText parseText "";

private _itemList = ((findDisplay 38400) displayCtrl 38403);
lbClear _itemList;

private "_config";

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 1 || {(uiNamespace getVariable ["Weapon_Accessories",0]) isEqualTo 1}) then {

    if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 1) then {
    
        _config = M_CONFIG(getArray,"WeaponShops",_shop,"mags");
        {
            _bool = [_x] call life_fnc_levelCheck;
            if (_bool) then {
                _x params ["_var"];
                _count = {_x == _var} count (uiNamespace getVariable ["Magazine_Array",[]]);
                if (_count > 0) then {
                    _itemInfo = [(_x select 0)] call life_fnc_fetchCfgDetails;
                    _itemList lbAdd format ["%1",if (!((_x select 1) isEqualTo "")) then {(_x select 1)} else {(_itemInfo select 1)}];
                    _itemList lbSetData[(lbSize _itemList)-1,(_itemInfo select 0)];
                    _itemList lbSetPicture[(lbSize _itemList)-1,(_itemInfo select 2)];
                    _itemList lbSetValue[(lbSize _itemList)-1,(_x select 2)];
                };
            };
            true
        } count _config;
        
        ((findDisplay 38400) displayCtrl 38406) ctrlSetText localize "STR_Global_Weapons";
        
        ctrlShow [38406,true];
        ctrlShow [38407,false];
        
    } else {
    
        _config = M_CONFIG(getArray,"WeaponShops",_shop,"accs");
        {
            _bool = [_x] call life_fnc_levelCheck;
            if (_bool) then {
                _x params ["_var"];
                _count = {_x == _var} count (uiNamespace getVariable ["Accessories_Array",[]]);
                if (_count > 0) then {
                    _itemInfo = [(_x select 0)] call life_fnc_fetchCfgDetails;
                    _itemList lbAdd format ["%1",if (!((_x select 1) isEqualTo "")) then {(_x select 1)} else {(_itemInfo select 1)}];
                    _itemList lbSetData[(lbSize _itemList)-1,(_itemInfo select 0)];
                    _itemList lbSetPicture[(lbSize _itemList)-1,(_itemInfo select 2)];
                    _itemList lbSetValue[(lbSize _itemList)-1,(_x select 2)];
                };
            };
            true
        } count _config;
        
        ((findDisplay 38400) displayCtrl 38407) ctrlSetText localize "STR_Global_Weapons";
        
        ctrlShow [38406,false];
        ctrlShow [38407,true];
    };

    ((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Buy";
    ctrlShow [38402,false];

} else {

    switch (_index) do {

        case 0: {
            _config = M_CONFIG(getArray,"WeaponShops",_shop,"items");
            {
                _bool = [_x] call life_fnc_levelCheck;
                if (_bool) then {
                    _itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
                    _itemList lbAdd format ["%1",if (!((_x select 1) isEqualTo "")) then {_x select 1} else {_itemInfo select 1}];
                    _itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
                    _itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
                    _itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
                };
                true
            } count _config;

            ((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Buy";
            ((findDisplay 38400) displayCtrl 38406) ctrlSetText localize "STR_Global_Mags";
            ((findDisplay 38400) displayCtrl 38407) ctrlSetText localize "STR_Global_Accs";
            
            ctrlShow [38402,true];
            ctrlShow [38406,true];
            ctrlShow [38407,true];
        };

        case 1: {
            _config = [];
            private _listedItems = [];
            //Go through weapons
            if (primaryWeapon player != "") then {_config pushBack primaryWeapon player;};
            if (secondaryWeapon player != "") then {_config pushBack secondaryWeapon player;};
            if (handgunWeapon player != "") then {_config pushBack handgunWeapon player;};

            //Go through items
            _config = _config + primaryWeaponItems player;
            _config = _config + (assignedItems player);
            _config = _config + (uniformItems player);
            _config = _config + (vestItems player);
            _config = _config + (backpackItems player);

            ((findDisplay 38400) displayCtrl 38405) ctrlSetText localize "STR_Global_Sell";
            ctrlShow [38402,true];
            ctrlShow [38406,false];
            ctrlShow [38407,false];

            private _itemArray = [];
            _itemArray pushBack M_CONFIG(getArray,"WeaponShops",_shop,"items");
            _itemArray pushBack M_CONFIG(getArray,"WeaponShops",_shop,"mags");
            _itemArray pushBack M_CONFIG(getArray,"WeaponShops",_shop,"accs");
            {
                _y = _x;
                {
                    if (!(_x in _listedItems) && _x != "") then {
                        _iS = [_x,_y] call TON_fnc_index;
                        if !(_iS isEqualTo -1) then {
                        _z = _y select _iS;
                            if (!((_z select 3) isEqualTo -1)) then {

                                _bool = [_z] call life_fnc_levelCheck;
                                if (_bool) then {

                                    _itemInfo = [_x] call life_fnc_fetchCfgDetails;
                                    _listedItems pushBack _x;

                                    _itemCount = {_x == (_itemInfo select 0)} count _config;
                                    if (_itemCount > 1) then {
                                        _itemList lbAdd format ["[%2] %1",_itemInfo select 1,_itemCount];
                                    } else {
                                        _itemList lbAdd format ["%1",_itemInfo select 1];
                                    };
                                    _itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
                                    _itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];


                                };
                            };
                        };
                    };
                    true
                } count _config;
                true
            } count _itemArray;
        };
    };
};

((findDisplay 38400) displayCtrl 38403) lbSetCurSel 0;
