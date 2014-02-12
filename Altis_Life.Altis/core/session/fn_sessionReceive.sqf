#include <macro.h>
/*
	File: fn_sessionReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Received information from the server and sorts information and
	initializes the player, if no data is found it starts the session
	creation process.
*/
private["_session"];
_session = _this;
diag_log format["CLIENT: %1 :: %2", typeName _session,_session];
life_session_tries = life_session_tries + 1;
if(life_session_tries > 3) exitWith {cutText["Can't setup your session with the server. You have reached the maximum tries of 3. Please reconnect.","BLACK FADED"];0 cutFadeOut 9999999;};
cutText["Received information from the server...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling types
if(isNil "_session") exitWith {[] spawn life_fnc_sessionCreate;};
if(typeName _session == "STRING") exitWith {cutText[format["%1",_session],"BLACK FADED"];0 cutFadeOut 9999999;};
if(count _session == 0) exitWith {[] spawn life_fnc_sessionCreate;};
if(_session select 0 == "Error") exitWith {[] spawn life_fnc_sessionCreate;};

/*
	All data passed from the server is a string, you will need to format 
	it accordingly when adding additional stuff, if it is a number/scalar
	you will use parseNumber and everything else you need to compile.
	
	*	SCALAR/NUMBER: parseNumber(_session select index)
	* 	STRING: (_session select index)
	*	ARRAY: (_session select index)
	*	ALL OTHER: call compile format["%1",(_session select index)];
*/
switch (playerSide) do
{
	case west:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_cash = parseNumber(_session select 2);
		life_atmcash = parseNumber(_session select 3);
		__CONST__(life_coplevel,parseNumber(_session select 4));
		if(count (_session select 5) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 5);
		};
		cop_gear = (_session select 6);
		__CONST__(life_adminlevel,parseNumber(_session select 7));
		life_blacklisted = call compile format["%1",(_session select 8)];
		[] spawn life_fnc_loadGear;
		//if(life_adminlevel > 0) then {[] execVM "core\client\aconfig.sqf";};
		__CONST__(life_donator,parseNumber(_session select 9));
	};
	
	case civilian:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_cash = parseNumber(_session select 2);
		life_atmcash = parseNumber(_session select 3);
		if(count (_session select 4) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 4);
		};
		life_is_arrested = call compile format["%1",(_session select 5)];
		__CONST__(life_adminlevel,parseNumber(_session select 6));
		__CONST__(life_donator,parseNumber(_session select 7));
		civ_gear = (_session select 8);
		[] spawn life_fnc_civLoadGear;
		__CONST__(life_coplevel,0);
	};
};

switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 750;};
	case 2: {life_paycheck = life_paycheck + 1500;};
	case 3: {life_paycheck = life_paycheck + 2000;};
};

if((getPlayerUID player) != (_session select 0)) exitWith {[] spawn life_fnc_sessionCreate;}; //Since it didn't match create the session again?
cutText["Received information from server and validated it, you are almost ready.","BLACK FADED"];
0 cutFadeOut 9999999;
life_session_completed = true;