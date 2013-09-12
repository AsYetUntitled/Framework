/*  Select a random position from an area defined by a marker.
     In: [marker,water,blacklist,emptySpace]
    Out: position
*/
private ["_area","_water","_blist","_pos","_empty"];
_area = _this select 0;
_water = if (count _this > 1) then {_this select 1} else {0};
_blist = if (count _this > 2) then {_this select 2} else {[]};
_empty = if (count _this > 3) then {_this select 3} else {[]};
_pos = [];

if (typename _blist == "STRING") then {_blist = [_blist]};

private ["_shape"];
_shape = _area call SHK_pos_fnc_getMarkerShape;

// Limited loop so the script won't get stuck
private ["_i","_exit"];
_exit = false;
for [{_i = 0}, {_i < 1000 && !_exit}, {_i = _i + 1}] do {

	// Rectangle or Ellipse marker given?
	if (_shape in ["SQUARE","RECTANGLE"]) then {
	  _pos = _area call SHK_pos_fnc_getPosFromRectangle;
	} else {
	  _pos = _area call SHK_pos_fnc_getPosFromEllipse;
	};

  // Find empty position
  private ["_dst","_veh","_p"];
  
  _dst = 200;
  _veh = "";
  switch (typename _empty) do {
    case (typename objNull): { _veh = typeof _empty }; // Only vehicle given, use default distance
    case ("STRING"): { _veh = _empty };
    case (typename []): {
      if (count _empty > 0) then {
        _dst = _empty select 0;
        _veh = _empty select 1;
        if (typename _veh == typename objNull) then { _veh = typeof _veh };
      };
    };
  };

  _p = _pos findEmptyPosition [0,_dst,_veh];
  
  // If an empty position is found, use it. Otherwise, return the original position.
  if (count _p > 0) then {
    _pos = _p;
  };

	// Water position
	if (typeName _water == "SCALAR") then {
	  switch _water do {
	  
		case 0: { // Water position is not allowed
		  // Position is on land, try to exit script.
		  if !(surfaceIsWater _pos) then {
			_exit = true;
		  };
		};
		
		case 1: { // Doesn't matter if position is on water or land.
		  _exit = true;
		};
	  
		case 2: { // Only water position is allowed
		  // Position is on water, try to exit script.
		  if (surfaceIsWater _pos) then {
			_exit = true;
		  };
		};
	  };
	} else { // For backward compatibility
	  // Water position is not allowed
	  if !_water then {
		// Position is on land, try to exit script.
		if !(surfaceIsWater _pos) then {
		  _exit = true;
		};
	  // Doesn't matter if position is on water or land.
	  } else {
		_exit = true;
	  };
	};

	// Position is not allowed in blacklisted areas
	if (count _blist > 0 && _exit) then {
	  // Check each blacklist marker
	  {
		// If blacklisted, jump out of blacklist check and continue main loop.
		if ([_pos,_x] call SHK_pos_fnc_isBlacklisted) exitwith {
		  _exit = false;
		};
	  } foreach _blist;
	};
};

// Return position
_pos