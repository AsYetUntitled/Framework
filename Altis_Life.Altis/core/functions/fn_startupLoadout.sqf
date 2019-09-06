/*
    File: fn_startupLoadout.sqf
    Author: Casperento

    Description:
    Loads a custom loadout on player
*/
private _loadOutCfg = getArray(missionConfigFile >> "LifeStartupLoadouts" >> str(side player) >> "life_loadOutItens");
private _commonItens = getArray(missionConfigFile >> "LifeStartupLoadouts" >> "commonItens");
private _pCloth = if ((_loadOutCfg select 0) isEqualType [] && !((_loadOutCfg select 0) isEqualTo [] || (_loadOutCfg select 0) select 0 isEqualTo "")) then {selectRandom (_loadOutCfg select 0)} else {(_loadOutCfg select 0)};

if !(life_is_arrested) then {player addUniform _pCloth;};
if !((_loadOutCfg select 1) isEqualTo "") then {player addVest (_loadOutCfg select 1);};
if !((_loadOutCfg select 2) isEqualTo "") then {player addBackpack (_loadOutCfg select 2);};
if !((_loadOutCfg select 3) isEqualTo "") then {player addWeapon (_loadOutCfg select 3);};
if !((_loadOutCfg select 4) select 0 isEqualTo "" || {(_loadOutCfg select 4) select 1 isEqualTo 0}) then {
    (_loadOutCfg select 4) apply {player addMagazines [_x select 0, _x select 1]};
};
if !((_loadOutCfg select 5) isEqualTo []) then {
    {
        _x apply {
            if ((_x select 1) > 0) then {for "_i" from 1 to (_x select 1) step 1 do {player addItem (_x select 0)};};
        };
    } count (_loadOutCfg select 5);
};
if !(_commonItens isEqualTo []) then {
    _commonItens apply {
        if !(_x isEqualTo "") then {
            player linkItem _x;
        };
    };
};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;