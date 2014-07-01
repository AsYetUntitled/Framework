/*
	Pulled from old system, will be revised for new system.
*/
private["_data","_return","_format"];
_data = _this select 0;
_return = "";

{
	_format = format["%1<br/>",_x select 1];
	_return = _return + _format;
} foreach _data;

_return;