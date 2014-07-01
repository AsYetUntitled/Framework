//  In: [position,blackListMarker]
// Out: boolean

private ["_pos","_area","_return"];
_pos = _this select 0;
_area = _this select 1;
_return = false;

// Find corner positions of the rectangle
private ["_dir"];
_dir = markerDir _area;
_dir = _dir % 360;

// Center point
private ["_center","_centerX","_centerY"];
_center  = getMarkerPos _area;
_centerX = _center select 0;
_centerY = _center select 1;

private ["_shape"];
_shape = _area call SHK_pos_fnc_getMarkerShape;

if (_shape == "ICON") then {
  // Icon has only one position, so if it equals to the given position, then it's blacklisted.
  if ([_pos,_center] call SHK_pos_fnc_isSamePosition) then {
    _return = true;
  };

// Markers that have an area.
} else {
  if (_shape in ["RECTANGLE","SQUARE"]) then {
    private ["_corners"];
    _corners = _area call SHK_pos_fnc_getMarkerCorners;

    // If rectangle is not axis-aligned.
    if (_dir % 90 != 0) then {
      // Add the point position to the array to have it shifted by the FOR below
      _corners set [4,_pos];
      
      // Rotate each corner position so that the rectangle is aligned with x and y axises
      // Use origo as center while rotating, but for comparison shift positions back
      private ["_posCor","_posNew","_orgX","_orgY","_shiftedX","_shiftedY","_newX","_newY"];
      for "_i" from 0 to (count _corners - 1) do {
        _posCor = _corners select _i;
        
        // Original coordinates
        _orgX = _posCor select 0;
        _orgY = _posCor select 1;
        
        // Subtract the marker center coordinates from corner coordinates.
        // Rotation is done using origo (0,0) as anchor/centerpoint.
        _shiftedX = _orgX - _centerX;
        _shiftedY = _orgY - _centerY;
        
        // Axis-aligned corner position
        _posNew = [[_shiftedX,_shiftedY],_dir] call SHK_pos_fnc_rotatePosition;
        
        // Shift the aligned corner position back near to the original marker location.
        _newX = _posNew select 0;
        _newY = _posNew select 1;
        _newX = _newX + _centerX;
        _newY = _newY + _centerY;
        
        _posCor = [_newX,_newY];
        
        _corners set [_i,_posCor];
      };

      // Point position
      _pos = _corners select 4;
    };
    
    // Check if the position is within the marker area.
    _return = [_pos,_corners] call SHK_pos_fnc_isInRectangle;
  } else {
    if (_shape == "CIRCLE") then {
      _return = [_pos,_area] call SHK_pos_fnc_isInCircle;
    } else {
      _return = [_pos,_area] call SHK_pos_fnc_isInEllipse;
    };
  };
};


_return