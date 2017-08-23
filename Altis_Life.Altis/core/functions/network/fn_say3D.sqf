/*
    File: fn_say3D.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Optimisations and applicability for say3D alt. syntax by SimZor

    Description: 
        Pass your sounds that you want everyone nearby to hear through here. 
        Function usable when sounds needs to be broadcasted globally so everyone can hear them, should be used via remote execution.

    Example(s):
        1: [vehicle player, "siren"] remoteExecCall ["life_fnc_say3D", RANY];
        2: [objNull, "", ["soundName", maxDistance, pitch] remoteExecCall ["life_fnc_say3D", RANY];
        3: [objNull, "", ["soundNae", maxDistance, pitch], [from, to]] remoteExecCall ["life_fnc_say3D", RANY];
*/

params [
    ["_object", objNull, [objNull]],
    ["_soundID", "", [""]],
    ["_altSyntax", [], [[]]],
    ["_altSyntax2", [], [[]]]
];

if (isNull _object) exitWith {};
if (_soundID isEqualTo "") exitWith {};

// Setup arguments to pass into say3D command
private _arguments = [_soundID, _altSyntax] select !(_altSyntax isEqualTo []);
private _objectArguments = [_object, _altSyntax2] select !(_altSyntax2 isEqualTo []);

// Play Sound
_objectArguments say3D _arguments
