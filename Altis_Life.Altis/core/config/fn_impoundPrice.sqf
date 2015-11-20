/*
	File: fn_impoundPrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sort of a config for the price of unimpounding a vehicle based on damage states.
	Will be whiped on new system.
*/
private["_veh","_price"];
_veh = _this select 0;
if(isNull _veh) exitWith {};

switch (true) do
{
	case (_veh isKindOf "Car") :
	{
		switch(true) do
		{
			case (damage _veh > 0.07) : {_price = 100;};
			case (damage _veh > 0.04) : {_price = 60;};
			case (damage _veh > 0.03) : {_price = 40;};
			default {_price = 25;};
		};
		
		switch (true) do
		{
			case (fuel _veh < 0.2) : {_price = _price + 30;};
			case (fuel _veh < 0.5) : {_price = _price + 20;};
			case (fuel _veh < 0.8) : {_price = _price + 10;};
			default { _price = _price + 5;};
		};
	};
	
	case (_veh isKindOf "Air") :
	{
		switch(true) do
		{
			case (damage _veh > 0.15) : {_price = 950;};
			case (damage _veh > 0.06) : {_price = 650;};
			case (damage _veh > 0.03) : {_price = 350;};
			default {_price = 25;};
		};
		
		switch (true) do
		{
			case (fuel _veh < 0.2) : {_price = _price + 200;};
			case (fuel _veh < 0.5) : {_price = _price + 150;};
			case (fuel _veh < 0.8) : {_price = _price + 100;};
			default { _price = _price + 50;};
		};
	};

	case (_veh isKindOf "Ship") :
	{
		switch(true) do
		{
			case (damage _veh > 0.07) : {_price = 75;};
			case (damage _veh > 0.04) : {_price = 50;};
			case (damage _veh > 0.03) : {_price = 25;};
			default {_price = 10;};
		};
		
		switch (true) do
		{
			case (fuel _veh < 0.2) : {_price = _price + 20;};
			case (fuel _veh < 0.5) : {_price = _price + 15;};
			case (fuel _veh < 0.8) : {_price = _price + 10;};
			default { _price = _price + 5;};
		};
	};
};

_price;