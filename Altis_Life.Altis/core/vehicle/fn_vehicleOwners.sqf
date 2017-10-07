/*
    File: fn_vehicleOwners.sqf
    Author:

    Description:
    Pulled from old system, will be revised for new system.
*/
params [
	"_owners"
];
private _return = "";

{
    private _format = format ["%1<br/>",_x select 1];
    _return = _return + _format;
} forEach _owners;

_return;
