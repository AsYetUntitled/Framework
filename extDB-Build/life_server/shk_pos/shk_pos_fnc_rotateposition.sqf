//  In: [position,direction]
// Out: position
private ["_pos","_dir","_orgX","_orgY","_newX","_newY"];
_pos = _this select 0;
_dir = _this select 1;

_orgX = _pos select 0;
_orgY = _pos select 1;

_newX = (_orgX * (cos _dir)) - (_orgY * (sin _dir));
_newY = (_orgX * (sin _dir)) + (_orgY * (cos _dir));

[_newX,_newY]