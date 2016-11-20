/*
    File: fn_playerInteractionConfig.sqf
    Author: BoGuu
    
    Description: Fill this in if you love me!
*/

[

[
    "STR_pInAct_Unrestrain",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {(player distance cursorTarget < 5)}
    },
    "[cursorTarget] call life_fnc_unrestrain"
],

[
    "STR_pInAct_checkLicenses",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {(player distance cursorTarget < 5)}
    },
    "[player] remoteExecCall [""life_fnc_licenseCheck"",cursorTarget]"
],

[
    "STR_pInAct_SearchPlayer",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {(player distance cursorTarget < 5)}
    },
    "[cursorTarget] spawn life_fnc_searchAction"
],

[
    "STR_pInAct_StopEscort",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {player getVariable ["isEscorting",false]} && {(player distance cursorTarget < 5)}
    },
    "[] call life_fnc_stopEscorting"
],

[
    "STR_pInAct_Escort",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {!(player getVariable ["isEscorting",false])} && {(player distance cursorTarget < 5)}
    },
    "[cursorTarget] call life_fnc_escortAction"
],

[
    "STR_pInAct_TicketBtn",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {(player distance cursorTarget < 5)}
    },
    "[cursorTarget] call life_fnc_ticketAction"
],

[
    "STR_pInAct_Arrest",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {(player distance cursorTarget < 5)} &&
        {
            if ((player distance (getMarkerPos _x) <30)) exitWith {true};
            false
        } count LIFE_SETTINGS(getArray,"sendtoJail_locations");
    },
    "[cursorTarget] call life_fnc_arrestAction"
],

[
    "STR_pInAct_PutInCar",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {(player distance cursorTarget < 5)}
    },
    "[cursorTarget] call life_fnc_putInCar"
],

[
    "STR_pInAct_Seize",
    "",
    [1,1,1,1],
    west,
    {
        !(isNull cursorTarget) && {(!isPlayer cursorTarget)} && {cursorTarget getVariable ["restrained",false]}
        && {call (life_coplevel) < getNumber(missionConfigFile >> "Life_Settings" >> "seize_minimum_rank")}
        && {(player distance cursorTarget < 5)}
    },
    "[cursorTarget] spawn life_fnc_seizePlayerAction"
],



]
