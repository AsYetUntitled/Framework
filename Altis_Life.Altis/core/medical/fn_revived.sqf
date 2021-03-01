#include "..\..\script_macros.hpp"
/*
    File: fn_revived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    THANK YOU JESUS I WAS SAVED!
*/
private ["_medic","_dir","_reviveCost"];
_medic = param [0,"Unknown Medic",[""]];
_reviveCost = LIFE_SETTINGS(getNumber,"revive_fee");

player setUnitLoadout life_save_gear;

hint format [localize "STR_Medic_RevivePay",_medic,[_reviveCost] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if (BANK > _reviveCost) then {
    BANK = BANK - _reviveCost;
} else {
    BANK = 0;
};

//Bring me back to life.
player setDir (getDir life_corpse);
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable ["realname",nil,true]; //Should correct the double name sinking into the ground.
life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["name",nil,true];
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];
deleteVehicle life_corpse;

life_action_inUse = false;
life_is_alive = true;

player setVariable ["Revive",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
[] call life_fnc_playerSkins;
[] call life_fnc_hudUpdate; //Request update of hud.
[] call SOCK_fnc_updateRequest;
