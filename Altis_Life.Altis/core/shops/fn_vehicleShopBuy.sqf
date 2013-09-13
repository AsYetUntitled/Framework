/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deleting it soon enough....
*/
private["_index","_veh","_color","_price","_sp","_kill","_dir","_name","_sv","_fed"];
_kill = false;

switch(life_veh_shop) do
{
	case "civ_car_1":
	{
		_sp = getMarkerPos "civ_car_1";
		_dir = markerDir "civ_car_1";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],2]) > 0) then 
		{
			_sp = getMarkerPos "civ_car_1_2";
			_dir = markerDir "civ_car_1_2";
		};
	};
	
	case "civ_car_2":
	{
		_sp = getMarkerPos "civ_car_2";
		_dir = markerDir "civ_car_2";
	};
	
	case "civ_car_3":
	{
		_sp = getMarkerPos "civ_car_3";
		_dir = markerDir "civ_car_3";
	};
	
	case "civ_servt_1":
	{
		_sp = getMarkerPos "civ_servt_1";
		_dir = markerDir "civ_servt_1";
	};
	
	case "cop_car_1":
	{
		_sp = getMarkerPos "cop_car_1";
		_dir = markerDir "cop_car_1";
	};
	
	case "cop_car_2":
	{
		_sp = getMarkerPos "cop_car_2";
		_dir = markerDir "cop_car_2";
	};
	
	case "cop_car_3":
	{
		_sp = getMarkerPos "cop_car_3";
		_dir = markerDir "cop_car_3";
	};
	
	case "fed_car":
	{
		_sp = getMarkerPos "fed_car_1";
		_dir = markerDir "fed_car_1";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],20]) > 0) exitWith {hint "There is a vehicle on the spawn point."};
	};
	
	case "fed_air":
	{
		_sp = getMarkerPos "fed_air_1";
		_dir = markerDir "fed_air_1";
		if(count(nearestObjects[_sp,["Car","Ship","Air"],20]) > 0) exitWith {hint "There is a vehicle on the spawn point."};
	};
	
	case "civ_ship_1":
	{
		//if(!license_civ_boat) exitWith {_kill = true;};
		_sp = getMarkerPos "civ_ship_1";
		_dir = markerDir "civ_ship_1";	
	};
	
	case "civ_ship2":
	{
		_sp = getMarkerPos "civ_boat_2";
		_dir = markerDir "civ_boat_2";
	};
	
	case "civ_ship3":
	{
		_sp = getMarkerPos "civ_boat_3";
		_dir = markerDir "civ_boat_3";
	};
	
	case "civ_air_1":
	{
		_sp = getMarkerPos "civ_air_1";
		_dir = markerDir "civ_air_1";
		
		if(count(nearestObjects[_sp,["Car","Ship","Air"],2]) > 0) then 
		{
			_sp = getMarkerPos "civ_air_1_2";
			_dir = markerDir "civ_air_1_2";
		};
	};
	
	case "civ_air_2":
	{
		_sp = getMarkerPos "civ_air_2";
		_dir = markerDir "civ_air_2";
		
		if(count(nearestObjects[_sp,["Car","Ship","Air"],2]) > 0) then 
		{
			_sp = getMarkerPos "civ_car_2_2";
			_dir = markerDir "civ_car_2_2";
		};
	};
	
	case "civ_truck_1":
	{
		_sp = getMarkerPos "civ_truck_1";
		_dir = markerDir "civ_truck_1";
	};
	
	case "cop_air_1":
	{
		_sp = getMarkerPos "cop_air_1";
		_dir = markerDir "cop_air_1";
	};
	
	case "cop_air_2":
	{
		_sp = getMarkerPos "cop_air_2";
		_dir = markerDir "cop_air_2";
	};
	
	case "reb_air":
	{
		_sp = getMarkerPos "reb_air_1";
		_dir = markerDir "reb_air_1";
	};
	
	case "reb_car":
	{
		_sp = getMarkerPos "reb_car_1";
		_dir = markerDir "reb_car_1";
	};
	
	case "reb_car2":
	{
		_sp = getMarkerPos "reb_car2";
		_dir = markerDir "reb_car2";
	};
	
	case "reb_ship1":
	{
		_sp = getMarkerPos "reb_ship1";
		_dir = markerDir "reb_ship1";
	};
	
	case "reb_ship2":
	{
		_sp = getMarkerPos "reb_ship2";
		_dir = markerDir "reb_ship2";
	};
	
	case "cop_ship_1":
	{
		_sp = getMarkerPos "cop_boat_1";
		_dir = markerDir "cop_boat_1";
	};
	
	case "donator_heli":
	{
		_sp = getMarkerPos "donator_heli";
		_dir = markerDir "donator_heli";
	};
	
	case "donator_car":
	{
		_sp = getMarkerPos "donator_car";
		_dir = markerDir "donator_car";
	};
};
_index = lbCurSel 2302;
_veh = lbData[2302,_index];
if(!([_veh] call life_fnc_vehShopLicenses)) exitWith {hint "You do not have the required license!"};
_color = lbValue[2303,(lbCurSel 2303)];
systemChat format["%1",_color];
_price = lbValue[2302,(lbCurSel 2302)];
if(_price < 0) exitWith {};
if(life_cash < _price) exitWith {hint "You do not have enough money"};
hint "This may take a second or two.";
sleep floor(random 3);

if(count(nearestObjects[_sp,["Car","Ship","Air"],3]) > 0) exitWith {hint "There is a vehicle on the spawn point."};

_sv = false;

if(_veh == "serv_truck") then
{
	_name = "Service Truck";
	_veh = "C_Offroad_01_F";
	_sv = true;
}
	else
{
	_name = getText(configFile >> "CfgVehicles" >> _veh >> "displayName");
};
hint format["You bought a %1 for $%2",_name,[_price] call life_fnc_numberText];
_vehicle = _veh createVehicle _sp;
_vehicle setPos _sp;
_vehicle setDir _dir;

if(_sv) then
{
	[_vehicle,"service_truck",true] call life_fnc_vehicleAnimate;
	_color = 4;
};

//Disabled till Vehicle Storage Menu is completed and to help solve Desync
//_vehicle setVariable["vehicle_info_inv",[],true];
_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,name player]],true];

life_vehicles set[count life_vehicles,_vehicle];
life_cash = life_cash - _price;

bank_addfunds = _price;
publicVariableServer "bank_addfunds";

if(playerSide == west) then
{
	if(_veh == "C_Offroad_01_F") then
	{
		[_vehicle,"cop_offroad",true] call life_fnc_vehicleAnimate;
	};
};

[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn BIS_fnc_MP;

_vehicle lock 2;
if((life_veh_shop == "civ_air" OR life_veh_shop == "civ_air2") && (typeOf _vehicle == "B_Heli_Light_01_F")) then
{
	[_vehicle,"civ_littlebird",true] call life_fnc_vehicleAnimate;
};

[1,false] call life_fnc_sessionHandle;