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
	switch(life_veh_shop) do
	{
		case "reb_v_1":
		{
			if((_c_arr select _i) select 1 == "reb") then
			{
				_text = [_veh,_i] call life_fnc_vehicleColorStr;
				lbAdd[2303,format["%1",_text]];
				lbSetValue [2303,(lbSize 2303)-1,_i];
			};
		};
				
		case "reb_v_2":
		{
			if((_c_arr select _i) select 1 == "reb") then
			{
				_text = [_veh,_i] call life_fnc_vehicleColorStr;
				lbAdd[2303,format["%1",_text]];
				lbSetValue [2303,(lbSize 2303)-1,_i];
			};
		};
				
		default
		{
			_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; default {"civ"};};
					
			if((_c_arr select _i) select 1 == _id) then
			{
				_text = [_veh,_i] call life_fnc_vehicleColorStr;
				lbAdd[2303,format["%1",_text]];
				lbSetValue [2303,(lbSize 2303)-1,_i];
			};
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