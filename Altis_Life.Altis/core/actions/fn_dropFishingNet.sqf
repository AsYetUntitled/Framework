/*
    File: fn_dropFishingNet.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Drops a virtual fishing net from the boat.
*/
private _vehicle = vehicle player;
if !(_vehicle isKindOf "Ship") exitWith {};
private _fish = nearestObjects[getPosASL _vehicle,["Fish_Base_F"],20];
life_net_dropped = true;
titleText[localize "STR_NOTF_NetDrop","PLAIN"];
sleep 5;
if (_fish isEqualTo []) exitWith {
    titleText[localize "STR_NOTF_NetDropFail","PLAIN"];
    life_net_dropped = false;
};

{
    if (_x isKindOf "Fish_Base_F") then {
        private _fishInfo = switch (typeOf _x) do {
            case "Salema_F": {["STR_ANIM_Salema", "salema_raw"]};
            case "Ornate_random_F": {["STR_ANIM_Ornate", "ornate_raw"]};
            case "Mackerel_F": {["STR_ANIM_Mackerel", "mackerel_raw"]};
            case "Tuna_F": {["STR_ANIM_Tuna", "tuna_raw"]};
            case "Mullet_F": {["STR_ANIM_Mullet", "mullet_raw"]};
            case "CatShark_F": {["STR_ANIM_Catshark", "catshark_raw"]};
            default {["", ""]};
        };

        _fishInfo params ["_fishName", "_fishType"];
        _fishName = localize _fishName;

        sleep 3;

        if ([true, _fishType, 1] call life_fnc_handleInv) then {
            deleteVehicle _x;
            titleText[format [(localize "STR_NOTF_Fishing"),_fishName],"PLAIN"];
        };
    };
    true
} count _fish;

sleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;
