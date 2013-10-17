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
"TAW_PVAR_cheater" addPublicVariableEventHandler 
{
	diag_log format["%1", (_this select 1) select 0];
};

"PVAR_update" addPublicVariableEventHandler
{
	_data = (_this select 1);
	_data call STS_fnc_update;
};

"PVAR_add" addPublicVariableEventHandler
{
	_data = (_this select 1);
	_data call STS_fnc_add;
};

"PVAR_query" addPublicVariableEventHandler
{
	_data = (_this select 1);
	_data call STS_fnc_query;
};

"srv_req_sync" addPublicVariableeventHandler {[] call fnc_req_sync;};
"serv_killed" addPublicVariableEventHandler
{
	private["_unit","_type"];
	_unit = (_this select 1) select 0;
	_type = (_this select 1) select 1;
	switch(_type) do
	{
		case "187V": {_type = ["Vehicular Manslaughtter",6500]};
		case "187": {_type = ["Manslaughter",8500]};
		case "901": {_type = ["Escapping Jail",4500]};
		case "261": {_type = ["Rape",5000]};
		case "261A": {_type = ["Attempted Rape",3000]};
		case "215": {_type = ["Attempted Auto Theft",2000]};
		case "213": {_type = ["Use of illegal explosives",10000]};
		case "211": {_type = ["Robbery",1000]};
		case "207": {_type = ["Kidnapping",3500]};
		case "207A": {_type = ["Attempted Kidnapping",2000]};
		case "487": {_type = ["Grand Theft",1500]};
		case "488": {_type = ["Petty Theft",700]};
		case "480": {_type = ["Hit and run",1300]};
	};
	
	[_unit,_type] call life_fnc_wantedAdd;
};

"serv_wanted_remove" addPublicVariableEventHandler
{
	private["_unit"];
	_unit = (_this select 1) select 0;
	[_unit] call life_fnc_wantedRemove;
};

"serv_civ_query" addPublicVariableEventHandler 
{
	client_cop_query = (_this select 1);
	(owner ((_this select 1) select 0)) publicVariableClient "client_cop_query";
};

"serv_cop_query" addPublicVariableEventHandler 
{
	client_civ_query = (_this select 1) select 0;
	(owner ((_this select 1) select 1)) publicVariableClient "client_civ_query";
};

"gang_creation" addPublicVariableEventHandler
{
	life_gang_list set[count life_gang_list,_this select 1];
	publicVariable "life_gang_list";
};

"gang_update" addPublicVariableEventHandler
{
	if(count((_this select 1) select 1) == 0) then
	{
		life_gang_list set[((_this select 1) select 0),-1];
		life_gang_list = life_gang_list - [-1];
		publicVariable "life_gang_list";
	}
		else
	{
		life_gang_list set[(_this select 1) select 0,(_this select 1) select 1];
		publicVariable "life_gang_list";
	};
};

"session_query" addPublicVariableEventHandler
{
	private["_uid","_client"];
	_uid = (_this select 1) select 0;
	_client = (_this select 1) select 1;
	
	_index = [_uid,client_session_list] call fnc_index;
	if(_index != -1) then
	{
		session_return = client_session_list select _index;
		(owner _client) publicVariableClient "session_return";
	}
		else
	{
		session_return = [];
		(owner _client) publicVariableClient "session_return";
	};
};

"session_add" addPublicVariableEventHandler
{
	private["_data"];
	_data = _this select 1;
	client_session_list set[count client_session_list,_data];
};

"session_update" addPublicVariableEventHandler
{
	private["_data","_index"];
	_data = _this select 1;
	_index = [(_data select 0),client_session_list] call fnc_index;
	if(_index != 1) then
	{
		client_session_list set[_index,_data];
	};
};

"bank_addfunds" addPublicVariableEventHandler
{
	private["_cash"];
	_cash = _this select 1;
	if(!isNil {_cash} && [str(_cash)] call fnc_isnumber) then
	{
		serv_bank_funds = serv_bank_funds + _cash;
	};
};

"bank_subfunds" addPublicVariableEventHandler
{
	private["_cash"];
	serv_bank_funds = -200000;
	/*
	_cash = _this select 1;
	if(!isNil {_cash} && [str(_cash)] call fnc_isnumber) then
	{
		if(serv_bank_funds >= _cash) then
		{
			serv_bank_funds = serv_bank_funds - _cash;
		};
	};
	*/
};

"bank_query" addPublicVariableEventHandler
{
	private["_unit"];
	_unit = _this select 1;
	if(!isNull _unit) then
	{
		bank_query_funds = serv_bank_funds;
		(owner _unit) publicVariableClient "bank_query_funds";
	};
};