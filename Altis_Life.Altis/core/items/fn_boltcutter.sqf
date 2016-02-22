#include "..\..\script_macros.hpp"
/*
	File: fn_boltcutter.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = param [0,ObjNull,[ObjNull]];

if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if(((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) && ({side _x == west} count playableUnits < (LIFE_SETTINGS(getNumber,"cops_online_min")))) exitWith {
	hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"cops_online_min"))]
};
if((typeOf _building) == "Land_Research_house_V1_F" && life_fed_break == 0) exitWith {hint localize "STR_ISTR_Bolt_Exploit"};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
} else {
	[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};

_doors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _building), "numberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building GVAR [format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.08;}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_isknocked) exitWith {}; //Knocked
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknocked) exitWith {life_action_inUse = false;};
if((player GVAR ["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;

if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call life_fnc_handleInv;
	life_boltcutter_uses = 0;
};

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {if(life_fed_break == 0) then {life_fed_break = 1;};};
	case "Land_Research_house_V1_F": {life_fed_break = 2;};
};

_building SVAR [format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building GVAR ["locked",false])) then {
	_building SVAR ["locked",false,true];
};

if(life_HC_isActive) then {
	[getPlayerUID player,profileName,"459"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
} else {
	[getPlayerUID player,profileName,"459"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};
