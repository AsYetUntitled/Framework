#include "..\..\script_macros.hpp"
/*
    File: fn_respawned.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sets the player up if he/she used the respawn option.
*/
private ["_handle"];
//Reset our weight and other stuff

life_action_inUse = false;
life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0; //Make sure we don't get our cash back.
life_respawned = false;
player playMove "AmovPercMstpSnonWnonDnon";

life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["name",nil,true];
life_corpse setVariable ["Reviving",nil,true];
player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];

[] call life_fnc_startLoadout;

//Cleanup of weapon containers near the body & hide it.
if (!isNull life_corpse) then {
    private "_containers";
    life_corpse setVariable ["Revive",true,true];
    _containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
    {deleteVehicle _x;} forEach _containers; //Delete the containers.
    deleteVehicle life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if (life_is_arrested) exitWith {
    hint localize "STR_Jail_Suicide";
    life_is_arrested = false;
    [player,true] spawn life_fnc_jail;
    [] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if (!isNil "life_copRecieve") then {

    if (life_HC_isActive) then {
        [getPlayerUID player,player,life_copRecieve,true] remoteExecCall ["HC_fnc_wantedBounty",HC_Life];
    } else {
        [getPlayerUID player,player,life_copRecieve,true] remoteExecCall ["life_fnc_wantedBounty",RSERV];
    };

    life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if (life_removeWanted) then {

    if (life_HC_isActive) then {
        [getPlayerUID player] remoteExecCall ["HC_fnc_wantedRemove",HC_Life];
    } else {
        [getPlayerUID player] remoteExecCall ["life_fnc_wantedRemove",RSERV];
    };

};

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.
