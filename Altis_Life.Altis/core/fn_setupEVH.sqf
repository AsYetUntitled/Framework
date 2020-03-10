/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler ["Killed", {_this call life_fnc_onPlayerKilled}];
player addEventHandler ["HandleDamage", {_this call life_fnc_handleDamage}];
player addEventHandler ["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler ["Take", {_this call life_fnc_onTakeItem}];
player addEventHandler ["Fired", {_this call life_fnc_onFired}];
player addEventHandler ["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler ["HandleRating", {0}];

player addEventHandler ["GetInMan", {_this call life_fnc_getInMan}];
player addEventHandler ["GetOutMan", {_this call life_fnc_getOutMan}];

addMissionEventHandler ["Map", {_this call life_fnc_checkMap}];

[missionNamespace,"OnGameInterrupt",{_this call life_fnc_onGameInterrupt}] call BIS_fnc_addScriptedEventHandler;
