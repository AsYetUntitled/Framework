/*
    File: fn_onPutItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Syncs changes to containers in houses?
*/
private["_unit","_item","_house","_container"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if (isNull _unit || _item isEqualTo "") exitWith {}; //Bad thingies?