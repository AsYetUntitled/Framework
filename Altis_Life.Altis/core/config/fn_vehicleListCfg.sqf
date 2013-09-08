/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2000],
			["C_Offroad_01_F",7000]
		];
	}; 
	
	case "civ_car2":
	{
		_return = 
		[
			["B_Quadbike_01_F",1000],
			["C_Offroad_01_F",5000]
		];
	};
	
	case "civ_car3":
	{
		_return = 
		[
			["B_Quadbike_01_F",1000],
			["C_Offroad_01_F",5000]
		];
	}; 
	
	case "civ_servt":
	{
		_return =
		[
			["C_Offroad_01_F",15000] //Service Truck
		];
	};
	
	case "civ_truck_shop":
	{
		_return =
		[
			["I_Truck_02_transport_F",25000],
			["I_Truck_02_covered_F",35000],
			["B_Truck_01_transport_F",90000]
		];	
	};
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Offroad_01_F",9000]
		];
	};
	
	case "reb_car2":
	{
		_return set[count _return,
		["B_Quadbike_01_F",2500]];
		_return set[count _return,
		["C_Offroad_01_F",9000]];
		_return set[count _return,
		["O_MRAP_02_F",150000]];
	};
	
	case "reb_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",400000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",500000]];
	};
	
	case "reb_ship1":
	{
		_return set[count _return,
		["C_Rubberboat",5000]];
		_return set[count _return,
		["B_Boat_Armed_01_minigun_F",75000]];
	};
	
	case "reb_ship2":
	{
		_return set[count _return,
		["C_Rubberboat",5000]];
	};
	
	case "cop_car":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(life_coplevel > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
		};
	};
	
	case "cop_car2":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		if(life_coplevel > 2) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
		};
	};
	
	case "fed_car":
	{
		_return set[count _return,
		["B_Quadbike_01_F",0]];
		_return set[count _return,
		["C_Offroad_01_F",0]];
		_return set[count _return,
		["B_MRAP_01_F",0]];
		_return set[count _return,
		["I_MRAP_03_F",0]];
		_return set[count _return,
		["I_Truck_02_covered_F",0]];
		_return set[count _return,
		["I_Truck_02_transport_F",0]];
		_return set[count _return,
		["B_Truck_01_covered_F",0]];
		_return set[count _return,
		["B_Truck_01_transport_F",0]];
	};
	
	case "fed_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",0]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",0]];
		_return set[count _return,
		["B_Heli_Transport_01_F",0]];
		_return set[count _return,
		["I_Heli_Transport_02_F",0]];
	};
	
	case "civ_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",230000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",600000]];
	};
	
	case "civ_air2":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",230000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",600000]];
	};
	
	case "cop_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(life_coplevel > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
		};
	};
	
	case "cop_air2":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",70000]];
		if(life_coplevel > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
		};
	}; 
	
	case "civ_ship":
	{
		_return set[count _return,
		["C_Rubberboat",5000]];
	};
	
	case "civ_ship2":
	{
		_return set[count _return,
		["C_Rubberboat",4000]];
	};
	
	case "civ_ship3":
	{
		_return set[count _return,
		["C_Rubberboat",4000]];
	};
	
	case "cop_ship":
	{
		_return set[count _return,
		["B_Boat_Transport_01_F",3000]];
		_return set[count _return,
		["B_Boat_Armed_01_minigun_F",75000]];
		_return set[count _return,
		["B_SDV_01_F",100000]];
	};
	
	case "donator_heli":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",100000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",175000]];
		_return set[count _return,
		["I_Heli_Transport_02_F",195000]];
	};
	
	case "donator_car":
	{
		_return set[count _return,
		["B_Quadbike_01_F",500]];
		_return set[count _return,
		["C_Offroad_01_F",2500]];
	};
};

_return;