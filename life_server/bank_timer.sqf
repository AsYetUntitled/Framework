/* 
	@file Version: 1a
	@file name: bank_timer.sqf
	@file Author: Alan
	@file edit: 6/17/2013
	Copyright © 2013 STS Alan, All rights reserved
	Only Seal Team Sloth servers are allowed to use this code.
*/

private["_outcome","_robber"];
_outcome = _this select 0;
_robber = _this select 1;

switch (_outcome) do
{
	case "success" :
	{
		bank_robber = [];
		publicVariable "bank_robber";
		robbery_success = 1;
		publicVariable "robbery_success";
		sleep (20 * 60);
		bank_obj setVariable["rob_in_sess",false,true];
		if(!(bank_obj getVariable "rob_in_sess")) then
		{
			//rob = bank_obj addAction["Rob Safe","core\client\act\civ\rob_bank.sqf","",0,false,false,"",' (currentWeapon player) != "" && playerSide == civilian  && player distance bank_obj < 3'];
			robbery_success = 0;
			publicVariable "robbery_success";
		};
	};
	case "failed" :
	{
		bank_robber = [];
		publicVariable "bank_robber";
		robbery_success = 2;
		publicVariable "robbery_success";
		sleep (2 * 60);
		bank_obj setVariable["rob_in_sess",false,true];
		if(!(bank_obj getVariable "rob_in_sess")) then
		{
			//rob = bank_obj addAction["Rob Safe","core\client\act\civ\rob_bank.sqf","",0,false,false,"",' (currentWeapon player) != "" && playerSide == civilian  && player distance bank_obj < 3'];
			robbery_success = 0;
			publicVariable "robbery_success";
		};
	};
	case "inprog" :
	{
		private["_counter"];
		_counter = 0;
		robbery_success = 0;
		publicVariable "robbery_success";
		while {robbery_success == 0} do
		{
			_counter = _counter + 1;
			sleep 1;
			if(_counter > 191 && robbery_success == 0) then
			{
				hint "The bank robbery has failed!";
				["failed"] spawn bank_timer;
			};
		};
	};
};