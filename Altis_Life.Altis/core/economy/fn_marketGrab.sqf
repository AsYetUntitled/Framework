#include "..\..\script_macros.hpp"

/*
	File: fn_marketGrab.sqf
	Author: Derek
	
	Description:
	Gets the data for the market item you are looking at
*/
private["_display","_tab","_good","_currgood","_currprice","_recprice","_recchange","_startprice","_startchange","_cp","_rp","_sp","_name"];
disableSerialization;
_display = findDisplay 39000;
_currgood = 39002;
_currprice = 39003;
_recprice = 39004;
_recchange = 39005;
_startprice = 39006;
_startchange = 39007;
_value = lbValue[39001,(lbCurSel 39001)];
if (_value in [1.5,2.9,3.5]) exitWith {};
_good = lbData[39001,(lbCurSel 39001)];

{
	if (EQUAL(SEL(_x,0),_good)) exitWith {_good = _x;};
}forEach life_market;

_name = ITEM_NAME(SEL(_good,0));

ctrlSetText[_currgood, format["Current Good: %1",(localize _name)]];
ctrlSetText[_currprice, format["Current Price: $%1", SEL(_good,2)]];
ctrlSetText[_recprice, format["Recent Price: $%1", SEL(_good,8)]];
ctrlSetText[_recchange, format["Recent Change: $%1", (SEL(_good,2) - SEL(_good,8))]];
ctrlSetText[_startprice, format["Price at Server Start: $%1", SEL(_good,9)]];
ctrlSetText[_startchange, format["Price Change Since Server Start: $%1", (SEL(_good,2) - SEL(_good,9))]];
