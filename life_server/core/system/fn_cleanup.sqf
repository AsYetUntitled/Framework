/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server-side cleanup script on vehicles using Arma2Net DateTime function.
	Sort of a lame way but whatever.
*/

while {true} do
{
	private["_veh","_units"];
	sleep (35 * 60);
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
		
		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then
		{
			_dbInfo = _veh getVariable["dbInfo",[]];
			_units = {(_x distance _veh < 300)} count playableUnits;
			if(count crew _x == 0) then
			{
				switch (true) do
				{
					case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x};
					case (_units == 0): {deleteVehicle _x};
				};
			};
			
			if(isNull _veh) then
			{
				if(count _dbInfo > 0) then
				{
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;

					_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
					_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['arma3life', '%1']", _query];
				};
			};
		};
	} foreach vehicles;
	
	sleep (3 * 60); //3 minute cool-down before next cycle. 
	{
		if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then
		{
			deleteVehicle _x;
		};
	} foreach (allMissionObjects "Thing");
	
	sleep (2 * 60);
	{
		deleteVehicle _x;
	} foreach (allMissionObjects "GroundWeaponHolder");
};

/*
private["_near","_vehicle","_vehicles","_timeNow","_creation","_offset"];
_near = 0;
_vehicle = ObjNull;
_vehicles = [];
_timeNow = 0;
_creation = 0;
_offset = 0;

sleep (30 * 60); //Goto sleep and wait till 30 minutes into the game.
while {true} do
{
	_vehicles = allMissionObjects "Car";
	{_vehicles set[count _vehicles,_x];} foreach (allMissionObjects "Air");
	{_vehicles set[count _vehicles,_x];} foreach (allMissionObjects "Ship");
	
	{
		_vehicle = _x;
		if(!isNull _vehicle) then
		{
			_creation = _vehicle getVariable _creation;
			if(isNil "_creation") then {[_vehicle] call STS_fnc_timeStamp;};
			_timeNow = parseNumber("Arma2Net.Unmanaged" callExtension "DateTime ['now', 'HHmmss']");
			_offset = ((_timeNow - _creation) / 60);
			
			switch (true) do
			{
				case (_offset > 10):
				{
					//No crew....
					if(count crew _vehicle == 0) then
					{
						//Tally amount of players near it..
						_near = {(_x distance _vehicle < 200)} count playableUnits;
						if(count _near == 0) then
						{
							deleteVehicle _vehicle;
						}
							else
						{
							_vehicle setVariable["creation",_timeNow,false];
						};
					}
						else
					{
						_vehicle setVariable["creation",_timeNow,false];
					};
				};
			};
		};
	} foreach _vehicles;
sleep (10 * 60);
};
*/