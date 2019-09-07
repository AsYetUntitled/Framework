/*
    File: fn_startLoadout.sqf
    Author: Casperento

    Description:
    Loads a custom loadout on player
*/
private _loadOutCfg = getArray(missionConfigFile >> "Loadouts" >> str(side player) >> "loadOut");

_loadOutCfg params [
    ["_pCloth","",["",[]]],
    "_pVest",
    "_pBackpack",
    "_pWeapon",
    ["_pMagazines",[],[[]]],
    ["_pItems",[],[[]]]
];

private _commonItems = getArray(missionConfigFile >> "Loadouts" >> "commonItems");

_pCloth = if (_pCloth isEqualType [] && !(_pCloth isEqualTo [])) then {selectRandom _pCloth} else {_pCloth};
if !(life_is_arrested) then {
    if !(_pCloth isEqualTo "") then {player addUniform _pCloth;};
};
if !(_pVest isEqualTo "") then {player addVest _pVest;};
if !(_pBackpack isEqualTo "") then {player addBackpack _pBackpack;};
if !(_pWeapon isEqualTo "") then {player addWeapon _pWeapon;};
if (_pMagazines isEqualType [] && !(_pMagazines select 0 isEqualTo "") && !(_pMagazines isEqualTo [])) then {
    _pMagazines apply {
        if ((_x select 1) > 0) then {
            player addMagazines [(_x select 0),(_x select 1)];
        };
    };
};
if !(_pItems isEqualTo []) then {
    {
        if (((_x select 1) > 0) && !((_x select 0) isEqualTo "")) then {
            for "_i" from 1 to (_x select 1) step 1 do {player addItem (_x select 0)};
        };
    } count _pItems;
};
if !(_commonItems isEqualTo []) then {
    _commonItems apply {
        if !(_x isEqualTo "") then {
            player linkItem _x;
        };
    };
};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;