[

[
    "STR_vInAct_Repair",
    "",
    [1,1,1,1],
    [west,civilian,independent],
    {
        (life_inv_toolkit >= 1) &&
        {alive cursorTarget} &&
        {([cursorTarget] call life_fnc_isDamaged)}
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
        (isNull objectParent player)
    },
    "[cursorTarget] spawn life_fnc_pulloutAction;"
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
    "STR_vInAct_PushBoat",
    "",
    [1,1,1,1],
    west,
    {
        getObjectDLC _curTarget;
    },
    "[] spawn life_fnc_pushObject;"
],

];
