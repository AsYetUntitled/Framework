#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehTakeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
    if the player has room.
*/
disableSerialization;
if (isNull life_trunk_vehicle || !alive life_trunk_vehicle) exitWith {hint localize "STR_MISC_VehDoesntExist"};
if (!alive player) exitWith {closeDialog 0;};
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith {  closeDialog 0; hint localize "STR_MISC_VehInvUse"; };

if ((lbCurSel 3502) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection";};
private _ctrl = ctrlSelData(3502);
private _num = ctrlText 3505;
if (!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
private _num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_MISC_Under1";};

private _index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call TON_fnc_index;
private _data = (life_trunk_vehicle getVariable "Trunk") select 0;
private _old = life_trunk_vehicle getVariable "Trunk";
if (_index isEqualTo -1) exitWith {};
private _value = _data select _index select 1;
if (_num > _value) exitWith {hint localize "STR_MISC_NotEnough"};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if (_ctrl == "money") then {
    if (_num == _value) then {
        _data deleteAt _index;
    } else {
        _data set[_index,[_ctrl,(_value - _num)]];
    };

    CASH = CASH + _num;
    [0] call SOCK_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
} else {
    if ([true,_ctrl,_num] call life_fnc_handleInv) then {
        if (_num == _value) then {
            _data deleteAt _index;
        } else {
            _data set[_index,[_ctrl,(_value - _num)]];
        };
        life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
        [life_trunk_vehicle] call life_fnc_vehInventory;
    } else {
        hint localize "STR_NOTF_InvFull";
    };
};
