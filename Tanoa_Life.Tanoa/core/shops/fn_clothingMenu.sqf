#include "..\..\script_macros.hpp"
/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/

params ["","","",["_shop","",[""]]];

if (_shop isEqualTo "") exitWith {};
if !(isNull objectParent player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

/* License check & config validation */
if !(isClass(missionConfigFile >> "Clothing" >> _shop)) exitWith {}; //Bad config entry.

private _shopTitle = M_CONFIG(getText,"Clothing",_shop,"title");
private _shopSide = M_CONFIG(getText,"Clothing",_shop,"side");
private _conditions = M_CONFIG(getText,"Clothing",_shop,"conditions");

private _exit = false;

private "_flag";

if !(_shopSide isEqualTo "") then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; default {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

_exit = [_conditions] call life_fnc_levelCheck;
if !(_exit) exitWith {hint localize "STR_Shop_Veh_NoLicense";};

//Save old inventory
life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;

/* Open up the menu */
createDialog "Life_Clothing";
disableSerialization;

ctrlSetText [3103,localize _shopTitle];

(findDisplay 3100) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0; [] call life_fnc_playerSkins;}"]; //Fix Custom Skin after ESC

sliderSetRange [3107, 0, 360];

//Cop / Civ Pre Check
if (_shop in ["bruce","dive","reb","kart"] && {!(playerSide isEqualTo civilian)}) exitWith {hint localize "STR_Shop_NotaCiv"; closeDialog 0;};
if (_shop == "reb" && {!license_civ_rebel}) exitWith {hint localize "STR_Shop_NotaReb"; closeDialog 0;};
if (_shop == "cop" && {!(playerSide isEqualTo west)}) exitWith {hint localize "STR_Shop_NotaCop"; closeDialog 0;};
if (_shop == "dive" && {!license_civ_dive}) exitWith {hint localize "STR_Shop_NotaDive"; closeDialog 0;};


private ["_pos","_oldPos","_oldDir","_oldBev","_testLogic","_nearVeh","_light"];
private ["_ut1","_ut2","_ut3","_ut4","_ut5"];

if (LIFE_SETTINGS(getNumber,"clothing_noTP") isEqualTo 1) then {
    _pos = getPosATL player;
} else {
    if (LIFE_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        _pos = [1000,1000,10000];
    } else {
        _pos = switch _shop do {
            case "reb": {[13590,12214.6,0.00141621]};
            case "cop": {[12817.5,16722.9,0.00151062]};
            case "kart": {[14120.5,16440.3,0.00139236]};
            default {[17088.2,11313.6,0.00136757]};
        };
    };

    _oldDir = getDir player;
    _oldPos = visiblePositionASL player;
    _oldBev = behaviour player;

    _testLogic = "Logic" createVehicleLocal _pos;
    _testLogic setPosATL _pos;

    _nearVeh = _testLogic nearEntities ["AllVehicles", 20];

    if (LIFE_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        _ut1 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,5,10]);
        _ut1 attachTo [_testLogic,[0,5,5]];
        _ut1 setDir 0;
        _ut2 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [5,0,10]);
        _ut2 attachTo [_testLogic,[5,0,5]];
        _ut2 setDir (getDir _testLogic) + 90;
        _ut3 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [-5,0,10]);
        _ut3 attachTo [_testLogic,[-5,0,5]];
        _ut3 setDir (getDir _testLogic) - 90;
        _ut4 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,-5,10]);
        _ut4 attachTo [_testLogic,[0,-5,5]];
        _ut4 setDir 180;
        _ut5 = "UserTexture10m_F" createVehicleLocal (_testLogic modelToWorld [0,0,10]);
        _ut5 attachTo [_testLogic,[0,0,0]];
        _ut5 setObjectTexture [0,"a3\map_data\gdt_concrete_co.paa"];
        detach _ut5;
        _ut5 setVectorDirAndUp [[0,0,-.33],[0,.33,0]];
    };

    _light = "#lightpoint" createVehicleLocal _pos;
    _light setLightBrightness 0.5;
    _light setLightColor [1,1,1];
    _light setLightAmbient [1,1,1];
    _light lightAttachObject [_testLogic, [0,0,0]];

    {
        if (_x != player) then {_x hideObject true;};
        true
    } count playableUnits;
    
    if (LIFE_SETTINGS(getNumber,"clothing_box") isEqualTo 0) then {
        {
            if (_x != player && _x != _light) then {_x hideObject true;};
            true
        } count _nearVeh;
    };

    if (LIFE_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        {
            _x setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,1)"];
            true
        } count [_ut1,_ut2,_ut3,_ut4];
    };

    player setBehaviour "SAFE";
    if (_shop == "dive") then {
        player setPosATL [-1000, -1000, 10];
        sleep 0.0005;
    };
    player attachTo [_testLogic,[0,0,0]];
    player switchMove "";
    player setDir 360;
};

life_clothing_store = _shop;

/* Store license check */
if (isClass(missionConfigFile >> "Licenses" >> life_clothing_store)) then {
    _flag = M_CONFIG(getText,"Licenses",life_clothing_store,"side");
    _displayName = M_CONFIG(getText,"Licenses",life_clothing_store,"displayName");
    if !(LICENSE_VALUE(life_clothing_store,_flag)) exitWith {
        hint format [localize "STR_Shop_YouNeed",localize _displayName];
        closeDialog 0;
    };
};

//initialize camera view
life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;
life_cMenu_lock = false;

if (isNull (findDisplay 3100)) exitWith {};

private _list = (findDisplay 3100) displayCtrl 3101;
private _filter = (findDisplay 3100) displayCtrl 3105;
lbClear _filter;
lbClear _list;

_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

[] call life_fnc_playerSkins;

waitUntil {isNull (findDisplay 3100)};
if (LIFE_SETTINGS(getNumber,"clothing_noTP") isEqualTo 0) then {
    {
        if (_x != player) then {_x hideObject false;};
        true
    } count playableUnits;
    if (LIFE_SETTINGS(getNumber,"clothing_box") isEqualTo 0) then {
        {
            if (_x != player && _x != _light) then {_x hideObject false;};
            true
        } count _nearVeh;
    };
    detach player;
    player setBehaviour _oldBev;
    player setPosASL _oldPos;
    player setDir _oldDir;
    if (LIFE_SETTINGS(getNumber,"clothing_box") isEqualTo 1) then {
        {
            deleteVehicle _x;
        } count [_testLogic,_ut1,_ut2,_ut3,_ut4,_ut5,_light];
    } else {
        {
            deleteVehicle _x;
            true
        } count [_testLogic,_light];
    };
};
life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;
life_clothing_filter = 0;
if (isNil "life_clothesPurchased") exitWith {
    life_clothing_purchase = [-1,-1,-1,-1,-1];
    if !(life_oldClothes isEqualTo "") then {player addUniform life_oldClothes;} else {removeUniform player};
    if !(life_oldHat isEqualTo "") then {player addHeadgear life_oldHat} else {removeHeadgear player;};
    if !(life_oldGlasses isEqualTo "") then {player addGoggles life_oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (life_oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            clearAllItemsFromBackpack player;
            if (count life_oldBackpackItems > 0) then {
                {
                    [_x,true,true] call life_fnc_handleItem;
                    true
                } count life_oldBackpackItems;
            };
        };
    };

    if (count life_oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call life_fnc_handleItem;
            true
        } count life_oldUniformItems;
    };

    if (vest player != "") then {
        if (life_oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest life_oldVest;
            if (count life_oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call life_fnc_handleItem;
                    true
                } count life_oldVestItems;
            };
        };
    };
    [] call life_fnc_playerSkins;
};
life_clothesPurchased = nil;

//Check uniform purchase.
if ((life_clothing_purchase select 0) isEqualTo -1) then {
    if (life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if ((life_clothing_purchase select 1) isEqualTo -1) then {
    if (life_oldHat != headgear player) then {
        if (life_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear life_oldHat;
        };
    };
};
//Check glasses
if ((life_clothing_purchase select 2) isEqualTo -1) then {
    if (life_oldGlasses != goggles player) then {
        if (life_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles life_oldGlasses;
        };
    };
};
//Check Vest
if ((life_clothing_purchase select 3) isEqualTo -1) then {
    if (life_oldVest != vest player) then {
        if (life_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest life_oldVest;
            {
                [_x,true,false,false,true] call life_fnc_handleItem;
                true
            } count life_oldVestItems;
        };
    };
};

//Check Backpack
if ((life_clothing_purchase select 4) isEqualTo -1) then {
    if (life_oldBackpack != backpack player) then {
        if (life_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            {
                [_x,true,true] call life_fnc_handleItem;
                true
            } count life_oldBackpackItems;
        };
    };
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
[] call life_fnc_saveGear;
