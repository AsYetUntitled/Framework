/*
    File: fn_whereAmI.sqf
    Author: Dardo

    Description:
    Return the nearest kind of resource field to the player

    mine
    resource
    nothing
*/
private _resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";

for "_i" from 0 to count(_resourceCfg)-1 do {
    private _zonem = "";
    private _curConfig = _resourceCfg select _i;
    private _resourceZones = getArray(_curConfig >> "zones");
    private _zoneSize = getNumber(_curConfig >> "zoneSize");
    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zonem = _x;
        };
    } forEach _resourceZones;
    if !(_zonem isEqualTo "") exitWith {};
};

if !(_zonem isEqualTo "") exitWith {
    _mine = "mine";
    _mine;
};

_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do {
    private _zone = "";
    private _curConfig = _resourceCfg select _i;
    private _resourceZones = getArray(_curConfig >> "zones");
    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;
    if !(_zone isEqualTo "") exitWith {};
};
if !(_zone isEqualTo "") exitWith {
    _resource = "resource";
    _resource;
};
if (_zone isEqualTo "") exitWith {
    _nothing = "nothing";
    _nothing;
};
