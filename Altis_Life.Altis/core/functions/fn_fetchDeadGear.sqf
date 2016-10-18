#include "..\..\script_macros.hpp"
/*
    File: fn_fetchDeadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Fetches gear off of a body.
*/

private _unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {};
private _primitems = [];
private _secitems = [];
private _handgunitems = [];
private _dropWeapons = LIFE_SETTINGS(getNumber,"Drop_weapons");
private _primary = [primaryWeapon _unit, ""] select _dropWeapons;
private _launcher = [secondaryWeapon _unit, ""] select _dropWeapons;
private _handgun = [handGunWeapon _unit, ""] select _dropWeapons;
private _magazines = [];
private _uniform = uniform _unit;
private _vest = vest _unit;
private _backpack = backpack _unit;
private _items = assignedItems _unit;
if (!(primaryWeapon _unit isEqualTo "")) then {_primitems = primaryWeaponItems _unit;};
if (!(handgunWeapon _unit isEqualTo "")) then {_handgunItems = handgunItems _unit;};
private _headgear = headgear _unit;
private _goggles = goggles _unit;
private _uitems = [];
private _vitems = [];
private _bitems = [];
if (_uniform != "") then {{_uitems pushBack _x;} forEach (uniformItems _unit);};
if (_vest != "") then {{_vitems pushBack _x;} forEach (vestItems _unit);};
if (_backpack != "") then {{_bitems pushBack _x;} forEach (backPackItems _unit);};

if (!(primaryWeapon _unit isEqualTo "")) then {
    _unit selectWeapon (primaryWeapon _unit);
    if (!(currentMagazine _unit isEqualTo "")) then {
        _magazines pushBack currentMagazine _unit;
    };
};

if (!(secondaryWeapon _unit isEqualTo "")) then {
    _unit selectWeapon (secondaryWeapon _unit);
    if (!(currentMagazine _unit isEqualTo "")) then {
        _magazines pushBack currentMagazine _unit;
    };
};

if (!(handgunWeapon _unit isEqualTo "")) then {
    _unit selectWeapon (handgunWeapon _unit);
    if (!(currentMagazine _unit isEqualTo "")) then {
        _magazines pushBack currentMagazine _unit;
    };
};
_unit selectWeapon (primaryWeapon _unit);

if (isNil "_handgunItems") then {_handgunItems = ["","",""];};
[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];
