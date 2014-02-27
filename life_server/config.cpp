class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\core\MySQL";
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
			class insertVehicle {};
			class queryVehicle {};
			class queryVehicles {};
			class bool{};
			class mresString {};
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\core\wantedsys";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\life_server\core\jail";
			class jailSys {};
		};
		
		class Client_Code
		{
			file = "\life_server\core\clientside";
			class safeOpen {};
			class safeInventory {};
			class safeTake {};
			class safeStore {};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class System
		{
			file = "\life_server\core\system";
			class query {};
			class add {};
			class update {};
			class managesc {};
			class cleanup {};
			class timeStamp {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class addVehicle2Chain {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class robReserve {};
			class robberyState {};
			class logIt {};
			class federalUpdate {};
			class isUIDActive {};
			class chopShopSell {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
	
	class Offroad_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class Hatchback_01_base_F: Car_F
	{
		class EventHandlers;
	};
	class SUV_01_base_F: Car_F
	{
		class EventHandlers;
	};
	
	class C_Hatchback_01_sport_F: Hatchback_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Hatchback_01_sport_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		displayName = "$STR_A3_CfgVehicles_C_car_sport0";
		hiddenSelectionsTextures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\hatchback\color.sqf""";
		};
	};
	
	class C_SUV_01_F: SUV_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_SUV_01_F";
		scope = 2;
		crew = "C_man_1";
		typicalCargo[] = {"C_man_1"};
		side = 3;
		faction = "CIV_F";
		accuracy = 1.25;
		hiddenSelectionsTextures[] = {"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\SUV\color.sqf""";
		};
	};
	class C_Hatchback_01_F: Hatchback_01_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "C_Hatchback_01_F";
		scope = 2;
		crew = "C_man_1";
		side = 3;
		faction = "CIV_F";
		hiddenSelectionsTextures[] = {"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa"};
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\cars\hatchback\color.sqf""";
		};
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