#include "..\..\script_macros.hpp"
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends specific information to the server to update on the player,
    meant to keep the network traffic down with large sums of data flowing
    through remoteExec
*/
params [
    ["_mode",0,[0]]
];
private _packet = [player,_mode];

switch (_mode) do {
    case 0: {
        _packet pushBack CASH;
    };

    case 1: {
        _packet pushBack BANK;
    };

    case 2: {
        private _array = [];
        private _flag = switch (playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
        {
            _varName = LICENSE_VARNAME(configName _x,_flag);
            _array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
        } forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

        _packet pushBack _array;
    };

    case 3: {
        [] call life_fnc_saveGear;
        _packet pushBack life_gear;
    };

    case 4: {
        //old location
    };

    case 5: {
        _packet pushBack life_is_arrested;
    };

    case 6: {
        _packet pushBack CASH;
        _packet pushBack BANK;
    };

    case 7: {
        // Tonic is using for keychain..?
    };
};

if (life_HC_isActive) then {
    _packet remoteExecCall ["HC_fnc_updatePartial",HC_Life];
} else {
    _packet remoteExecCall ["DB_fnc_updatePartial",RSERV];
};
