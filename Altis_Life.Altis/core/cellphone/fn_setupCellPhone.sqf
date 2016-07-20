/*
    Author: GetSomePanda / Panda
    SteamID: 76561198145366418
    File Name: fn_setupCellPhone.sqf
    Information: Sets up players cellphone.
*/
private["_informationFound","_messages"];
_informationFound = _this select 0;

if (count _informationFound < 1) exitWith 
{
    player setVariable ["cellphone_messages",[]];
};

_messages = _informationFound select 2;
_messages = call compile format["%1",_messages];
player setVariable ["cellphone_messages",_messages];


