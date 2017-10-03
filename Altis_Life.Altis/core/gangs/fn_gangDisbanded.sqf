/*
    File: fn_gangDisbanded.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies members that the gang has been disbanded.
*/
params [
    ["_unit",grpNull,[grpNull]]
];
if (isNull _group) exitWith {}; //Fail horn please.
if (!isNull (findDisplay 2620)) then {closeDialog 2620};

hint localize "STR_GNOTF_DisbandWarn_2";
[player] joinSilent (createGroup civilian);

if (units _group isEqualTo []) then {
    deleteGroup _group;
};
