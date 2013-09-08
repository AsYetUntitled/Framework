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