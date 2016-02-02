#include "..\..\script_macros.hpp"
/*
	File: fn_RefuelCar.sqf
	Author: NiiRoZz

	Description:
	Add fuel in car.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_classname = lbData[20302,(lbCurSel 20302)];
_index =  lbvalue[20302,(lbCurSel 20302)];

if (isNil "_classname" || _classname == "") exitwith {
	hint localize "STR_Select_Vehicle_Pump";
	vehiclefuelList = [];
	life_action_inUse = false;
	closedialog 0;
};

_car = (vehiclefuelList select _index) select 0;
_vehicleInfo = [_className]call life_fnc_fetchVehInfo;
_fuelNow = fuel _car;
_fueltank = (_vehicleInfo select 12);
if (_car iskindof "B_Truck_01_box_F" || _car iskindof "B_Truck_01_transport_F") then {_fueltank = 350;};//hemtt
if (_car iskindof "C_Van_01_box_F") then {_fueltank = 100;};
if (_car iskindof "I_Truck_02_covered_F" || _car iskindof "I_Truck_02_transport_F") then {_fueltank = 175;};
_fueltoput= ((SliderPosition 20901)-(floor(_fuelnow * _fueltank)));
_setfuell = _fuelnow + (_fueltoput/_fueltank);
_timer = ((_fueltoput * .25)/100);
if (_car distance player > 10 && vehicle player != player) exitwith {
	hint localize "STR_Distance_Vehicle_Pump";
	vehiclefuelList = [];
	life_action_inUse = false;
	closedialog 0;
};

if ((BANK - (_fueltoput * life_fuelPrices))> 0)then {
	life_is_processing = true;
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%","Refuel:"];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	_tp =0;
	_totalcost = _fueltoput * life_fuelPrices;
	while{true} do
	{
		sleep  _timer;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Refuel:"];
		if(_cP >= 1) exitWith {};
		if(player distance _car > 10) exitWith {};
		if(vehicle player != player) exitWith {};
		if !((BANK - round(0.01 * _totalcost))> 0) exitwith {};
		BANK = BANK - round((0.01 * _totalcost));
		_tp = _tp +1;
		if (_tp == 9) then {
			_tp = 0;
			[_car,_cp * _setfuell] remoteExecCall ["life_fnc_setFuel",_car];
		};
	};
	5 cutText ["","PLAIN"];
	if (_car distance player > 10 || vehicle player != player) then {
		hint localize "STR_Distance_Vehicle_Pump";
		vehiclefuelList = [];
		life_is_processing = false;
		life_action_inUse = false;
		[0] call SOCK_fnc_updatePartial;
		closedialog 0;
	} else {
		life_is_processing = false;
		[0] call SOCK_fnc_updatePartial;
	};
} else {
	hint localize "STR_NOTF_NotEnoughMoney";
};

vehiclefuelList = [];
life_action_inUse = false;
closedialog 0;
