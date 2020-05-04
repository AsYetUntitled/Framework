#include "..\..\script_macros.hpp"
/*
    File: fn_keyMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the key menu
*/
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
private _display = findDisplay 2700;
private _vehicles = _display displayCtrl 2701;
private _pList = _display displayCtrl 2702;

life_vehicles = life_vehicles - [objNull];
{
    if (alive _x) then {
        private _className = typeOf _x;
        private _color = _x getVariable ["Life_veh_color",""];
        if !(_color isEqualTo "") then {
            _color = format["(%1)",_color];
        };
        private _name = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        private _pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");

        _vehicles lbAdd format ["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_color];
        if (_pic != "pictureStaticObject") then {
            _vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
        };
        _vehicles lbSetValue [(lbSize _vehicles)-1,_forEachIndex];
    };
} forEach life_vehicles;

{
    if (alive _x && {player distance _x < 20}) then {
        _pList lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
        _pList lbSetData [(lbSize _pList)-1,str(_x)];
    };
} forEach (playableUnits - [player]);

if (((lbSize _vehicles)-1) isEqualTo -1) then {
    _vehicles lbAdd localize "STR_NOTF_noVehOwned";
    _vehicles lbSetData [(lbSize _vehicles)-1,""];
};
