/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
addMissionEventHandler["Map",
    { 
    if (_this select 0) then 
        {
            switch (playerSide) do 
            {
                case west: {[_this select 0] spawn life_fnc_copMarkers;};
                case civilian: {[_this select 0] spawn life_fnc_civMarkers;};
                case independent: {[_this select 0] spawn life_fnc_medicMarkers;};
            };
            if (life_admin_playerMarkers || life_admin_vehicleMarkers) then 
            {
                [_this select 0] spawn life_fnc_adminMarkersActive;
            };
        } else {
            {deleteMarkerLocal format["%1_marker",_x]} forEach allPlayers;
            //{deleteMarkerLocal format["%1_marker",_x]} forEach allPlayers - entities "HeadlessClient_F";
            if (count vehicles > 0) then 
            {
                {
                    deleteMarkerLocal format["%1_marker",_x];
                }forEach vehicles;
            };
            {deleteMarkerLocal format["%1_marker",_x]} foreach allDeadMen;
        };
    }
];
