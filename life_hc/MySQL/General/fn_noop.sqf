/*
	File: fn_noop.sqf
*/
private _fnc_doNoop = {
	for "_i" from 0 to 10 step 1 do
	{
		["noop", 1] call HC_fnc_asyncCall;
	}
};
private _routines = [
	[[], _fnc_doNoop, 3600]
];
{
    _x pushBack (diag_tickTime + (_x # 2));
} forEach _routines;
for "_i" from 0 to 1 step 0 do {
    {
        _x params ["_params", "_function", "_delay", "_timeToRun"];
        if (diag_tickTime > _timeToRun) then {
            _params call _function;
            _x set [3, diag_tickTime + _delay];
        };
    } forEach _routines;
    uiSleep 60;
};
