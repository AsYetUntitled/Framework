private["_object","_index","_texture"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_index = [_this,1,0,[0]] call BIS_fnc_param;
_texture = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _object OR _texture == "") exitWith {};
_object setObjectTexture[_index,_texture];