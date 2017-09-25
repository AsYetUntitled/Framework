/**
    Author: SimZor
    
    Parameter(s):
        0: NUMBER - Selection of command
            0 (DEFAULT): Execute in unscheduled environment
            1: Execute in scheduled environment
        1: STRING - Function to call
        2: ARRAY - Array with arguments to pass to function via RE
        
    Returns:
        BOOLEAN: True if successfull, else false
        
    Description:
        Handles whether a function is executed on server or headless client
*/

params [
    ["_args", [], [[]]],
    ["_fncString", "", [""]],
    ["_mode", 0, [0]]
];

if (_fncString isEqualTo "") exitWith {
    diag_log "No function string passed to function. Exiting.";
    false
};

private _target = [RSERV, HC_Life] select life_HC_isActive;
private _argsArr = [_fncString, _target];

if (_mode isEqualTo 1) then {
    _args remoteExec _argsArr
} else {
    _args remoteExecCall _argsArr
};

true
