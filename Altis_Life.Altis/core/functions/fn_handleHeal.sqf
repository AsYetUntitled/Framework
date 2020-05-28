private ["_injured", "_healer", "_isMedic", "_damage", "_id"];
params
[
  ["_injured", objNull],
  ["_healer", objNull],
  ["_isMedic", false]
];
_damage = damage _injured;
waitUntil { damage _injured != _damage };
_id = owner _injured;
[] remoteExec ["life_fnc_hudUpdate", _id];
