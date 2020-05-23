params ["_injured", "_healer", "_isMedic"];
_damage = damage _injured;
waitUntil { damage _injured != _damage };
[] call life_fnc_hudUpdate;
