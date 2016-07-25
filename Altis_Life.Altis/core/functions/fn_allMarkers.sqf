/*
	file: fn_allMarkers.sqf
	Fresqo
	sorts all markers including admin markers
*/
private["_true","_units","_markers","_vehicles"];
_true = [_this,0,false,[false]] call BIS_FNC_PARAM;
_units = [];

if (_true) then 
{
    life_markers = [];
    if (life_admin_markers) then 
        {
            _vehicles = vehicles;
            if (count _vehicles > 0) then 
                {
                    {
                        if ((_x isKindOf "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Ship")) then { 
                        _units pushBack ["ColorBLUFOR",_x,"mil_triangle",(getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"))]};
                    } forEach _vehicles;
                };
            {
                _units pushBack ["ColorCivilian",_x,"Mil_dot",_x getVariable["realname",name _x]];
            } forEach playableUnits;
        } else 
            {
                switch (playerSide) do 
                    {
                        case civilian: {{_units pushBack ["ColorCivilian",_x,"Mil_dot"]} forEach units (group player);};
                        case west: {{if (side _x isEqualTo west) then {_units pushBack ["ColorBLUFOR",_x,"Mil_dot"]};} forEach playableUnits;};
                        case independent: {{if (side _x isEqualTo independent) then {_units pushBack ["ColorIndependent",_x,"Mil_dot"]};} forEach playableUnits;};
                    };
                {
                    _x set[3,(_x select 1) getVariable["realname",name (_x select 1)]];
                } forEach _units;
            };

    if ((playerSide in [independent,west]) || life_admin_markers) then 
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
                _marker = createMarkerLocal [format["%1_marker",(_x select 1)],visiblePosition (_x select 1)];
                _marker setMarkerColorLocal (_x select 0);
                _marker setMarkerTypeLocal (_x select 2);
                _marker setMarkerTextLocal format["%1", (_x select 3)];
                life_markers pushBack [_marker,(_x select 1),_x select 3];
            };
    } foreach _units;

    while {visibleMap} do 
        {
            {
                private["_marker","_unit"];
                _marker = _x select 0;
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then 
                    {
                        _marker setMarkerPosLocal (visiblePosition _unit);
                    };
            } foreach life_markers;
            sleep 0.02;
        };

} else 
    {
        {deleteMarkerLocal (_x select 0);} forEach life_markers;
        life_markers = [];
    };
