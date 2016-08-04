/*
    File: fn_initHouses.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the players houses, mainly throwing down markers.
*/
if (life_houses isEqualTo []) exitWith {}; //Nothing to do.

{
    _position = call compile format ["%1",_x select 0];
    _house = nearestObject [_position, "House"];
    _house setVariable ["uid",round(random 99999),true];
    _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

    _marker = createMarkerLocal [format ["house_%1",(_house getVariable "uid")],_position];
    _marker setMarkerTextLocal _houseName;
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";

} forEach life_houses;
