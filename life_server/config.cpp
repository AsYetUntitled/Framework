class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class STS_DB
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\DB";
			class insert{};
			class query{};
			class update{};
			class numberSafe {};
			class formatArray {};
			class mresArray {};
			class mresToArray {};
			class addQueue {};
			class processQueue {};
			class queueManagement {};
			class bool{};
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\wantedsys";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
		};
		
		class Jail_Sys
		{
			file = "\life_server\jail";
			class jailSys {};
		};
	};
	
	class STS_System
	{
		tag = "STS";
		class System
		{
			file = "\life_server\system";
			class query {};
			class add {};
			class update {};
			class managesc {};
			class cleanup {};
			class timeStamp {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class Offroad_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class C_Offroad_01_F: Offroad_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Offroad_01_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		accuracy = 1.25;
		class Turrets{};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\offroad\color.sqf""";
		};
	};
};