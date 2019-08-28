/*
    File: fn_startupLoadout
    Author: Casperento

    Description:
    Loads a custom loadout on player
*/
private _loadOutCfg = getArray(missionConfigFile >> "LifeStartupLoadouts" >> (side player) >> "life_loadOutItens");
private _commonItens = getArray(missionConfigFile >> "LifeStartupLoadouts" >> "commonItens");
private _pCloth = if ((_loadOutCfg select 0) isEqualType [] && !((_loadOutCfg select 0) isEqualTo [] || (_loadOutCfg select 0) select 0 isEqualTo "")) then {selectRandom (_loadOutCfg select 0)} else {(_loadOutCfg select 0)};

if !(life_is_arrested) then {player addUniform _pCloth;};
if !((_loadOutCfg select 1) isEqualTo "") then {player addVest (_loadOutCfg select 1);};
if !((_loadOutCfg select 2) isEqualTo "") then {player addBackpack (_loadOutCfg select 2);};
if !((_loadOutCfg select 3) isEqualTo "") then {player addWeapon (_loadOutCfg select 3);};
if !((_loadOutCfg select 4) select 0 isEqualTo "" || {(_loadOutCfg select 4) select 1 isEqualTo 0}) then {
    for "_i" from 1 to ((_loadOutCfg select 4) select 1) step 1 do {player addMagazine ((_loadOutCfg select 4) select 0);};
};
if !((_loadOutCfg select 5) isEqualTo []) then {
    for "_i" from 0 to count(_loadOutCfg select 5)-1 step 1 do {
        for "_j" from 1 to (((_loadOutCfg select 5) select _i) select 1) step 1 do {
            player addItem (((_loadOutCfg select 5) select _i) select 0);
        };
    };
};
for "_i" from 0 to (count _commonItens)-1 do {player linkItem (_commonItens select _i);};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;