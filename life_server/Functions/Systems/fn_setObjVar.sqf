/*
    File: fn_setObjVar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sets a variable on the given object from the server,
    workaround for brokenness of ARMA 3, yes Brokenness is a word!
*/
private ["_obj","_varValue","_global","_varName"];
_obj = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_varName = [_this,1,"",[""]] call BIS_fnc_param;
_varValue = _this select 2;
_global = [_this,3,false,[true]] call BIS_fnc_param;

if (isNull _obj || _varName isEqualTo "") exitWith {}; //Bad.
_obj setVariable [_varName,_varValue,_global];