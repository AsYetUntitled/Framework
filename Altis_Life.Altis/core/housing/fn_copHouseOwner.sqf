/*
    File: fn_copHouseOwner.sqf
    Author:

    Description:
    Displays the house owner
*/
params [
    ["_house",objNull,[objNull]];
];
if (isNull _house || !(_house isKindOf "House_F")) exitWith {};
if (isNil {(_house getVariable "house_owner")}) exitWith {hint localize "STR_House_Raid_NoOwner"};
hint parseText format ["<t color='#FF0000'><t size='2'>" +(localize "STR_House_Raid_Owner")+ "</t></t><br/>%1",(_house getVariable "house_owner") select 1];