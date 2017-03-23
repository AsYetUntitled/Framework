/*
    File:	fn_bool.sqf
    Date:   2017-03-22 17:46:27
    Author: Patrick "Lucian" Schmidt
    
    Description:
    Converts Bool to Number and Number to bool
*/

params[
    ["_in", "", [0,true]]
];

if (_in isEqualType true) exitWith {
    [0,1] select _in;
};

if (_in isEqualType 0) exitWith {
    [false,true] select _in;
};
