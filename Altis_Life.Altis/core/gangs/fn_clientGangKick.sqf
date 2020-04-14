/*
    File: fn_clientGangKick.sqf
    Author: Bryan "Tonic" Boardwine

    Description: handles being kicked out of a gang
*/

life_my_gang = grpNull;
[player] joinSilent (createGroup civilian);
hint localize "STR_GNOTF_KickOutGang";
