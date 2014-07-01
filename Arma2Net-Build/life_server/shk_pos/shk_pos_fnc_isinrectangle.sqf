//  In: [pointPosition,corners]
// Out: boolean
private ["_pos","_corners","_return"];
_pos     = _this select 0;
_corners = _this select 1;
_return  = false;

private ["_dotX","_dotY","_bottomLeft","_left","_bottom","_topRight","_right","_top"];
_dotX = _pos select 0;
_dotY = _pos select 1;

_bottomLeft = _corners select 0;
_left       = _bottomLeft select 0;
_bottom     = _bottomLeft select 1;

_topRight   = _corners select 2;
_right      = _topRight select 0;
_top        = _topRight select 1;

// x is between left and right
// y is between bottom and top
if (_dotX >= _left && _dotX < _right && _dotY >= _bottom && _dotY < _top) then {
  _return = true;
};

_return