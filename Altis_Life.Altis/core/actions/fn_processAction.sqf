#include "..\..\script_macros.hpp"
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR EQUAL(_type,"") OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do {
	case "oil": {[[["oil_unprocessed",1]],[["oil_processed",1]],1200,(localize "STR_Process_Oil")];};
	case "diamond": {[[["diamond_uncut",1]],[["diamond_cut",1]],1350,(localize "STR_Process_Diamond")];};
	case "heroin": {[[["heroin_unprocessed",1]],[["heroin_processed",1]],1750,(localize "STR_Process_Heroin")];};
	case "copper": {[[["copper_unrefined",1]],[["copper_refined",1]],750,(localize "STR_Process_Copper")];};
	case "iron": {[[["iron_unrefined",1]],[["iron_refined",1]],1120,(localize "STR_Process_Iron")];};
	case "sand": {[[["sand",1]],[["glass",1]],650,(localize "STR_Process_Sand")];};
	case "salt": {[[["salt_unrefined",1]],[["salt_refined",1]],450,(localize "STR_Process_Salt")];};
	case "cocaine": {[[["cocaine_unprocessed",1]],[["cocaine_processed",1]],1500,(localize "STR_Process_Cocaine")];};
	case "marijuana": {[[["cannabis",1]],[["marijuana",1]],500,(localize "STR_Process_Marijuana")];};
	case "cement": {[[["rock",1]],[["cement",1]],350,(localize "STR_Process_Cement")];};
	case "ExempleMultiProcess": {[[["peach",2],["cannabis",3],["cocaine_unprocessed",2]],[["diamond_cut",2],["marijuana",5]],350,(localize "STR_Process_Cement")];};
	default {[];};
};

//Error checking
if(EQUAL(count _itemInfo,0)) exitWith {};

//Setup vars.
_oldItem = SEL(_itemInfo,0);
_newItem = SEL(_itemInfo,1);
_cost = SEL(_itemInfo,2);
_upp = SEL(_itemInfo,3);
_exit = false;

_ArrayItem = [];
_ItemName = [];
{
	_ItemSelected = _x select 0;
	_ItemName pushBack _ItemSelected;
} forEach _oldItem;

_itemNameInv = [];
{
	_item = _x select 0;
	_var = ITEM_VARNAME(_item);
	_itemNameInv pushBack [_var];
} forEach _oldItem;

_ItemNumber = [];
{
	_itemNumberNow = _x select 1;
	_ItemNumber pushback [_itemNumberNow];
} forEach _oldItem;


_IndexNow = -1;
{
	_IndexNow = _IndexNow + 1;
	_ItemNameLife = (_itemNameInv select _IndexNow) select 0;
	_var = ITEM_VALUE2(_ItemNameLife);
	if(EQUAL(_var,0)) exitWith {
		_exit = true;
	};
	_ItemNumberLife = (_ItemNumber select _IndexNow) select 0;
	if (_var < _ItemNumberLife) exitWith {
		_exit = true;
	};
} forEach _itemNameInv;
if (_exit) exitWith {life_is_processing = false;hint localize "STR_NOTF_NotEnoughItemProcess";};

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
	_hasLicense = true;
} else {
	_hasLicense = LICENSE_VALUE(_type,"civ");
};

_oldVal = count _ItemName;

_cost = _cost * _oldVal;
//Some more checks
if(EQUAL(_oldVal,0)) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then {
	while{true} do {
		sleep  0.28;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	_IndexNow = -1;
	_ItemMax = [];
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameLife = (_itemNameInv select _IndexNow) select 0;
		_var = ITEM_VALUE2(_ItemNameLife);
		_ItemNumberLife = (_ItemNumber select _IndexNow) select 0;
		_calcul = (floor ((_var)/(_ItemNumberLife)));
		_ItemMax pushBack _calcul;
	} forEach _itemNameInv;
	_ItemMin = _ItemMax select 0;
	{
		if (_x<_ItemMin) then {_ItemMin=_x};
	} forEach _ItemMax;
	_IndexNow = -1;
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[false,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _oldItem;
	{
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[true,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _newItem;
	5 cutText ["","PLAIN"];
	hint localize "STR_NOTF_ItemProcess";
	life_is_processing = false;
} else {
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do {
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(CASH < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	_IndexNow = -1;
	_ItemMax = [];
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameLife = (_itemNameInv select _IndexNow) select 0;
		_var = ITEM_VALUE2(_ItemNameLife);
		_ItemNumberLife = (_ItemNumber select _IndexNow) select 0;
		_calcul = (floor ((_var)/(_ItemNumberLife)));
		_ItemMax pushBack _calcul;
	} forEach _itemNameInv;
	_ItemMin = _ItemMax select 0;
	{
		if (_x<_ItemMin) then {_ItemMin=_x};
	} forEach _ItemMax;
	_IndexNow = -1;
	{
		_IndexNow = _IndexNow + 1;
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[false,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _oldItem;
	{
		_ItemNameHandle = _x select 0;
		_ItemNumberHandle = _x select 1;
		[true,_ItemNameHandle,((_ItemNumberHandle)*(_ItemMin))] call life_fnc_handleInv;
	} forEach _newItem;
	5 cutText ["","PLAIN"];
	hint localize "STR_NOTF_ItemProcess";
	SUB(CASH,_cost);
	life_is_processing = false;
};
