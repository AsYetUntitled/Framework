// Return the closest position from array to the positionA.
//  In: [positionA,[array of positions]]
// Out: positionB
private ["_pA","_ps","_p1","_p2"];
_pA = _this select 0;
_ps = _this select 1;

_p1 = _ps select 0;

if (count _ps > 1) then {
  for "_i" from 1 to (count _ps - 1) do {
    _p2 = _ps select _i;
    if ((_p2 distance _pA) < (_p1 distance _pA)) then {
      _p1 = _p2;
    };
  };
};

_p1