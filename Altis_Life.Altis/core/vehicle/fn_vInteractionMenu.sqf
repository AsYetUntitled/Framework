#include "..\..\script_macros.hpp"
/*
    File: fn_vInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass add actions for various vehicle actions.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Title 37401
private ["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_id"];
if (!dialog) then {
    createDialog "vInteraction_Menu";
};
disableSerialization;

_curTarget = param [0,objNull,[objNull]];
if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if ((_curTarget isKindOf "landVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
life_vInact_curTarget = _curTarget;
_id = getObjectDLC _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck; closeDialog 0;";

if ((life_inv_toolkit >= 1) && {alive life_vInact_curTarget} && {([life_vInact_curTarget] call life_fnc_isDamaged)}) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

if (playerSide isEqualTo west) then {
    _Btn2 ctrlSetText localize "STR_vInAct_Registration";
    _Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction; closeDialog 0;";

    _Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
    _Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch; closeDialog 0;";

    _Btn4 ctrlSetText localize "STR_vInAct_PullOut";
    _Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction; closeDialog 0;";
    if (crew _curTarget isEqualTo []) then {_Btn4 ctrlEnable false;};

    _Btn5 ctrlSetText localize "STR_vInAct_Impound";
    _Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";

    if (_curTarget isKindOf "Ship") then {
        _Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
        _Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
        if (_curTarget isKindOf "Ship" && {local _curTarget} && {crew _curTarget isEqualTo []}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
    } else {
        if (!isNil "_id") then {
            if !(_id in getDLCs 1) then {
                _Btn6 ctrlSetText localize "STR_vInAct_GetInVehicle";
                _Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
                if (crew _curTarget isEqualTo [] && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
            };
        } else {
            _Btn6 ctrlSetText localize "STR_vInAct_Unflip";
            _Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
            if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
        };
    };

} else {

    if (_curTarget isKindOf "Ship") then {
        _Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
        _Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
        if (alive _curTarget && {_curTarget isKindOf "Ship"} && {local _curTarget} && {crew _curTarget isEqualTo []}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
    } else {
        if (!isNil "_id") then {
            if !(_id in getDLCs 1) then {
                _Btn2 ctrlSetText localize "STR_vInAct_GetInVehicle";
                _Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
                if (crew _curTarget isEqualTo [] && {canMove _curTarget} && {locked _curTarget isEqualTo 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
            };
        } else {
            _Btn2 ctrlSetText localize "STR_vInAct_Unflip";
            _Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
            if (alive _curTarget && {crew _curTarget isEqualTo []} && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
        };
    };
    if (typeOf _curTarget == "O_Truck_03_device_F") then {
        _Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
        _Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
        if (!isNil {(_curTarget getVariable "mining")} || !local _curTarget && {_curTarget in life_vehicles}) then {
            _Btn3 ctrlEnable false;
        } else {
            _Btn3 ctrlEnable true;
        };
    } else {
        _Btn3 ctrlShow false;
        if (typeOf (_curTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"] && _curTarget in life_vehicles) then {
            if (!isNil {_curTarget getVariable "fuelTankWork"}) then {
                _Btn3 ctrlSetText localize "STR_FuelTank_Stop";
                _Btn3 buttonSetAction "life_vInact_curTarget setVariable [""fuelTankWork"",nil,true]; closeDialog 0;";
                _Btn3 ctrlShow true;
            } else {
                if (count (nearestObjects [_curTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 15]) > 0) then {
                    _Btn3 ctrlSetText localize "STR_FuelTank_Supply";
                    _Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelSupply";
                    _Btn3 ctrlShow true;
                }else{
                    {
                        if (player distance (getMarkerPos _x) < 20) exitWith {
                            _Btn3 ctrlSetText localize "STR_FuelTank_Store";
                            _Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_fuelStore";
                            _Btn3 ctrlShow true;
                        };
                    } forEach ["fuel_storage_1","fuel_storage_2"];
                };
            };
        };
    };

    _Btn4 ctrlShow false;
    _Btn5 ctrlShow false;
    _Btn6 ctrlShow false;
};
