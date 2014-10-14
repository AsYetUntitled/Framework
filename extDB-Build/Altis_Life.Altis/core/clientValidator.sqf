/*
	Description:
	Loops through a list of variables and checks whether
	or not they are defined, if they are defined then trigger
	spyglass and kick the client to the lobby.
*/
private["_vars"];
_vars = [
	"life_revive_fee","life_gangPrice","life_gangUpgradeBase","life_enableFatigue","life_paycheck_period","life_vShop_rentalOnly","sell_array","buy_array",
	"life_weapon_shop_array","life_garage_prices","life_garage_sell","life_houseLimit","life_gangUpgradeMultipler","life_impound_car","life_impound_boat",
	"life_impound_air"
];

{
	if(!isNil {(missionNamespace getVariable _x)}) exitWith {
		[[profileName,getPlayerUID player,format["VariableSetBeforeInitialized_%1",_x]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
		[[profileName,format["Variable set before client initialized: %1",_x]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
		sleep 0.5;
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
} foreach _vars;