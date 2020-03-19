/*
    File: fn_clientGangLeader.sqf
    Author: Bryan "Tonic" Boardwine

    Description: appoints player as gang leader
*/

player setRank "COLONEL";
(group player) selectLeader player;
hint localize "STR_GNOTF_GaveTransfer";
