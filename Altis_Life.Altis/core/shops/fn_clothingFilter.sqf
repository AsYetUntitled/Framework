#include "..\..\script_macros.hpp"
/*
    File: fn_clothingFilter.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Functionality for filtering clothing types in the menu.
*/

disableSerialization;

params [
    "", //Control
    ["_selection", 0, [0]]
];

life_clothing_filter = _selection;

switch (_selection) do {
    case 4: {
        life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
        life_shop_cam camSetPos (player modelToWorld [1,-4,2]);
        life_shop_cam camCommit 1;
    };

    case 0: {
        life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
        life_shop_cam camSetPos (player modelToWorld [1,4,2]);
        life_shop_cam camCommit 1;
    };

    case 3: {
        life_shop_cam camSetTarget (player modelToWorld [0,0,1.4]);
        life_shop_cam camSetPos (player modelToWorld [-.1,2,1.4]);
        life_shop_cam camCommit 1;
    };

    default {
        life_shop_cam camSetTarget (player modelToWorld [0,0,1.6]);
        life_shop_cam camSetPos (player modelToWorld [-.5,1,1.6]);
        life_shop_cam camCommit 1;
    };
};

if (isNull (findDisplay 3100)) exitWith {};

private _list = CONTROL(3100,3101);
lbClear _list;

private _configArray = switch (_selection) do {
    case 0: {M_CONFIG(getArray,"Clothing",life_clothing_store,"uniforms");};
    case 1: {M_CONFIG(getArray,"Clothing",life_clothing_store,"headgear");};
    case 2: {M_CONFIG(getArray,"Clothing",life_clothing_store,"goggles");};
    case 3: {M_CONFIG(getArray,"Clothing",life_clothing_store,"vests");};
    case 4: {M_CONFIG(getArray,"Clothing",life_clothing_store,"backpacks");};
};

private "_pic";
private "_details";

{
    _x params [
        ["_className", "NONE", [""]],
        ["_displayName", "", [""]],
        ["_price", 1000, [0]]
    ];

    if !(_className isEqualTo "NONE") then {
        _details = [_className] call life_fnc_fetchCfgDetails;
        _pic = (_details select 2);
    };

    if ([_x] call life_fnc_levelCheck) then {

        if (isNil "_details") then {
            _list lbAdd _displayName;
            _list lbSetData [(lbSize _list)-1,_className];
        } else {
            if (_displayName isEqualTo "") then {
                _list lbAdd (_details select 1);
            } else {
                _list lbAdd _displayName;
            };

            _list lbSetData [(lbSize _list)-1,_className];
            _list lbSetValue [(lbSize _list)-1,_price];
            _list lbSetPicture [(lbSize _list)-1,_pic];
        };
    };
    
    true

} count _configArray;
