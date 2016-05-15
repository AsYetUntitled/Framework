#include "..\..\script_macros.hpp"
/*
    File: fn_seizeClient.sqf
    Author: Daniel "Skalicon" Larusso

    Description:
    Removes the players weapons client side
*/
private ["_exempt","_uniform","_vest","_headgear"];
_exempt = LIFE_SETTINGS(getArray,"seize_exempt");
_headgear = LIFE_SETTINGS(getArray,"seize_headgear");
_vest = LIFE_SETTINGS(getArray,"seize_vest");
_uniform = LIFE_SETTINGS(getArray,"seize_uniform");

{
    if (!(_x in _exempt)) then {
        player removeWeapon _x;
    };
} forEach weapons player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromUniform _x;
    };
} forEach uniformItems player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromVest _x;
    };
} forEach vestItems player;

{
    if (!(_x in _exempt)) then {
        player removeItemFromBackpack _x;
    };
} forEach backpackItems player;

{
    if (!(_x in _exempt)) then {
            player removeMagazine _x;
    };
} forEach magazines player;

if (uniform player in _uniform) then {removeUniform player;};
if (vest player in _vest) then {removeVest player;};
if (headgear player in _headgear) then {removeHeadgear player;};

[] call SOCK_fnc_updateRequest;
titleText[localize "STR_NOTF_SeizeIllegals","PLAIN"];
