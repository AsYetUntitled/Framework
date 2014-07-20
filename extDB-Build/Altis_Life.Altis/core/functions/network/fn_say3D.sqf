private["_object","_sound"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;

if(isNull _object OR _sound == "") exitWith {};
_object say3D _sound;