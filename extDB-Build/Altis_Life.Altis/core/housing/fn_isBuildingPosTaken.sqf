private["_position","_nearestObjs"];
_position = [_this,0,[],[[]]] call BIS_fnc_param;
if(count _position == 0) exitWith {hint "POS = 0"; true};
_tmp = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
_tmp setPosATL _position;
_nearestObjs = nearestObjects [_tmp,["B_supplyCrate_F","Box_IND_Grenades_F"],4];
deleteVehicle _tmp;
if(count _nearestObjs == 0) then {false} else {true};
