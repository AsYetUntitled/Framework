//  In: marker
// Out: position

// Center point
private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _this;
_centerX = _center select 0;
_centerY = _center select 1;

// Size
private ["_size"];
_size  = getMarkerSize _this;
_size = _size select 0;

// Randomly pick a direction, 
private ["_dir","_posX","_posY","_rand","_pos"];
_dir  = random 360;
_rand = sqrt random 1;
_posX = (_size * (cos _dir)) * _rand;
_posY = (_size * (sin _dir)) * _rand;
_pos  = [_posX,_posY];

_posX = _centerX + (_pos select 0);
_posY = _centerY + (_pos select 1);

[_posX,_posY,0]
