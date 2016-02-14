#include "..\..\script_macros.hpp"
/*
	File: fn_lockupHouse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks up the entire house and closes all doors.
*/
private["_house"];
_house = param [0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

_numberOfDoors = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(typeOf _house), "numberOfDoors");

if(EQUAL(_numberOfDoors,-1) OR EQUAL(_numberOfDoors,0)) exitWith {}; //MEH

titleText [localize "STR_House_LockingUp","PLAIN"];
sleep 3;

for "_i" from 1 to _numberOfDoors do {
	_house animate[format["door_%1_rot",_i],0];
	_house SVAR [format["bis_disabled_Door_%1",_i],1,true];
};

_house SVAR ["locked",true,true];
titleText[localize "STR_House_LockedUp","PLAIN"];