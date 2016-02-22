#include "..\..\script_macros.hpp"
/*
	File: fn_raidHouse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/
private["_house","_uid","_cpRate","_cP","_title","_titleText","_ui","_houseInv","_houseInvData","_houseInvVal"];
_house = param [0,ObjNull,[ObjNull]];

if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {(_house GVAR "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_uid = SEL((_house GVAR "house_owner"),0);

if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};

_houseInv = _house GVAR ["Trunk",[[],0]];
if(_houseInv isEqualTo [[],0]) exitWith {hint localize "STR_House_Raid_Nothing"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Searching";
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _house > 13) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {life_action_inUse = false; titleText[localize "STR_House_Raid_TooFar","PLAIN"]};
if(!alive player) exitWith {life_action_inUse = false;};
life_action_inUse = false;

_houseInvData = SEL(_houseInv,0);
_houseInvVal = SEL(_houseInv,1);
_value = 0;
{
	_var = SEL(_x,0);
	_val = SEL(_x,1);
	
	if(EQUAL(ITEM_ILLEGAL(_var),1)) then {
		if(!(EQUAL(ITEM_SELLPRICE(_var),-1))) then {
			_houseInvData set[_forEachIndex,-1];
			SUB(_houseInvData,[-1]);
			SUB(_houseInvVal,(([_var] call life_fnc_itemWeight) * _val));
			ADD(_value,(_val * ITEM_SELLPRICE(_var)));
		};
	};
} foreach (SEL(_houseInv,0));

if(_value > 0) then {
	[0,"STR_House_Raid_Successful",true,[[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	ADD(BANK,round(_value / 2));
	
	_house SVAR ["Trunk",[_houseInvData,_houseInvVal],true];
	
	if(life_HC_isActive) then {
		[_house] remoteExecCall ["HC_fnc_updateHouseTrunk",HC_Life];
	} else {
		[_house] remoteExecCall ["TON_fnc_updateHouseTrunk",RSERV];
	};
	
} else {
	hint localize "STR_House_Raid_NoIllegal";
};