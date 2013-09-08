/*
	File: fn_shop_changeMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	I don't even know anymore.
*/
private["_shop","_type","_dialog","_list","_array"];
_type = _this select 0;
life_g_sel = _type;
_shop = life_g_shop;

disableSerialization;

_dialog = findDisplay 2500;
_list = _dialog displayCtrl 2501;

lbClear _list;

switch (_type) do
{
	case "guns":
	{
		switch (_shop) do
		{
			case "cop": {_array = cop_shop_items select 0;};
			case "reb":	{_array = reb_shop_items select 0;};
			case "gun": {_array = gun_shop_items select 0;};
			case "gen": {_array = gen_shop_items select 0;};
			case "donator": {_array = donator_shop_items select 0;};
			case "gang": {_array = gang_shop_items select 0;};
			case "sergeant": {_array = sergeant_shop_items select 0;};
			case "officer": {_array = officer_shop_items select 0;};
			case "admin": {_array = admin_shop_items select 0;};
			case "reb2":	{_array = reb_shop2_items select 0;};
			case "reb3":	{_array = reb_shop3_items select 0;};
			case "reb4":	{_array = reb_shop4_items select 0;};
		};
		
		{
			_class = _x select 0;
			_price = _x select 1;
			_name = getText(configFile >> "CfgWeapons" >> _class >> "displayName");
			_pic = getText(configFile >> "CfgWeapons" >> _class >> "picture");
			
			if(_class == "hgun_P07_snds_F") then
			{
				_list lbAdd "Stun Pistol";
			}
				else
			{
				_list lbAdd format["%1", _name];
			};
			_list lbSetPicture [(lbSize _list)-1,_pic];
			_list lbSetData [(lbSize _list)-1,_class];
			_list lbSetValue [(lbSize _list)-1,_price];
		} foreach _array;
	};
	
	case "mags":
	{
		switch (_shop) do
		{
			case "cop": {_array = cop_shop_items select 1;};
			case "reb": {_array = reb_shop_items select 1;};
			case "gun": {_array = gun_shop_items select 1;};
			case "gang": {_array = gang_shop_items select 1;};
			case "donator": {_array = donator_shop_items select 1;};
			case "gen": {_array = gen_shop_items select 1;};
			case "sergeant":	{_array = sergeant_shop_items select 1;};
			case "officer":	{_array = officer_shop_items select 1;};
			case "admin":	{_array = admin_shop_items select 1;};
			case "reb2":	{_array = reb_shop2_items select 1;};
			case "reb3":	{_array = reb_shop3_items select 1;};
			case "reb4":	{_array = reb_shop4_items select 1;};
		};
		
		{
			_class = _x select 0;
			_price = _x select 1;
			
			if(isClass (configFile >> "CfgMagazines" >> _class)) then
			{
				_name = getText(configFile >> "CfgMagazines" >> _class >> "displayName");
				_pic = getText(configFile >> "CfgMagazines" >> _class >> "picture");
				
				_list lbAdd format["%1",_name];
				_list lbSetPicture [(lbSize _list)-1,_pic];
				_list lbSetData [(lbSize _list)-1,_class];
				_list lbSetValue [(lbSize _list)-1,_price];
			};
		} foreach _array;
	};
	
	case "items":
	{
		switch (_shop) do
		{
			case "cop": {_array = cop_shop_items select 2;};
			case "reb": {_array = reb_shop_items select 2;};
			case "gun": {_array = gun_shop_items select 2;};
			case "gen": {_array = gen_shop_items select 2;};
			case "dive": {_array = dive_shop_items select 2;};
			case "gang": {_array = gang_shop_items select 2;};
			case "donator": {_array = donator_shop_items select 2;};
			case "sergeant":	{_array = sergeant_shop_items select 2;};
			case "officer":	{_array = officer_shop_items select 2;};
			case "admin":	{_array = admin_shop_items select 2;};
			case "reb2":	{_array = reb_shop2_items select 2;};
			case "reb3":	{_array = reb_shop3_items select 2;};
			case "reb4":	{_array = reb_shop4_items select 2;};
		};
		
		{
			_class = _x select 0;
			_price = _x select 1;
			
			if(isClass (configFile >> "CfgWeapons" >> _class)) then
			{
				_name = getText(configFile >> "CfgWeapons" >> _class >> "displayName");
				_pic = getText(configFile >> "CfgWeapons" >> _class >> "picture");
				
				_list lbAdd format["%1",_name];
				_list lbSetPicture [(lbSize _list)-1,_pic];
				_list lbSetData [(lbSize _list)-1,_class];
				_list lbSetValue [(lbSize _list)-1,_price];
			}
				else
			{
				_list lbAdd format["%1", _class];
				_list lbSetData [(lbSize _list)-1,_class];
				_list lbSetValue [(lbSize _list)-1,_price];
			};
		} foreach _array;
	};
	
	case "packs":
	{
		switch (_shop) do
		{
			case "cop": {_array = cop_shop_items select 3;};
			case "gen": {_array = gen_shop_items select 3;};
			case "gang": {_array = gang_shop_items select 3;};
			case "donator": {_array = donator_shop_items select 3;};
			case "sergeant":	{_array = sergeant_shop_items select 3;};
			case "officer":	{_array = officer_shop_items select 3;};
			case "admin":	{_array = admin_shop_items select 3;};
			case "reb2":	{_array = reb_shop2_items select 3;};
			case "reb3":	{_array = reb_shop3_items select 3;};
			case "reb4":	{_array = reb_shop4_items select 3;};
		};
		
		{
			_class = _x select 0;
			_price = _x select 1;
			_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> _class >> "picture");
			
			_list lbAdd format["%1",_name];
			_list lbSetPicture [(lbSize _list)-1,_pic];
			_list lbSetData [(lbSize _list)-1,_class];
			_list lbSetValue [(lbSize _list)-1,_price];
		} foreach _array;
	};
	
	case "glass":
	{
		switch (_shop) do
		{
			case "cop": {_array = cop_shop_items select 4;};
			case "gen": {_array = gen_shop_items select 4;};
			case "dive": {_array = dive_shop_items select 4;};
			case "gang": {_array = gang_shop_items select 4;};
			case "donator": {_array = donator_shop_items select 4;};
			case "sergeant":	{_array = sergeant_shop_items select 4;};
			case "officer":	{_array = officer_shop_items select 4;};
			case "admin":	{_array = admin_shop_items select 4;};
			case "reb2":	{_array = reb_shop2_items select 4;};
			case "reb3":	{_array = reb_shop3_items select 4;};
			case "reb4":	{_array = reb_shop4_items select 4;};
		};
		
		{
			_class = _x select 0;
			_price = _x select 1;
			_name = getText(configFile >> "CfgGlasses" >> _class >> "displayName");
			_pic = getText(configFile >> "CfgGlasses" >> _class >> "picture");
			
			_list lbAdd format["%1",_name];
			_list lbSetPicture [(lbSize _list)-1,_pic];
			_list lbSetData [(lbSize _list)-1,_class];
			_list lbSetValue [(lbSize _list)-1,_price];
		} foreach _array;
	};
};

[_type] call life_fnc_shop_pChangeMenu;