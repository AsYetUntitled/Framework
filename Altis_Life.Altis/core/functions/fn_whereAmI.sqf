/*
    File: fn_mine.sqf
    Author: Dardo

    Description:
    Return the nearest kind of resource field to the player

    mine
    resource
    nothing
*/

private["_zonem", "_zone", "_mine", "_zoneSize", "_resource", "_nothing"];
_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
_zoneSize = (getNumber(missionConfigFile >> "CfgGather" >> "zoneSize"));

for "_i" from 0 to count(_resourceCfg)-1 do {
    private["_curConfig", "_resourceZones", "_requiredItem"];
    _zonem = "";
    _curConfig = _resourceCfg select _i;
    _resourceZones = getArray(_curConfig >> "zones");
    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zonem = _x;
        };
    } forEach _resourceZones;
    if (_zonem != "") exitWith {};
};

if (_zonem != "") exitWith {
    _mine = "mine";
    _mine;
};



_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do {
    private["_curConfig", "_resourceZones", "_requiredItem"];
    _zone = "";
    _curConfig = _resourceCfg select _i;
    _resourceZones = getArray(_curConfig >> "zones");
    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;
    if (_zone != "") exitWith {};
};
if (_zone != "") exitWith {
    _resource = "resource";
    _resource;
};
if (_zone isEqualTo "") exitWith {
    _nothing = "nothing";
    _nothing;
};
