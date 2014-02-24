/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop) do
{
	case "civ_car_1": {_ret = license_civ_driver;};
	case "civ_car_2": {_ret = license_civ_driver;};
	case "civ_car_3": {_ret = license_civ_driver;};
	case "civ_car_4": {_ret = license_civ_driver;};
	case "civ_ship_1": {_ret = license_civ_boat;};
	case "civ_ship_2": {_ret = license_civ_boat;};
	case "civ_ship_3": {_ret = license_civ_boat;};
	case "civ_air_1": {_ret = license_civ_air;};
	case "civ_air_2": {_ret = license_civ_air;};
	case "cop_air_1": {_ret = license_cop_air;};
	case "cop_air_2": {_ret = license_cop_air;};
	case "donator_1": {_ret = true;};
	case "donator_2": {_ret = true;};
	case "civ_truck_1":	{_ret = license_civ_truck;};
	case "civ_truck_2":	{_ret = license_civ_truck;};
	case "civ_servt_1": {_ret = license_civ_driver;};
	case "reb_v_1": {_ret = license_civ_rebel;};
	case "reb_v_2": {_ret = license_civ_rebel;};
	case "cop_car_1": {_ret = true;};
	case "cop_car_2": {_ret = true;};
	case "cop_car_3": {_ret = true;};
	case "cop_car_5": {_ret = true;};
	case "fed_car": {_ret = true;};
	case "fed_air": {_ret = true;};
	case "cop_ship_1": 
	{
		hint format["%1", _veh];
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;