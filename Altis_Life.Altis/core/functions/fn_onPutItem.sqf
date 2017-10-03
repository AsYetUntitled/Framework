/*
    File: fn_onPutItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Syncs changes to containers in houses?
*/
params [
	["_unit",objNull,[objNull]],
	["_container",objNull,[objNull]],
	["_item","",[""]]
];

if (isNull _unit || _item isEqualTo "") exitWith {}; //Bad thingies?