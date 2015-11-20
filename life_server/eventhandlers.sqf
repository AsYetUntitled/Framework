/*
	@file Version: 1a
	@file name: eventhandlers.sqf
	@file Author: TAW_Tonic
	@file edit: 4/14/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/

if(!isServer) exitWith {};
"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};