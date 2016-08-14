/*
	File: fn_adminMarkersActive.sqf
	Author: Fresqo
	Description: sorts adminMarkers when activated/deactivated
*/
private _adminPlayerMarkerStatus = life_admin_playerMarkers;
private _adminVehicleMarkerStatus = life_admin_vehicleMarkers;
private _markers = [];
private _deadCount = 0;

private _fnc_deadCount = {
    _deadCount = 0;
    {
        _name = _x getVariable "name";
        _down = _x getVariable ["Revive",false];
        if (!isNil "_name" && !_down) then 
        {
            _deadCount = _deadCount + 1;
            };
        } forEach allDeadMen;
        _deadCount;
};

private _oldDeadCount = call _fnc_deadCount;

private _fnc_initMarkers = {
    _adminPlayerMarkerStatus = life_admin_playerMarkers;
    _adminVehicleMarkerStatus = life_admin_vehicleMarkers;
    private _units = [];
    _markers = [];
    {
        if (life_admin_playerMarkers || life_admin_vehicleMarkers) then 
        {
            if (life_admin_vehicleMarkers) then 
            {
                private _vehicles = vehicles;
                if (count _vehicles > 0) then 
                {
                    {
                        if ((_x isKindOf "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Ship")) then { 
                        _units pushBack ["ColorYellow",_x,"mil_triangle",(getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"))]};
                    } forEach _vehicles;
                };
            };
            if (life_admin_playerMarkers) then 
            {
                if (!(_x in units group player)) then 
                {
                switch (side _x) do 
                    {
                        case civilian: {_units pushBack ["ColorCivilian",_x,"Mil_dot",_x getVariable["realname",name _x]];};
                        case west: {_units pushBack ["ColorBLUFOR",_x,"Mil_dot",_x getVariable["realname",name _x]];};
                        case independent: {_units pushBack ["ColorIndependent",_x,"Mil_dot",_x getVariable["realname",name _x]];};
                    };
                };
            };
        };
    } forEach playableUnits;

    if (life_admin_playerMarkers && (_oldDeadCount > 0)) then 
        {
            {
            _name = _x getVariable "name";
            _down = _x getVariable ["Revive",false];
            if (!isNil "_name" && !_down) then 
                {
                    _units pushBack ["ColorRed",_x,"loc_Hospital",_x getVariable["realname",name _x]];
                };
            } foreach allDeadMen;
        };

        {
        if ((_x select 1) != player) then 
            {
                private _marker = createMarkerLocal [format["%1_marker",(_x select 1)],visiblePosition (_x select 1)];
                _marker setMarkerColorLocal (_x select 0);
                _marker setMarkerTypeLocal (_x select 2);
                _marker setMarkerTextLocal format["%1", (_x select 3)];
                _markers pushBack [_marker,(_x select 1),_x select 3,_x select 2];
            };
        } foreach _units;
};

call _fnc_initMarkers;
while {(_this select 0)} do 
{
    if (!visibleMap) exitWith {{deleteMarkerLocal (_x select 0);} forEach _markers;};
    if (!(_adminPlayerMarkerStatus isEqualTo life_admin_playerMarkers)) then 
    {
        {deleteMarkerLocal (_x select 0);} forEach _markers; 
        call _fnc_initMarkers;
        _adminPlayerMarkerStatus = life_admin_playerMarkers;
    };
    if (!(_adminVehicleMarkerStatus isEqualTo life_admin_vehicleMarkers)) then 
        {
            {deleteMarkerLocal (_x select 0);} forEach _markers; 
            call _fnc_initMarkers;
            _adminVehicleMarkerStatus = life_admin_vehicleMarkers;
        };
    if ((call _fnc_deadCount) != _oldDeadCount) then 
        {
            {deleteMarkerLocal (_x select 0);} forEach _markers; 
            _oldDeadCount = call _fnc_deadCount;
            call _fnc_initMarkers;
        };
    {
        private _marker = _x select 0;
        private _unit = _x select 1;
        if (!isNil "_unit" && !isNull _unit) then 
        {
            _marker setMarkerPosLocal (visiblePosition _unit);
        };
    } foreach _markers;
    sleep 0.02;
};
