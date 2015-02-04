#include <macro.h>
/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then {
	if(!life_istazed) then {
		life_istazed = true;
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(!(EQUAL(RIFLE,""))) then {RIFLE_ITEMS} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(!(EQUAL(count _attach,0)) && !(EQUAL(RIFLE,""))) then {
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		
		if(!(EQUAL(count _curMags,0))) then {
			{player addMagazine _x;} foreach _curMags;
		};
		
		[[_unit],"life_fnc_tazeSound",true,false] call life_fnc_MP;
		_obj = "Land_ClutterCutter_small_F" createVehicleLocal ASLTOATL(visiblePositionASL player); //Again why in the fuck was this being created globally? I could of sworn I made it local back in ARMA 3 Beta...
		_obj setPosATL ASLTOATL(visiblePositionASL player);
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] call life_fnc_MP;
		[[0,"STR_NOTF_Tazed",true,[profileName, _shooter GVAR ["realname",name _shooter]]],"life_fnc_broadcast",true,false] call life_fnc_MP;
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] call life_fnc_MP;
		if(!(player GVAR ["Escorting",false])) then {
			detach player;
		};
		life_istazed = false;
		player allowDamage true;
		disableUserInput false;
	};
} else {
	_unit allowDamage true;
	life_iztazed = false;
};