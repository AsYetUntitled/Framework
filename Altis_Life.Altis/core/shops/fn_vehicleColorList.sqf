/*
	File: fn_vehicleColorList.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	FUCK I DON"T KNOW!
*/
private["_index","_veh","_text","_c_arr"];
_index = lbCurSel 2302;
lbClear 2303;
_veh = lbData[2302,_index];
_c_arr = [_veh] call life_fnc_vehicleColorCfg;
for "_i" from 0 to (count _c_arr)-1 do
{
	switch(true) do
	{
		case (_veh == "B_Heli_Light_01_F") :
		{
			switch(life_veh_shop) do
			{
				case "civ_air_1":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_air_2":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "cop_air_1":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "cop_air_2":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "reb_air":
				{
					if((_c_arr select _i) select 1 == "reb") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "O_Heli_Light_02_unarmed_F") :
		{
			switch(life_veh_shop) do
			{
				case "civ_air_1":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_air_2":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "cop_air_1":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "cop_air_2":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "reb_air":
				{
					if((_c_arr select _i) select 1 == "reb") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "C_Offroad_01_F"):
		{
			switch (life_veh_shop) do
			{
				case "civ_car_1":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_car_2":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_car_3":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_truck_1":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "reb_car":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "reb_car2":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "cop_car_1":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "cop_car_2":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "fed_car":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "I_MRAP_03_F"):
		{
			switch (life_veh_shop) do
			{
				case "fed_car":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "B_MRAP_01_F"):
		{
			switch (life_veh_shop) do
			{
				case "cop_car_1":
				{
					if((_c_arr select _i) select 1 == "cop") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				case "fed_car":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "I_Truck_02_covered_F"):
		{
			switch (life_veh_shop) do
			{
				case "fed_car":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_truck_1":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "I_Truck_02_transport_F"):
		{
			switch (life_veh_shop) do
			{
				case "fed_car":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
				
				case "civ_truck_1":
				{
					if((_c_arr select _i) select 1 == "civ") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "B_APC_Wheeled_01_cannon_F"):
		{
			switch (life_veh_shop) do
			{
				case "fed_car":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "I_Heli_Transport_02_F"):
		{
			switch (life_veh_shop) do
			{
				case "fed_air":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
		
		case (_veh == "O_Heli_Attack_02_black_F"):
		{
			switch (life_veh_shop) do
			{
				case "fed_air":
				{
					if((_c_arr select _i) select 1 == "fed") then
					{
						_text = [_veh,_i] call life_fnc_vehicleColorStr;
						lbAdd[2303,format["%1",_text]];
						lbSetValue [2303,(lbSize 2303)-1,_i];
					};
				};
			};
		};
			
		default 
		{
			_text = [_veh,_i] call life_fnc_vehicleColorStr;
			lbAdd[2303,format["%1",_text]];
			lbSetValue [2303,(lbSize 2303)-1,_i];
		};
	};
};

lbSetCurSel [2303,0];
if((lbSize 2303)-1 != -1) then
{
	ctrlShow[2303,true];
}
	else
{
	ctrlShow[2303,false];
};