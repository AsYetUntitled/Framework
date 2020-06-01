#include "..\..\script_macros.hpp"
/*
    File: fn_deviceMine.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Devilfloh
    Description:
    Starts automated mining of resource from the tempest device. Not integrated with percents.
*/
private ["_vehicle","_resourceZones","_zone","_weight","_resource","_vInv","_itemIndex","_items","_sum","_itemWeight","_isMineral"];
_vehicle = param [0,objNull,[objNull]];
_isMineral = true;
if (isNull _vehicle) exitWith {};

if (!isNil {_vehicle getVariable "mining"}) exitWith {
    hint localize "STR_NOTF_DeviceIsMining";
};

if (fuel _vehicle isEqualTo 0) exitWith {
    titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];
};

closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..

_weight = [_vehicle] call life_fnc_vehicleWeight;
if ((_weight select 1) >= (_weight select 0)) exitWith {
    hint localize "STR_NOTF_DeviceFull";
    life_action_inUse = false;
};

//check if we are in the resource zone for any of the resources
_zone = "";

_resourceCfg = missionConfigFile >> "CfgGather" >> "Resources";
for "_i" from 0 to count(_resourceCfg)-1 do {
    _curConfig = (_resourceCfg select _i);
    _resource = configName(_curConfig);
    _resourceZones = getArray(_curConfig >> "zones");
    _zoneSize = getNumber(_curConfig >> "zoneSize");

    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;

    if (_zone != "") exitWith {_isMineral = false;};
};

_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
for "_i" from 0 to count(_resourceCfg)-1 do {
    private ["_curConfig","_resourceZones","_resources","_mined"];

    if (!_isMineral) exitWith {};
    _curConfig = (_resourceCfg select _i);
    _resources = getArray(_curConfig >> "mined");
    _resourceZones = getArray(_curConfig >> "zones");
    _zoneSize = getNumber(_curConfig >> "zoneSize");

    if (!(_resources select 0 isEqualType [])) then {
        _mined = _resources select 0;
    } else {
        _mined = (_resources select 0) select 0;
    };

    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;

    if (_zone != "") exitWith {_resource = _mined};
};

if (_zone isEqualTo "") exitWith {
    hint localize "STR_NOTF_notNearResource";
    life_action_inUse = false;
};

_vehicle setVariable ["mining",true,true]; //Lock the device
_vehicle remoteExec ["life_fnc_soundDevice",RCLIENT]; //Broadcast the 'mining' sound of the device for nearby units.

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

for "_i" from 0 to 1 step 0 do {
    if (!alive _vehicle || isNull _vehicle) exitWith {};

    if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
        titleText[localize "STR_NOTF_MiningStopped","PLAIN"];
    };

    if (fuel _vehicle isEqualTo 0) exitWith {
        titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];
    };

    titleText[localize "STR_NOTF_DeviceMining","PLAIN"];
    _time = time + 27;

    //Wait for 27 seconds with a 'delta-time' wait.
    waitUntil {
        if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
            _vehicle setVariable ["mining",nil,true];
            titleText[localize "STR_NOTF_MiningStopped","PLAIN"];
            true
        };

        if (round(_time - time) < 1) exitWith {
            true
        };

        if (fuel _vehicle < 0.1) exitWith {
            _vehicle setVariable ["mining",nil,true];
            titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];
            true
        };

        sleep 0.2;
        false
    };

    if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
        _vehicle setVariable ["mining",nil,true];
        titleText[localize "STR_NOTF_MiningStopped","PLAIN"];
    };

    _vehicle_data = _vehicle getVariable ["Trunk",[[],0]];
    _inv = +(_vehicle_data select 0);
    _space = (_vehicle_data select 1);
    _itemIndex = [_resource,_inv] call life_util_fnc_index;
    _weight = [_vehicle] call life_fnc_vehicleWeight;
    _random = 10 + round((random(10)));
    _sum = [_resource,_random,(_weight select 1),(_weight select 0)] call life_fnc_calWeightDiff; // Get a sum base of the remaining weight..

    if (_sum < 1) exitWith {
        titleText[localize "STR_NOTF_DeviceFull","PLAIN"];
        _vehicle setVariable ["mining",nil,true];
    };

    if (_itemIndex isEqualTo -1) then {
        _inv pushBack [_resource,_sum];
    } else {
        _val = (_inv select _itemIndex) select 1;
        _inv set[_itemIndex,[_resource,_val + _sum]];
    };

    if (fuel _vehicle < 0.1) exitWith {
        _vehicle setVariable ["mining",nil,true];
        titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];
    };

    //Locality checks...
    if (local _vehicle) then {
        _vehicle setFuel (fuel _vehicle)-0.05;
    } else {
        [_vehicle,(fuel _vehicle)-0.05] remoteExec ["life_fnc_setFuel",_vehicle];
    };

    if (fuel _vehicle < 0.1) exitWith {
        titleText[localize "STR_NOTF_OutOfFuel","PLAIN"];
        _vehicle setVariable ["mining",nil,true];
    };

    _itemName = M_CONFIG(getText,"VirtualItems",_resource,"displayName");
    titleText[format [localize "STR_NOTF_DeviceMined",_sum,_itemName],"PLAIN"];
    _itemWeight = ([_resource] call life_fnc_itemWeight) * _sum;
    _vehicle setVariable ["Trunk",[_inv,_space + _itemWeight],true];
    _weight = [_vehicle] call life_fnc_vehicleWeight;
    _sum = [_resource,_random,(_weight select 1),(_weight select 0)] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..

    if (_sum < 1) exitWith {
        _vehicle setVariable ["mining",nil,true];
        titleText[localize "STR_NOTF_DeviceFull","PLAIN"];
    };

    sleep 2;
};

_vehicle setVariable ["mining",nil,true];
