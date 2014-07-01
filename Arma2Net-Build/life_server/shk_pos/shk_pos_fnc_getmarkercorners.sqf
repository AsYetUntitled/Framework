//  In: marker
// Out: array of positions
private ["_area","_corners"];
_area    = _this;
_corners = [];

// Center point
private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _area;
_centerX = _center select 0;
_centerY = _center select 1;

// Direction and make sure it's between 0 and 360.
private ["_dir","_dirCos","_dirSin"];
_dir    = (markerDir _area) * -1;
_dir    = _dir % 360;
_dirCos = cos _dir;
_dirSin = sin _dir;

// Size
private ["_size","_sizeX","_sizeY"];
_size  = getMarkerSize _area;
_sizeX = _size select 0;
_sizeY = _size select 1;


private ["_cosX","_sinX","_cosY","_sinY","_addX","_addY","_subX","_subY"];
_cosX = _dirCos * _sizeX;
_sinX = _dirSin * _sizeX;
_cosY = _dirCos * _sizeY;
_sinY = _dirSin * _sizeY;

_addX = _cosX + _sinY;
_addY = _sinX + _cosY;
_subX = _cosX - _sinY;
_subY = _sinX - _cosY;

private ["_posX","_posY"];
// Bottom Left
_posX = _centerX - _subX;
_posY = _centerY - _addY;
_corners set [0,[_posX,_posY]];

// Top Left
_posX = _centerX - _addX;
_posY = _centerY - _subY;
_corners set [1,[_posX,_posY]];

// Top Right
_posX = _centerX + _subX;
_posY = _centerY + _addY;
_corners set [2,[_posX,_posY]];

// Bottom Right
_posX = _centerX + _addX;
_posY = _centerY + _subY;
_corners set [3,[_posX,_posY]];

_corners