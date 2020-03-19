/*
    File: fn_gangDisbanded.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies members that the gang has been disbanded.
*/
private _group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {}; //Fail horn please.
if (!isNull (findDisplay 2620)) then {closeDialog 2620};

hint localize "STR_GNOTF_DisbandWarn_2";

private _newGroup = createGroup civilian;
[player] joinSilent _newGroup;
_newGroup deleteGroupWhenEmpty true;
