/*
    File: fn_setObjVar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sets a variable on the given object from the server,
    workaround for brokenness of ARMA 3, yes Brokenness is a word!
*/
params [
    ["_obj",objNull,[objNull]],
    ["_varName","",[""]],
    "_varValue",
    ["_global",false,[false]]
];

if (isNull _obj || _varName isEqualTo "") exitWith {}; //Bad.
_obj setVariable [_varName,_varValue,_global];