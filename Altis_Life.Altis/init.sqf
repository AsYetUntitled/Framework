enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(isServer) then 
{
	if(!X_Server) then
	{
		[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
		life_weapon_shop_array =
		[
			["arifle_sdar_F",7500],
			["hgun_P07_snds_F",650],
			["hgun_P07_F",1500],
			["Binocular",50],
			["ItemGPS",45],
			["ToolKit",75],
			["FirstAidKit",65],
			["Medikit",450],
			["NVGoggles",980],
			["16Rnd_9x21_Mag",15],
			["20Rnd_556x45_UW_mag",35]
		];
		
		_building = nearestObjects[getMarkerPos "Meth",["Building"],5] select 0;
		_building setVariable["bis_disabled_Door_1",1,true];
		_building setVariable["bis_disabled_Door_2",1,true];
		_building setVariable["bis_disabled_Door_5",1,true];
		_building setVariable["bis_disabled_Door_6",1,true];
	};
	X_Server = true;
};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};
enableSaving[false,false];

[] execVM "bis\compile.sqf";
life_versionInfo = "Stratis Life: v2.2.5";
[] execVM "core\init.sqf";
//[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";