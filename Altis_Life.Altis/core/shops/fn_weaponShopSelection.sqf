#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopSelection.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks the weapon & adds the price tag.
*/
private["_control","_index","_shop","_priceTag","_price","_item","_itemArray"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if(isNull _control) exitWith {closeDialog 0;}; //Bad data
if(_index == -1) exitWith {}; //Nothing selected

_priceTag = CONTROL(38400,38404);

if((GVAR_UINS ["Weapon_Shop_Filter",0]) == 1) then {
	_item = CONTROL_DATAI(_control,_index);
	_itemArray = M_CONFIG(getArray,"WeaponShops",_shop,"items");
	_item = [_item,_itemArray] call TON_fnc_index;
	_price = SEL(SEL(_itemArray,_item),3);
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
	_control lbSetValue[_index,_price];
} else {
	_price = _control lbValue _index;
	_item = CONTROL_DATAI(_control,_index);
	if(_price > CASH) then {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#ff0000'>$%1</t><br/>You lack: <t color='#8cff9b'>$%2</t></t>",[(_price)] call life_fnc_numberText,[(_price - CASH)] call life_fnc_numberText];
	} else {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
	};
	if((GVAR_UINS ["Weapon_Magazine",0]) == 0 && (GVAR_UINS ["Weapon_Accessories",0]) == 0) then {
			if(isClass (configFile >> "CfgWeapons" >> _item)) then {
				//Magazines menu
				if(isArray (configFile >> "CfgWeapons" >> _item >> "magazines")) then {
					private["_mags"];
					_mags = [];
					{
						_mags pushBack (_x select 0);
					} forEach M_CONFIG(getArray,"WeaponShops",_shop,"mags");
					_itemArray = FETCH_CONFIG2(getArray,"CfgWeapons",_item,"magazines");
					if(count (_itemArray ArrayIntersect _mags) > 0) then {
						((findDisplay 38400) displayCtrl 38406) ctrlEnable true;
					} else {
						((findDisplay 38400) displayCtrl 38406) ctrlEnable false;
					};
				} else {
					((findDisplay 38400) displayCtrl 38406) ctrlEnable false;
				};

				//Accessories Menu
				if(isClass (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo")) then {
					private["_slotArray","_weaponArray","_accs"];
					_accs = [];
					{
						_accs pushBack (_x select 0);
					} forEach M_CONFIG(getArray,"WeaponShops",_shop,"accs");
					_weaponArray = [];
					if(isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then {
						_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","CowsSlot","compatibleItems");
						{
							_weaponArray pushBack _x;
						} forEach _slotArray;
					};
					if(isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) then {
						_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","MuzzleSlot","compatibleItems");
						{
							_weaponArray pushBack _x;
						} forEach _slotArray;
					};
					if(isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems")) then {
						_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","PointerSlot","compatibleItems");
						{
							_weaponArray pushBack _x;
						} forEach _slotArray;
					};
					if(isArray (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")) then {
						_slotArray = FETCH_CONFIG3(getArray,"CfgWeapons",_item,"WeaponSlotsInfo","UnderBarrelSlot","compatibleItems");
						{
							_weaponArray pushBack _x;
						} forEach _slotArray;
					};
					if(count (_weaponArray ArrayIntersect _accs) > 0) then {
						((findDisplay 38400) displayCtrl 38407) ctrlEnable true;
					} else {
						((findDisplay 38400) displayCtrl 38407) ctrlEnable false;
					};
				} else {
					((findDisplay 38400) displayCtrl 38407) ctrlEnable false;
				};
			} else {
			((findDisplay 38400) displayCtrl 38406) ctrlEnable false;
			((findDisplay 38400) displayCtrl 38407) ctrlEnable false;
		};
	};
};
