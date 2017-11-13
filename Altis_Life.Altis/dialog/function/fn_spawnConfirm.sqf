/*
    File: fn_spawnConfirm.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Spawns the player where he selected.
*/
closeDialog 0;
cutText ["","BLACK IN"];
if (life_spawn_point isEqualTo []) then {
    private _spCfg = [playerSide] call life_fnc_spawnPointCfg;
    _spCfg params [["_sp",[],[[]]]];

    if (playerSide isEqualTo civilian) then {
        if (isNil {(call compile format ["%1",_sp select 0])}) then {
            player setPos (getMarkerPos (_sp select 0));
        } else {
            private _spawnPos = (call compile format ["%1",_sp select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (_sp select 0));
    };
    titleText[format ["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
} else {
    if (playerSide isEqualTo civilian) then {
        if (isNil {(call compile format ["%1",life_spawn_point select 0])}) then {
            if (["house",life_spawn_point select 0] call BIS_fnc_inString) then {
                private _house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
                private _bPos = [_house] call life_fnc_getBuildingPositions;

                if (_bPos isEqualTo []) exitWith {
                    player setPos (getMarkerPos (life_spawn_point select 0));
                };

                {_bPos = _bPos - [(_house buildingPos _x)];} forEach (_house getVariable ["slots",[]]);
                private _pos = _bPos call BIS_fnc_selectRandom;
                player setPosATL _pos;
            } else {
                player setPos (getMarkerPos (life_spawn_point select 0));
            };
        } else {
            private _spawnPos = (call compile format ["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (life_spawn_point select 0));
    };
    titleText[format ["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

if (life_firstSpawn) then {
    life_firstSpawn = false;
    [] call life_fnc_welcomeNotification;
};
[] call life_fnc_playerSkins;
[] call life_fnc_hudSetup;