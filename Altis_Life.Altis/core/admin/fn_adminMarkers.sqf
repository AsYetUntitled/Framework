#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: NiiRoZz
    Description:
    Display markers for all players
*/
if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

if (visibleMap) then {openMap false;};
if (life_admin_markers) then {
    life_admin_markers = false;
    hint localize "STR_ANOTF_MDisabled";
   [0,format["Admin %1 has turned off player markers",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];
  } else {
    life_admin_markers = true;
    hint localize "STR_ANOTF_MEnabled";
    [0,format["Admin %1 has turned on player markers",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];
  };
