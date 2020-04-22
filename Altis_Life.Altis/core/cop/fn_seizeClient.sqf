#include "..\..\script_macros.hpp"
/*
    File: fn_seizeClient.sqf
    Author: Daniel "Skalicon" Larusso

    Description:
    Removes the players weapons client side
*/

private _exempt = LIFE_SETTINGS(getArray,"seize_exempt");
private _headgear = LIFE_SETTINGS(getArray,"seize_headgear");
private _vest = LIFE_SETTINGS(getArray,"seize_vest");
private _uniform = LIFE_SETTINGS(getArray,"seize_uniform");

{
    if !(_x in _exempt) then {
        player removeWeapon _x;
    };
    true
} count weapons player;

{
    if !(_x in _exempt) then {
        player removeItemFromUniform _x;
    };
    true
} count uniformItems player;

{
    if !(_x in _exempt) then {
        player removeItemFromVest _x;
    };
    true
} count vestItems player;

{
    if !(_x in _exempt) then {
        player removeItemFromBackpack _x;
    };
    true
} count backpackItems player;

{
    if !(_x in _exempt) then {
        player removeMagazine _x;
    };
    true
} count magazines player;

if (uniform player in _uniform) then {
    removeUniform player;
};
if (vest player in _vest) then {
    removeVest player;
};
if (headgear player in _headgear) then {
    removeHeadgear player;
};

[] call SOCK_fnc_updateRequest;
titleText[localize "STR_NOTF_SeizeIllegals","PLAIN"];
