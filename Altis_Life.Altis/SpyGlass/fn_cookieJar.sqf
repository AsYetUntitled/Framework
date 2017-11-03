/*
    File: fn_cookieJar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Reports to the RPT of a confirmed cheater for external programs
    to parse,log or ban automatically.
*/
params [
    ["_pName","",[""]],
    ["_pUID","",[""]],
    ["_pReason","",[""]]
];

if (_pName isEqualTo "" || {_pUID isEqualTo ""} || {_pReason isEqualTo ""}) exitWith {}; //Bad params passed..

diag_log format ["SPYGLASS-FLAG: %1 : %2 : %3",_pName,_pUID,_pReason]; //Outputs to RPT for external programs to parse,log,react to.
