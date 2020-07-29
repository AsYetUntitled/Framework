#include "..\..\script_macros.hpp"
/*
    File: fn_tazed.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the tazed animation and broadcasts out what it needs to.
*/

params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || {isNull _shooter}) exitWith {
    player allowDamage true;
    life_istazed = false;
};

if (_shooter isKindOf "Man" && {alive player}) then {
    if (!life_istazed) then {
        life_istazed = true;
        private _curWep = currentWeapon player;
        private _curMags = magazines player;
        private _attach = if (!(primaryWeapon player isEqualTo "")) then {primaryWeaponItems player} else {[]};

        {
            player removeMagazine _x
        } count _curMags;

        player removeWeapon _curWep;
        player addWeapon _curWep;
        if (!(_attach isEqualTo []) && {!(primaryWeapon player isEqualTo "")}) then {
            {
                _unit addPrimaryWeaponItem _x;
            } count _attach;
        };

        if !(_curMags isEqualTo []) then {
            {
                player addMagazine _x;
            } count _curMags;
        };
        [_unit,"tazerSound",100,1] remoteExecCall ["life_fnc_say3D",RCLIENT];

        private _obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL (visiblePositionASL player);
        _obj setPosATL ASLTOATL (visiblePositionASL player);

        [player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        [0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        _unit attachTo [_obj,[0,0,0]];
        disableUserInput true;
        sleep 15;

        [player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];

        if !(player getVariable ["Escorting",false]) then {
            detach player;
        };

        life_istazed = false;
        player allowDamage true;
        disableUserInput false;
    };
} else {
    _unit allowDamage true;
    life_istazed = false;
};
