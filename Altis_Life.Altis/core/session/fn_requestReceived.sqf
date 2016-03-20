#include "..\..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
private["_array"];
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(typeName _this,"STRING")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(count _this,0)) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(SEL(_this,0),"Error")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(!(EQUAL(steamid,SEL(_this,0)))) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donorlevel")) exitWith {
	[profileName,getPlayerUID player,"VariablesAlreadySet"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
	[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donorlevel: %3",life_adminlevel,life_coplevel,life_donorlevel]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
	sleep 0.9;
	failMission "SpyGlass";
};

//Parse basic player information.
CASH = parseNumber (SEL(_this,2));
BANK = parseNumber (SEL(_this,3));
CONST(life_adminlevel,parseNumber (SEL(_this,4)));
if(EQUAL(LIFE_SETTINGS(getNumber,"donor_level"),1)) then {
	CONST(life_donorlevel,parseNumber (SEL(_this,5)));
} else {
	CONST(life_donorlevel,0);
};

//Loop through licenses
if(count (SEL(_this,6)) > 0) then {
	{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,6));
};

life_gear = SEL(_this,8);
[true] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONST(life_coplevel, parseNumber(SEL(_this,7)));
		CONST(life_medicLevel,0);
		life_blacklisted = SEL(_this,9);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,10),0);
			life_thirst = SEL(SEL(_this,10),1);
			player setDamage SEL(SEL(_this,10),2);
		};
	};

	case civilian: {
		life_is_arrested = SEL(_this,7);
		CONST(life_coplevel, 0);
		CONST(life_medicLevel, 0);
		life_houses = SEL(_this,13);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
			player setDamage SEL(SEL(_this,9),2);
		};

		//Position
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_civ_position"),1)) then {
			life_is_alive = SEL(_this,10);
			life_civ_position = SEL(_this,11);
			if(life_is_alive) then {
				if(count life_civ_position != 3) then {diag_log format["[requestReceived] Bad position received. Data: %1",life_civ_position];life_is_alive =false;};
				if(life_civ_position distance (getMarkerPos "respawn_civilian") < 300) then {life_is_alive = false;};
			};
		};

		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = SEL(_this,14);
		if(!(EQUAL(count life_gangData,0))) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		CONST(life_medicLevel, parseNumber(SEL(_this,7)));
		CONST(life_coplevel,0);
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_playerStats"),1)) then {
			life_hunger = SEL(SEL(_this,9),0);
			life_thirst = SEL(SEL(_this,9),1);
			player setDamage SEL(SEL(_this,9),2);
		};
	};
};

if(count (SEL(_this,15)) > 0) then {
	{life_vehicles pushBack _x;} foreach (SEL(_this,15));
};

life_session_completed = true;
