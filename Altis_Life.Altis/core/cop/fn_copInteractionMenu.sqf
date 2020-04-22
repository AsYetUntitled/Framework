#include "..\..\script_macros.hpp"
/*
    File: fn_copInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass addactions for various cop actions towards another player.
*/

#define BTN_1 37450
#define BTN_2 37451
#define BTN_3 37452
#define BTN_4 37453
#define BTN_5 37454
#define BTN_6 37455
#define BTN_7 37456
#define BTN_8 37457
#define TITLE 37401

params [
    ["_curTarget", objNull, [objNull]]
];

disableSerialization;

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget || {player distance _curTarget > 4}) exitWith {
        closeDialog 0;
    };
    if (!isPlayer _curTarget && {side _curTarget isEqualTo civilian}) exitWith {
        closeDialog 0;
    };
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

private _display = findDisplay 37400;
private _btn1 = _display displayCtrl BTN_1;
private _btn2 = _display displayCtrl BTN_2;
private _btn3 = _display displayCtrl BTN_3;
private _btn4 = _display displayCtrl BTN_4;
private _btn5 = _display displayCtrl BTN_5;
private _btn6 = _display displayCtrl BTN_6;
private _btn7 = _display displayCtrl BTN_7;
private _btn8 = _display displayCtrl BTN_8;

life_pInact_curTarget = _curTarget;
private _seizeRank = LIFE_SETTINGS(getNumber,"seize_minimum_rank");

if (player getVariable ["isEscorting",false]) then {
    {
        _x ctrlShow false;
    } count [_btn1,_btn2,_btn3,_btn5,_btn6,_btn7,_btn8];
};

//Set Unrestrain Button
_btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_btn2 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",life_pInact_curTarget]; closeDialog 0;";

//Set Search Button
_btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
if (player getVariable ["isEscorting",false]) then {
    _btn4 ctrlSetText localize "STR_pInAct_StopEscort";
    _btn4 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _btn4 ctrlSetText localize "STR_pInAct_Escort";
    _btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Ticket Button
_btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_btn6 ctrlSetText localize "STR_pInAct_Arrest";
_btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction; closeDialog 0;";
_btn6 ctrlEnable false;

_btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//SeizeWeapons Button
_btn8 ctrlSetText localize "STR_pInAct_Seize";
_btn8 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_seizePlayerAction; closeDialog 0;";

if (FETCH_CONST(life_coplevel) < _seizeRank) then {_btn8 ctrlEnable false;};

{
    if (player distance (getMarkerPos _x) < 30) exitWith {
        _btn6 ctrlEnable true;
    };
    true
} count LIFE_SETTINGS(getArray,"sendtoJail_locations");
