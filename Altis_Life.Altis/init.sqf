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
		master_group attachTo[bank_obj,[0,0,0]];
	};
	X_Server = true;
};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then 
{
	if(!X_JIP && !isServer) then
	{
		[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
	};
	X_JIP = true;
};
enableSaving[false,false];

life_versionInfo = "Altis Life v3.0.7";
if(X_Client) then
{
	[] execVM "core\init.sqf";
};
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

if(!StartProgress) then
{
	[8,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;