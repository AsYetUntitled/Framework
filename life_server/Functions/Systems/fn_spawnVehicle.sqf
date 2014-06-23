/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[]]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_name = name _unit;
_side = side _unit;
_unit = owner _unit;

if(_vid == -1 OR _pid == "" OR count _sp == 0) exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use set[count serv_sv_use,_vid];

_query = format["SELECT * FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];
private["_handler","_queryResult","_thread"];
_handler = {
	private["_thread"];
	_thread = [_this select 0,true,_this select 1,true] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};

waitUntil{!DB_Async_Active};

while {true} do {
	_thread = [_query,_pid] spawn _handler;
	waitUntil {scriptDone _thread};
	sleep 0.2;
	_queryResult = missionNamespace getVariable format["QUERY_%1",_pid];
	if(!isNil "_queryResult") exitWith {};
};

missionNamespace setVariable[format["QUERY_%1",_pid],nil]; //Unset the variable.

if(typeName _queryResult == "STRING") exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == "False") exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 6) == "True") exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
if(count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,{life_atmcash = life_atmcash + _this;}],"BIS_fnc_spawn",_unit,false] spawn life_fnc_MP;
	[[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

waitUntil {!DB_Async_Active};
_thread = [_query,false] spawn DB_fnc_asyncCall;
waitUntil {scriptDone _thread};

_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
//Send keys over the network.
[[_vehicle],"life_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
[[_vehicle,2], "life_fnc_lockVehicle",_vehicle,false] spawn life_fnc_MP;
_vehicle setOwner _unit; //Transfer ownership
//Reskin the vehicle 
[[_vehicle,parseNumber(_vInfo select 8)],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),(call compile format["%1", _vInfo select 7])]];
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle] call life_fnc_clearVehicleAmmo;

//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && (parseNumber(_vInfo select 8)) != 13) then
{
	[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then
{
	[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};
[[1,"Your vehicle is ready!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
serv_sv_use = serv_sv_use - [_vid];