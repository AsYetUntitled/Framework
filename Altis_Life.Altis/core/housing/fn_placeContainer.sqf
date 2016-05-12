#include "..\..\script_macros.hpp"
/*
    File: fn_placeContainer.sqf
    Author: NiiRoZz
    Credits: BoGuu

    Description:
    Check container if are in house and if house are owner of player and if all this conditions are true add container in database
*/
private["_container","_isFloating","_number","_type","_house","_containers","_houseCfg","_message","_isPlaced"];
params [
        ["_container",ObjNull,[ObjNull]],
        ["_isFloating",true,[true]]
];

_number = 1;
_uid = getPlayerUID player;
_house = nearestObject [player, "House"];

switch (true) do {
    case (typeOf _container isEqualTo "B_supplyCrate_F"): {_type = "storagebig"};
    case (typeOf _container isEqualTo "Box_IND_Grenades_F") : {_type = "storagesmall"};
    default {_type = ""};
};

_message = 0;
_isPlaced = false;
if (!isNull _house) then {
    _message = 1;
    if (([player] call life_fnc_PlayerInBuilding) && {([_container] call life_fnc_PlayerInBuilding)}) then {
        _message = 2;
        if ((_house in life_vehicles) || !(isNil {_house getVariable "house_owner"})) then {
            _message = 3;
            if (!_isFloating) then {
                _message = 4;
                _containers = _house getVariable ["containers",[]];
                _houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
                if (_houseCfg isEqualTo []) exitWith {};
                if (count _containers < (_houseCfg select 1)) then {
                    _isPlaced = true;
                    if (life_HC_isActive) then {
                        [_uid,_container] remoteExec ["HC_fnc_addContainer",HC_Life];
                    } else {
                        [_uid,_container] remoteExec ["TON_fnc_addContainer",RSERV];
                    };
                    _container setVariable ["Trunk",[[],0],true];
                    _container setVariable ["container_owner",[_uid],true];
                    _containers pushBack _container;
                    _house setVariable["containers",_containers,true];
                    sleep 1;
                    [_container] remoteExecCall ["life_fnc_simDisable",RANY];
                };
            };
        };
    };
};

if (_isPlaced) exitWith {};

if (_message == 0 || _message == 1) then {
    deleteVehicle _container;
    [true,_type,_number] call life_fnc_handleInv;
    hint localize "STR_House_Container_House_Near";
};
if (_message == 2) then {
    deleteVehicle _container;
    [true,_type,_number] call life_fnc_handleInv;
    hint localize "STR_House_Container_House_Near_Owner";
};
if (_message == 3) then {
    deleteVehicle _container;
    [true,_type,_number] call life_fnc_handleInv;
    hint localize "STR_House_Container_Floating";
};
if (_message == 4) then {
    deleteVehicle _container;
    [true,_type,_number] call life_fnc_handleInv;
    hint localize "STR_ISTR_Box_HouseFull";
};
