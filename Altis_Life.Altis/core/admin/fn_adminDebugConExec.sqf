#include "..\..\script_macros.hpp"
/*
    File: fn_adminDebugConExec.sqf
    Author: KLM

    Description:
    Remotely executes code for the temporary debug console
    p.s not entirely sure on how secure this all this ¯\_(ツ)_/¯
*/
params [
    ["_code", "", [""]]
];

[] call compile _code;