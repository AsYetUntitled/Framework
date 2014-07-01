/*
	File: fn_robberyState.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Determines the robbery state?
*/
private["_vault","_state","_funds"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_state = [_this,1,-1,[0]] call BIS_fnc_param;
_funds = [_this,2,-1,[0]] call BIS_fnc_param;

if(isNull _vault) exitWith {}; //Bad data passed?

switch(_state) do
{
	case -1: {_vault setVariable["fed_rob_ip",false,true]; _vault setVariable["fed_locked",false,true];};
	case 0:
	{
		[[2,(localize "STR_NOTF_FRRobbery_fail")],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		_vault setVariable["fed_locked",true,true];
		sleep (10 * 60); //Wait 10 minutes
		_vault setVariable["fed_locked",false,true];
		_vault setVariable["fed_rob_ip",false,true];
	};
	
	case 1:
	{
		[[1,format[(localize "STR_NOTF_FRRobbery_Success"),[_funds] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		_vault setVariable["fed_locked",true,true];
		sleep (30 * 60); //Wait 30 minutes
		_vault setVariable["fed_locked",false,true];
		_vault setVariable["fed_rob_ip",false,true];
	
		if(_funds > life_federal_funds) then
		{
			life_federal_funds = 0;
		}
			else
		{
			life_federal_funds = life_federal_funds - _funds;
		};
		
		_funds = round(_funds / (count playableUnits) * 3);
		[[_funds],"life_fnc_fedSuccess",false,false] spawn life_fnc_MP;
	};
};