/*
    File: fn_initHouses.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Initalizes house setup when player joins the server.
*/
private ["_queryResult","_query","_count","_blacklistedHouses","_blacklistedGarages"];
_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
    _query = format ["SELECT houses.id, houses.pid, houses.pos, players.name, houses.garage FROM houses INNER JOIN players WHERE houses.owned='1' AND houses.pid = players.pid LIMIT %1,10",_x];
    _queryResult = [_query,2,true] call DB_fnc_asyncCall;
    if (count _queryResult isEqualTo 0) exitWith {};
    {
        _pos = call compile format ["%1",_x select 2];
        _house = nearestObject [_pos, "House"];
        _house setVariable ["house_owner",[_x select 1,_x select 3],true];
        _house setVariable ["house_id",_x select 0,true];
        _house setVariable ["locked",true,true]; //Lock up all the stuff.
        if (_x select 4 isEqualTo 1) then {
            _house setVariable ["garageBought",true,true];
        };
        _numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
        for "_i" from 1 to _numOfDoors do {
            _house setVariable [format ["bis_disabled_Door_%1",_i],1,true];
        };
    } forEach _queryResult;
};

_blacklistedHouses = "count (getArray (_x >> 'garageBlacklists')) > 0" configClasses (missionconfigFile >> "Housing" >> worldName);
_blacklistedGarages = "count (getArray (_x >> 'garageBlacklists')) > 0" configClasses (missionconfigFile >> "Garages" >> worldName);
_blacklistedHouses = _blacklistedHouses apply {configName _x};
_blacklistedGarages = _blacklistedGarages apply {configName _x};

for "_i" from 0 to count(_blacklistedHouses)-1 do {
    _className = _blacklistedHouses select _i;
    _positions = getArray(missionConfigFile >> "Housing" >> worldName >> _className >> "garageBlacklists");
    {
        _obj = nearestObject [_x,_className];
        if (isNull _obj) then {
            _obj setVariable ["blacklistedGarage",true,true];
        };
    } forEach _positions;
};

for "_i" from 0 to count(_blacklistedGarages)-1 do {
    _className = _blacklistedGarages select _i;
    _positions = getArray(missionConfigFile >> "Garages" >> worldName >> _className >> "garageBlacklists");
    {
        _obj = nearestObject [_x,_className];
        if (isNull _obj) then {
            _obj setVariable ["blacklistedGarage",true,true];
        };
    } forEach _positions;
};
