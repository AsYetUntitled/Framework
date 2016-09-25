#include "..\..\script_macros.hpp"
/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Impounds the vehicle
*/
private ["_vehicle","_owner","_room","_cfgType","_type","_time","_value","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_impoundValue","_price","_impoundMultiplier"];
_vehicle = param [0,objNull,[objNull]];
_filters = ["Car","Air","Ship"];
if (!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if (player distance cursorObject > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};

_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
_price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
[0,"STR_NOTF_BeingImpounded",true,[((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
life_action_inUse = true;
_uid =  (_vehicleData select 0) select 0;
_owner = (playableUnits select {getPlayerUID _x isEqualTo _uid});
_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

//Check if the vehicle can be stored
_vInfo = _vehicle getVariable ["dbInfo",[]];
if (!isNull _owner && (count _vInfo > 0)) then {
    private ["_sel","_type"];
_cfgType = switch (side _owner) do { case east:{"garage_limit_OPFOR"}; case west:{"garage_limit_COP"};case civilian: {"garage_limit_CIVILIAN"};case independent:  { "garage_limit_MEDIC" }; };
_type = [_vehicle] call life_fnc_vehicleKind;
switch (_type) do {
case "Air" : {_sel = 0;};
case "Car" : {_sel = 1;};
case "Ship" : {_sel = 2;};
};
_vehiclesLimit = LIFE_SETTINGS(getNumber, _cfgType);
_vehiclesCount = (_owner getVariable "counts") select _sel; } else { _vehiclesCount = 0; };
_room = _vehiclesCount < _vehiclesLimit;

if (!_room && (count _vInfo > 0)) exitWith {
                _box = [
                    localize "STR_NOTF_ImpoundLimit",
                    localize "STR_NOTF_Impounding",
                    localize "STR_Global_Yes", //Sequestra
                    localize "STR_Global_No"//Non sequestrare
                ] call BIS_fnc_guiMessage;

                if (_box) exitWith {_vehicle setPos [0,0,0]; sleep 0.5; _vehicle setDamage 1;[2,"Impound complete",false] call life_fnc_broadcast; } else { [2,"Impound Aborted",false] call life_fnc_broadcast; };

};





for "_i" from 0 to 1 step 0 do {
    sleep 0.09;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if (_cP >= 1) exitWith {};
    if (player distance _vehicle > 10) exitWith {};
    if (!alive player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];

if (player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; life_action_inUse = false;};
if (!alive player) exitWith {life_action_inUse = false;};

if (count crew _vehicle isEqualTo 0) then {
    if (!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
    _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

    life_impound_inuse = true;

    if (life_HC_isActive) then {
        [_vehicle,true,player,_text] remoteExec ["HC_fnc_vehicleStore",HC_Life];
    } else {
        [_vehicle,true,player,_text] remoteExec ["TON_fnc_vehicleStore",RSERV];
    };

    waitUntil {!life_impound_inuse};
    if (playerSide isEqualTo west) then {
            _impoundMultiplier = LIFE_SETTINGS(getNumber,"vehicle_cop_impound_multiplier");
            _value = _price * _impoundMultiplier;
            [0,"STR_NOTF_HasImpounded",true,[profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
            if (_vehicle in life_vehicles) then {
                hint format [localize "STR_NOTF_OwnImpounded",[_value] call life_fnc_numberText,_type];
                BANK = BANK - _value;
            } else {
                hint format [localize "STR_NOTF_Impounded",_type,[_value] call life_fnc_numberText];
                BANK = BANK + _value;
            };
            if (BANK < 0) then {BANK = 0;};
            [1] call SOCK_fnc_updatePartial;
    };
} else {
    hint localize "STR_NOTF_ImpoundingCancelled";
};

life_action_inUse = false;