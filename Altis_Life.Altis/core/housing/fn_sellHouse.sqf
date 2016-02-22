#include "..\..\script_macros.hpp"
/*
	File: fn_sellHouse.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz

	Description:
	Sells the house and delete all container near house.
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = steamid;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "house_owner"}) exitWith {hint "There is no owner for this house."};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round(SEL(_houseCfg,0)/2)) call life_fnc_numberText,
	SEL(_houseCfg,1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house SVAR ["house_sold",true,true];
	
	if(life_HC_isActive) then {
		[_house] remoteExecCall ["HC_fnc_sellHouse",HC_Life];
	} else {
		[_house] remoteExecCall ["TON_fnc_sellHouse",RSERV];
	};
	
	_house SVAR ["locked",false,true];
	_house SVAR ["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house GVAR "uid"];
	_house SVAR ["uid",nil,true];

	BANK = BANK + (round((_houseCfg select 0)/2));
	_index = life_vehicles find _house;

	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};

	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house), "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house SVAR [format["bis_disabled_Door_%1",_i],0,true];
	};
	_containers = [getPosATL _house, ["Box_IND_Grenades_F","B_supplyCrate_F"], 9] call life_fnc_nearestObjects;
	if (count _containers > 0) then {
		{
			_x SVAR ["Trunk",nil,true];
			
			if(life_HC_isActive) then {
				[_x] remoteExecCall ["HC_fnc_sellHouseContainer",HC_Life];
			} else {
				[_x] remoteExecCall ["TON_fnc_sellHouseContainer",RSERV];
			};
			
		} forEach _containers;
	};
};
