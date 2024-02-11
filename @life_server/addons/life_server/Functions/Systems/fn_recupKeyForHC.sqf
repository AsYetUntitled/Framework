#include "\life_server\script_macros.hpp"
/*
    File: fn_recupKeyForHC.sqf
    Author : NiiRoZz

    Description:
    Tells the server to recup the Key of player
*/
private ["_uid","_side"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
if (_uid isEqualTo "") exitWith {}; //NULL
_keyArr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
[_keyArr] remoteExecCall ["HC_fnc_receivekeyofServer",HC_Life];
