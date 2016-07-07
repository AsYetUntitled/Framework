/*
    Author: GetSomePanda / Panda
    SteamID: 76561198145366418
    File Name: fn_saveCellPhone.sqf
    Information: Saves messages on cellphone to cellphone db.
    
    HC SIDE
*/
private["_pid","_msgs"];
_pid = _this select 0;
_msgs = _this select 1;

_msgs = [_msgs] call HC_fnc_mresArray;

_query = format["UPDATE cellphone SET messages='%1' WHERE pid='%2'",_msgs,_pid];
[_query,1] call HC_fnc_asyncCall;
