/*
	File: fn_whoDoneit.sqf
	Description: Save log file of units killed.
	Author: Å  ColinM - Help of BI Wiki & Forums.

	Credits:	KillzoneKid for his Debug_Console v3.0 file.
				Cuel from the BI Forums for his current & previous posts.
*/

if(isServer) then {
    private["_victim","_victimName","_killer","_killerName","_distance","_killerWep","_message","_weaponName","_killerVeh","_vehName"];
    _victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
    _killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
    if(isNull _victim OR isNull _killer) exitWith {};

    _killerWep = currentWeapon _killer;
    _killerVeh = vehicle _killer;
    _distance = _killer distance _victim;
    _distance = floor(_distance);

    _weaponName = (configFile >> "cfgWeapons" >> _killerWep);
    _weaponName = format["%1",getText(_weaponName >> "displayName")];
    _killerWep = format["%1",_weaponName];

    if(_killerVeh != _killer) then {
        _vehName = getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName");
    } else {
        _vehName = "";
    };

    _victimName = name _victim;
    _killerName = name _killer;
    _message = "";

    if (_victim == _killer) then {
        _message = format["Suicide Message: %1 committed suicide (or disconnected)", _killerName];
    };
    if (currentWeapon _killer != "") then {
        _message = format["Weapon Death Message: %1 has killed %2 with Weapon %3 from Distance %4 Meters", _killerName, _victimName, _killerWep, _distance];
    };
    if (_killerVeh isKindOf "Car") then {
        _message = format["Vehicle Death Message: %1 has knocked down %2 with a %3", _killerName, _victimName, _vehName];
    };
    if (_killerVeh isKindOf "Air") then {
        _message = format["Aircraft Death Message: %1 has obliterated %2 with a %3", _killerName, _victimName, _vehName];
    };
    if (_message == "") then {
        _message = format["Death Message: %1 has killed %2", _killerName, _victimName];
    };

	diag_log format["whoDoneit: %1",_message];
};
