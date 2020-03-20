/*
    File: fn_cookieJar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Reports to the RPT of a confirmed cheater for external programs
    to parse,log or ban automatically.
*/
private ["_pName", "_pUID", "_pReason"];
_pName = [_this, 0, "", [""]] call BIS_fnc_param;
_pUID = [_this, 1, "", [""]] call BIS_fnc_param;
_pReason = [_this, 2, "", [""]] call BIS_fnc_param;

if (_pName isEqualTo "" || _pUID isEqualTo "" || _pReason isEqualTo "") exitWith {}; //Bad params passed..

diag_log format [localize "STR_SpyDetect_cookieJar", _pName, _pUID, _pReason]; //Outputs to RPT for external programs to parse, log, and react to.
