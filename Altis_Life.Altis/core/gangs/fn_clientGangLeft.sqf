/*
    File: fn_clientGangLeft.sqf
    Author: Bryan "Tonic" Boardwine

    Description: leaves the group
*/

life_my_gang = grpNull;
[player] joinSilent (createGroup civilian);
hint localize "STR_GNOTF_LeaveGang";
