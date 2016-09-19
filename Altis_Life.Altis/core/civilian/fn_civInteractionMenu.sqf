#include "..\..\script_macros.hpp"
/*
    File: fn_copInteractionMenu.sqf
    Author: Yeiij

    Description: allow civilian scorting action on arrested players
*/
#define Btn1 37450
#define Title 37401

private ["_display","_Btn1"];
disableSerialization;
params[
    ["_curTarget", objNull,[objNull]]
];


if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
life_pInact_curTarget = _curTarget;

if (player getVariable ["isEscorting",false]) then {
    _Btn1 ctrlShow false;
};

//Set Escort Button
if (player getVariable ["isEscorting",false]) then {
    _Btn1 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn1 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn1 ctrlSetText localize "STR_pInAct_Escort";
    _Btn1 buttonSetAction "[life_pInact_curTarget,true] call life_fnc_escortAction; closeDialog 0;";
};
