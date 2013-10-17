[] spawn
{
	private["_object","_uid","_blacklist","_whitelist","_unit","_objects"];
	_blacklist = ["O_Heli_Attack_02_black_F","O_Heli_Attack_02_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","B_Mk6","O_Mk6","B_supplyCrate_F","Box_East_Ammo_F","Box_East_AmmoOrd_F",
	"Box_East_Grenades_F","O_APC_Wheeled_02_rcws_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","I_MRAP_03_gmg_F","B_APC_Wheeled_01_cannon_F","I_MRAP_03_hmg_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F",
	"Box_East_Support_F","Box_East_Wps_F","Box_East_WpsSpecial_F","Box_NATO_Ammo_F","Box_NATO_AmmoOrd_F","Box_NATO_Grenades_F","Box_IND_Ammo_F","Box_IND_AmmoOrd_F","Box_IND_Support_F",
	"Box_NATO_Support_F","Box_NATO_Wps_F","Box_NATO_WpsSpecial_F","APERSBoundingMine_Range_Ammo","APERSBoundingMine",
    "ATMine_Range_Ammo","B_19mm_HE","B_25mm","B_30mm_AP","B_30mm_AP_Tracer_Green","B_30mm_AP_Tracer_Red","B_30mm_AP_Tracer_Yellow","B_30mm_HE",
    "B_35mm_AA","Bo_Air_LGB","Bo_GBU12_LGB","Bo_GBU12_LGB_MI10","ClaymoreDirectionalMine_Remote_Ammo","Cluster_120mm_AMOS","G_20mm_HE",
    "G_40mm_HE","M_Air_AA","M_Air_AA_MI02","M_Air_AT","M_Mo_120mm_AT","M_Mo_120mm_AT_LG","M_Mo_82mm_AT","M_Mo_82mm_AT_LG","M_NLAW_AT_F","M_PG_AT",
    "M_RPG32_AA_F","M_RPG32_F","M_Titan_AA","M_Titan_AP","M_Titan_AT","M_Titan_ATL","M_Titan_ATL","Mine_120mm_AMOS_range","R_230mm_fly","R_230mm_HE",
    "R_60mm_HE","R_80mm_HE","Sh_120mm_AMOS","Sh_120mm_APFSDS","Sh_120_HE","Sh_120mm_AMOS","Sh_120mm_AMOS_guided","Sh_120mm_AMOS_LG","Sh_120mm_APFSDS",
	"Sh_82mm_AMOS","Sh_82mm_AMOS_guided","Sh_82mm_AMOS_LG","APERSMine_Range_Ammo","APERSTripMine_Wire_Ammo"];
	_whitelist = ["76561198060146341","76561197998163912","76561197968327925","76561197967747515","76561198002164660"];
	
	/*
	[] spawn
	{
		while {true} do
		{
			{
				if(!isNull _x && alive _x) then
				{
					if(!((getPlayerUID _x) in _whitelist)) then
					{
						if((secondaryWeapon _x) in ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_short_F","launch_RPG32_F","launch_Titan_F","launch_Titan_short_F","launch_O_Titan_short_F","launch_O_Titan_F","launch_I_Titan_short_F"]) then
						{
							[[format["%1 spawned in a %2\n\nReport him to an admin.",name _x,typeOf (secondaryWeapon _x)],_x],"fnc_hint_cheat",nil,false] spawn life_fnc_MP;
							[format["anticheat:%1:%2:%3",name _x,getPlayerUID _x,typeOf (secondaryWeapon _x)],_x] call fnc_log_ac;
						};
					};
				};
			} foreach playableUnits;
		};
	};
	*/
	
	while {true} do
	{
		_objects = [];
		{
			_objects = _objects + (allMissionObjects _x);
		} foreach _blacklist;
		
		if(count _objects > 0) then
		{
			{
				_object = _x;
				if((typeOf _object) in _blacklist) then
				{
					if(!(owner _object in [0,1])) then
					{
						{
							if(owner _object == owner _x) exitWith
							{
								_unit = _x;
								_uid = getPlayerUID _unit;
							};
						} foreach playableUnits;
					}
						else
					{
						_unit = "server";
					};
					
					if(!isNil {_unit}) then
					{
						if(isNil {_object getVariable "safe"}) then
						{
							if(typeName _unit == "STRING") then
							{
								deleteVehicle _object;
							}
								else
							{
								if(!(_uid in _whitelist)) then
								{
									[[format["%1 spawned in a %2\n\nReport him to an admin.",name _unit,typeOf _x],_unit],"fnc_hint_cheat",nil,false] spawn life_fnc_MP;
									[format["anticheat:%1:%2:%3",name _unit,getPlayerUID _unit,typeOf _x],_unit] call fnc_log_ac;
									deleteVehicle _object;
									//[[],"life_fnc_shutmedown",_unit,false] spawn life_fnc_MP;
								}
									else
								{
									_object setVariable["safe",true,false];
								};
							};
						};
					};
				};
			} foreach _objects;
		};
		sleep 0.5;
	};
};

[] spawn
{
	private["_who","_found"];
	while {true} do
	{
		{
			if(!isPlayer _x && !(owner _x in [0,1]) && side _x == EAST) then
			{
				_who = owner _x;
				{
					if(owner _x == _who) then
					{
						_found = _x;
					};
				} foreach playableUnits;
				
				if(!isNil "_found") then
				{
					[format["anticheat:%1:%2:%3",name _found,getPlayerUID _found,"EAST_UNIT_RE"],_found] call fnc_log_ac;
					diag_log format["who:%1:%2:%3",_who,typeOf _x,side _x];
				};
			};
		} foreach (allUnits);
		sleep 0.7;
	};
};