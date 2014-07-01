//  In: [position,distance,direction]
// Out: position
private ["_pos","_dst","_dir","_orgX","_orgY","_posX","_posY"];
_pos = _this select 0;
_dst = _this select 1;
_dir = _this select 2;

_orgX = _pos select 0;
_orgY = _pos select 1;
_posX = _orgX + (_dst * sin _dir);
_posY = _orgY + (_dst * cos _dir);

[_posX,_posY,0]