/*
    Author: GetSomePanda / Panda
    SteamID: 76561198145366418
    File Name: fn_messagesMenu.sqf
    Information: Sets up message menu.
*/
private["_messages","_lbSelectedData","_name","_msg","_time"];
disableSerialization;
_messages = player getVariable "cellphone_messages";
_lbSelectedData = lbData[98112,lbCurSel (98112)];
_lbSelectedData = call compile _lbSelectedData;
_name = _lbSelectedData select 0;
_msg = _lbSelectedData select 1;
_time = _lbSelectedData select 2;

_messages = _messages - [[_name,_msg,_time]];

player setVariable ["cellphone_messages", _messages];
closeDialog 0;
[] spawn life_fnc_messagesMenu;
    
hint format["You have removed a message from %1 saying %2", _name, _msg];


