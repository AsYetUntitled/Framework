#include "..\..\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_CrateModelNames","_crate"];
_curTarget = cursorTarget;
_curObject = cursorObject;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);

if(EQUAL(LIFE_SETTINGS(getNumber,"global_ATM"),1)) then{
	//Check if the player is near an ATM.
	if((call life_fnc_nearATM) && {!dialog}) exitWith {
		[] call life_fnc_atmMenu;
	};
};

if(isNull _curTarget) exitWith {
	if(_isWater) then {
		_fishconfig = LIFE_SETTINGS(getArray,"animaltypes_fish");
		_fishTypes = [position player, _fishconfig, 3] call life_fnc_nearestObjects;
		if(count _fishTypes > 0) then {
			_fish = _fishTypes select 0;
			if ((typeOf _fish) == "Turtle_F" && !alive _fish) then {
				[_fish] call life_fnc_catchFish;
			} else {
				if (!((typeOf _fish) == "Turtle_F")) then {
					[_fish] call life_fnc_catchFish;
				};
			};
		};
	} else {
		_animalconfig = LIFE_SETTINGS(getArray,"animaltypes_hunting");
		_animals = [position player, _animalconfig, 3.5] call life_fnc_nearestObjects;
		if (count _animals > 0) then {
			_animal = _animals select 0;
			if (!alive _animal) then {
				[_animal] call life_fnc_gutAnimal;
			};
		} else {
			if(playerSide == civilian && !life_action_gathering) then {
				if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
				life_action_gathering = true;
				_handle = [] spawn life_fnc_gather;
				waitUntil {scriptDone _handle};
				life_action_gathering = false;
			};
		};
	};
};

if((_curTarget isKindOf "B_supplyCrate_F" OR _curTarget isKindOf "Box_IND_Grenades_F") && {player distance _curTarget < 3} ) exitWith {
	if(alive _curTarget) then {
		[_curTarget] call life_fnc_containerMenu;
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && !(_curTarget GVAR["Revive",false]) && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide == west && {(EQUAL(LIFE_SETTINGS(getNumber,"revive_cops"),1))}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget GVAR ["restrained",false]) && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money","_list"];

	_list = ["landVehicle","Ship","Air"];
	_isVehicle = if(KINDOF_ARRAY(_curTarget,_list)) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";

	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < SEL(SEL(boundingBox _curTarget,1),0)+2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		//OK, it wasn't a vehicle so let's see what else it could be?
		if((typeOf _curObject) in _miscItems) then {
			[_curObject,player,false] remoteExecCall ["TON_fnc_pickupAction",RSERV];
		} else {
			//It wasn't a misc item so is it money?
			if(EQUAL((typeOf _curObject),_money) && {!(_curObject GVAR ["inUse",false])}) then {
				[_curObject,player,true] remoteExecCall ["TON_fnc_pickupAction",RSERV];
			};
		};
	};
};
