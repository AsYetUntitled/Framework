#include "..\..\script_macros.hpp"
/*
    File: fn_safeInventory.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Fills up the safes inventory.
*/
params [
    ["_safe",objNull,[objNull]]
];
if (isNull _safe) exitWith {closeDialog 0;};
disableSerialization;

private _tInv = (findDisplay 3500) displayCtrl 3502;
lbClear _tInv;

private _safeInfo = _safe getVariable ["safe",-1];
if (_safeInfo < 1) exitWith {closeDialog 0; hint localize "STR_Civ_VaultEmpty";};

private _str = M_CONFIG(getText,"VirtualItems","goldbar","displayName");
private _shrt = M_CONFIG(getText,"VirtualItems","goldbar","variable");
private _tInv lbAdd format ["[%1] - %2",_safeInfo,localize _str];
_tInv lbSetData [(lbSize _tInv)-1,_shrt];
private _icon = M_CONFIG(getText,"VirtualItems","goldbar","icon");
if !(_icon isEqualTo "") then {
    _tInv lbSetPicture [(lbSize _tInv)-1,_icon];
};
