#include "..\..\script_macros.hpp"
/*
    File: fn_postNewsBroadcast.sqf
    Author: Jesse "tkcjesse" Schultz

    Description:
    Handles actions after the broadcast button is clicked.
*/
private ["_broadcastHeader","_broadcastMessage","_length","_badCharacter","_characterByte","_allowed","_allowedLength"];
disableSerialization;
_broadcastHeader = ctrlText (CONTROL(100100,100101));
_broadcastMessage = ctrlText (CONTROL(100100,100102));
_length = count (toArray (_broadcastHeader));
_characterByte = toArray (_broadcastHeader);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
_allowedLength = LIFE_SETTINGS(getNumber,"news_broadcast_header_length");
_badCharacter = false;

if (_length > _allowedLength) exitWith {hint format [localize "STR_News_HeaderLength",_allowedLength];};

{
    if (!(_x in _allowed)) exitWith {_badCharacter = true;};
} forEach _characterByte;

if (_badCharacter) exitWith {hint localize "STR_News_UnsupportedCharacter"};

[_broadcastHeader,_broadcastMessage,profileName] remoteExec ['life_fnc_AAN',-2];

CASH = CASH - LIFE_SETTINGS(getNumber,"news_broadcast_cost");
[0] call SOCK_fnc_updatePartial;
life_broadcastTimer = time;
publicVariable "life_broadcastTimer";