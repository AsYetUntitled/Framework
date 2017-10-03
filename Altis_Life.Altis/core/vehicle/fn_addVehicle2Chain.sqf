/*
    File: fn_addVehicle2Chain.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    A short function for telling the player to add a vehicle to his keychain.
*/
params [
    ["_vehicle",objNull,[objNull]]
];
if (!(_vehicle in life_vehicles)) then {
    life_vehicles pushBack _vehicle;
};