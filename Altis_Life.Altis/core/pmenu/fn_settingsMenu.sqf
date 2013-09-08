/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "TAW_VD") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

private["_display","_side","_tags"];
_display = findDisplay 2900;
_side = _display displayCtrl 2926;
_tags = _display displayCtrl 2925;

if(isNil "life_sidechat") then 
{
	life_sidechat = true;
};

if(!life_sidechat) then
{
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "Sidechat ON";
}
	else
{
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "Sidechat OFF";
};