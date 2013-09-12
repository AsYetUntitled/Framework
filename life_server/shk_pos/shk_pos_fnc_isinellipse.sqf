//  In: [position,ellipseMarker]
// Out: boolean

private ["_pos","_area","_return"];
_pos = _this select 0;
_area = _this select 1;
_return = false;

// Ellipse size
private ["_size","_sizeX","_sizeY"];
_size  = getMarkerSize _area;
_sizeX = _size select 0;
_sizeY = _size select 1;

// Direction and make sure it's between 0 and 360.
private ["_dir"];
_dir = markerDir _area;
_dir = _dir % 360;

// Ellipse center position
private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _area;
_centerX = _center select 0;
_centerY = _center select 1;

// If marker is not axis-aligned, rotate the dot position.
if (_dir % 90 != 0) then {
  private ["_orgX","_orgY","_shiftedX","_shiftedY"];
  _orgX = _pos select 0;
  _orgY = _pos select 1;
  _shiftedX = _orgX - _centerX;
  _shiftedY = _orgY - _centerY;
  _pos = [[_shiftedX,_shiftedY],_dir] call SHK_pos_fnc_rotatePosition;
  _pos set [0,(_pos select 0) + _centerX];
  _pos set [1,(_pos select 1) + _centerY];
};
// Dot position
private ["_posX","_posY"];
_posX = _pos select 0;
_posY = _pos select 1;

// Distance between dot and ellipse center
private ["_dstX","_dstY"];
_dstX = abs(_posX - _centerX);
_dstY = abs(_posY - _centerY);

private ["_sum"];
_sum = ((_dstX * _dstX)/(_sizeX * _sizeX)) + ((_dstY * _dstY)/(_sizeY * _sizeY));

if (_sum <= 1) then {
  _return = true;
};

_return