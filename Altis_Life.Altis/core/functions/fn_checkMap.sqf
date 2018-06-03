/*
     File: fn_checkMap.sqf
     Author: DomT602
     Description:
     Checks if the map is being opened or closed, then puts markers according to side.
 */

 params [
     ["_mapOpen",false,[false]]
 ];

 if (_mapOpen) then {
     switch playerSide do {
         case west: {[] spawn life_fnc_copMarkers};
         case independent: {[] spawn life_fnc_medicMarkers};
         case civilian: {[] spawn life_fnc_civMarkers};
     };

     if (life_markers && {!(life_markers_active)}) then {
        [true] spawn life_fnc_adminMarkers;
     };

 } else {
    life_markers_active = false;
 };
