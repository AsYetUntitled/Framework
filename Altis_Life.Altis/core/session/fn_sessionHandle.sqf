/*
	File: fn_sessionHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	I don't know why i'm creating a separate file for this but OK, it's to handle requests going out
	and cap out how many times a request can be called per second.
	
	Params:
	0 Type:
		1: Update
		*MORE TO COME WHEN I CAN REFINE THE SYSTEM*
	1 Void:
		true: Override and process
		false: Follow standard procedure
*/
private["_type","_void"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_void = [_this,1,false,[false]] call BIS_fnc_param;
if(_type == 0) exitWith {};

switch(_type) do
{
	case 1: 
	{
		if(_void) then
		{
			[] call life_fnc_sessionUpdate;
		}
			else
		{
			if((time - life_query_time) < 10) exitWith {}; //Updates can only be done over 30 seconds at a time.
			life_query_time = time;
			[] call life_fnc_sessionUpdate;
		};
	};
};