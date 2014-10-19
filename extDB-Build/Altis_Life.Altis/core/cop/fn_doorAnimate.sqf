private["_b","_doors","_door"];
_b = _this select 0;
_doors = 1;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _b) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _b selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _b modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.

if(_b animationPhase format["door_%1_rot",_door] == 0) then {
	_b animate[format["door_%1_rot",_door],1];
} else {
	_b animate[format["door_%1_rot",_door],0];
};

closeDialog 0;