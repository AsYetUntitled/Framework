[

[
    "STR_vInAct_Repair",
    "",
    [1,1,1,1],
    [west,civilian,independent],
    {
        (life_inv_toolkit >= 1) &&
        {alive cursorTarget} &&
        {([cursorTarget] call life_fnc_isDamaged)} &&
        {(cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Ship") || (cursorTarget isKindOf "Air")} &&
        {!(isNull cursorTarget)}
    },
    "[cursorTarget] spawn life_fnc_repairTruck;"
],

[
    "STR_vInAct_Registration",
    "",
    [1,1,1,1],
    west,
    {
        !isNull cursorTarget &&
        {((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Ship") || (cursorTarget isKindOf "Air"))} &&
        {isNull objectParent player}
    },
    "[cursorTarget] spawn life_fnc_searchVehAction;"
],

[
    "STR_vInAct_SearchVehicle",
    "",
    [1,1,1,1],
    west,
    {
        (_vehicle isKindOf "Car") || {!(_vehicle isKindOf "Air")} || {!(_vehicle isKindOf "Ship")}
    },
    "[cursorTarget] spawn life_fnc_vehInvSearch;"
],

[
    "STR_vInAct_PullOut",
    "",
    [1,1,1,1],
    west,
    {
        (isNull objectParent player) && {!(crew cursorTarget isEqualTo [])}
    },
    "[cursorTarget] spawn life_fnc_pulloutAction;"
],

[
    "STR_vInAct_Impound",
    "",
    [1,1,1,1],
    west,
    {
        (isNull objectParent player) &&
        {((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Ship") || (cursorTarget isKindOf "Air"))} &&
        {(player distance cursorObject < 10)} && {!(_vehicle getVariable "NPC")}
    },
    "[cursorTarget] spawn life_fnc_impoundAction;"
],

[
    "STR_vInAct_PushBoat",
    "",
    [1,1,1,1],
    [west,civilian,independent],
    {
        cursorTarget isKindOf "Ship" && {local cursorTarget} && {crew cursorTarget isEqualTo []}
    },
    "[] spawn life_fnc_pushObject;"
],

[
    "STR_vInAct_GetInVehicle",
    "",
    [1,1,1,1],
    [west,civilian,independent],
    {
        crew cursorTarget isEqualTo [] && {canMove cursorTarget} && {locked cursorTarget isEqualTo 0} &&
        {(!isNil "getObjectDLC cursorTarget")} && {!(getObjectDLC cursorTarget in getDLCs 1)}

    },
    "player moveInDriver cursorTarget;"
],

[
    "STR_vInAct_Unflip",
    "",
    [1,1,1,1],
    [west,civilian,independent],
    {
        alive cursorTarget && {crew cursorTarget isEqualTo []} && {canMove cursorTarget}

    },
    "cursorTarget setPos [getPos cursorTarget select 0, getPos cursorTarget select 1, (getPos cursorTarget select 2) + 0.5];"
],

[
    "STR_vInAct_DeviceMine",
    "",
    [1,1,1,1],
    civilian,
    {
        typeOf cursorTarget == "O_Truck_03_device_F" && {isNil (cursorTarget getVariable "mining")}
        && {local cursorTarget} && {cursorTarget in life_vehicles}

    },
    "[cursorTarget] spawn life_fnc_deviceMine;"
],

[
    "STR_FuelTank_Stop",
    "",
    [1,1,1,1],
    civilian,
    {
        typeOf (cursorTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"]
        && {cursorTarget in life_vehicles} && {!isNil (cursorTarget getVariable "fuelTankWork")}

    },
    "cursorTarget setVariable [""fuelTankWork"",nil,true];"
],

[
    "STR_FuelTank_Supply",
    "",
    [1,1,1,1],
    civilian,
    {
        typeOf (cursorTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"]
        && {cursorTarget in life_vehicles} && {isNil (cursorTarget getVariable "fuelTankWork")} &&
        {count (nearestObjects [cursorTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 15]) > 0}

    },
    "[cursorTarget] spawn life_fnc_fuelSupply"
],

[
    "STR_FuelTank_Store",
    "",
    [1,1,1,1],
    civilian,
    {
        typeOf (cursorTarget) in ["C_Van_01_fuel_F","I_Truck_02_fuel_F","B_Truck_01_fuel_F"]
        && {cursorTarget in life_vehicles} && {isNil (cursorTarget getVariable "fuelTankWork")} &&
        {count (nearestObjects [cursorTarget, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 15]) isEqualTo 0} &&
        {player distance (getMarkerPos fuel_storage_1) < 20 || player distance (getMarkerPos fuel_storage_2) < 20}

    },
    "[cursorTarget] spawn life_fnc_fuelStore"
]

];
