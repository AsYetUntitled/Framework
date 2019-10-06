/*
    File: fn_federalUpdate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Uhhh, adds to it?
*/
for "_i" from 0 to 1 step 0 do {
    uiSleep (30 * 60);
    fed_bank setVariable ["safe",round(fed_bank getVariable ["safe",0] + ((count playableUnits) / 2)),true];
};
