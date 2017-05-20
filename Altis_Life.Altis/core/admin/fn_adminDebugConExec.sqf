#include "..\..\script_macros.hpp"
/*
    File: fn_adminDebugConExec.sqf
    Author: KLM

    Description:
    Remotely executes code for the temporary debug console
    Worth mentioning this is probably not secure at all
*/
params [
    ["_code", "", [""]]
];

[] call compile _code;