#include "..\..\script_macros.hpp"
/*
    File: fn_buyLicense.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when purchasing a license. May need to be revised.
*/
params ["", "", "", "_type"];

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
private _displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
private _price = M_CONFIG(getNumber,"Licenses",_type,"price");
private _sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
private _varName = LICENSE_VARNAME(_type,_sideFlag);

if (CASH < _price) exitWith {hint format [localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText, _displayName];};
CASH = CASH - _price;

[0] call SOCK_fnc_updatePartial;

titleText[format [localize "STR_NOTF_B_1", _displayName,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable [_varName,true];

[2] call SOCK_fnc_updatePartial;
