params
[
  ["_injured", objNull],
  ["_healer", objNull],
  ["_isMedic", false]
];
_damage = damage _injured;
waitUntil { damage _injured != _damage };
[] remoteExec ["life_fnc_hudUpdate", _injured, false];
