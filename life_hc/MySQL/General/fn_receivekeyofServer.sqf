#include "\life_hc\hc_macros.hpp"
/*
    File: fn_receivekeyofServer.sqf
    Author: NiiRoZz

    This file is for Nanou's HeadlessClient.

    Description:
    Recup the key of player when reconnect
*/
private ["_keyArr","_uid","_side"];
_keyArr = _this select 0;
life_keyreceivedvar = _keyArr;
life_keyreceived = true;
