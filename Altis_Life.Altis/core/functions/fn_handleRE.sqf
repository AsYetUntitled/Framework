/**
    Author: SimZor
    
    Parameter(s):
        0: STRING            - Function to call
        1: ARRAY             - Array with arguments to pass to function via RE
        2: (OPTIONAL) NUMBER - Selection of command
            0 (DEFAULT): Execute in unscheduled environment
            1:           Execute in scheduled environment
        3: (OPTIONAL) STRING - In case of two different functions, that does the same thing 
                               (reverse compatibility), i.e. HC_fnc_updateGang and TON_fnc_updateGang,
                               this should be passed with the value to the function on the Headless Client.
        
    Returns:
        BOOLEAN - true if successful, else false
        
    Description:
        Handles whether a function is executed on server or headless client
*/

params [
    ["_args", [], [[]]],
    ["_fncString", "", [""]],
    ["_mode", 0, [0]],
    ["_fncStringAlt", "", [""]]
];

if (_fncString isEqualTo "") exitWith {
    diag_log "No function string passed to function. Exiting.";
    false
};

private _target = [RSERV, HC_Life] select life_HC_isActive;
private _argsArr = [_fncString, _target];

if (!(_fncStringAlt isEqualTo "") && {life_HC_isActive}) then {
    _argsArr = [_fncStringAlt, _target]
};

if (_mode isEqualTo 1) then {
    _args remoteExec _argsArr
} else {
    _args remoteExecCall _argsArr
};

true
