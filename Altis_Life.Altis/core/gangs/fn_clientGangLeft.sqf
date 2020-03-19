/*
    File: fn_clientGangLeft.sqf
    Author: Bryan "Tonic" Boardwine

    Description: leaves the group
*/

life_my_gang = objNull;
[player] joinSilent (createGroup civilian);
hint localize "STR_GNOTF_LeaveGang";
