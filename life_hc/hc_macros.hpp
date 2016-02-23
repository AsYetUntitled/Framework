#define SYSTEM_TAG "HC"
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define CASH life_cash
#define BANK life_atmbank
#define GANG_FUNDS grpPlayer getVariable ["gang_bank",0];

/*
	remoteExec Section
	When uncommented it enables proper testing via local testing
	Otherwise leave it commented out for "LIVE" servers
*/
#define DEBUG 1

#ifdef DEBUG
#define RCLIENT 0
#else
#define RCLIENT -2
#endif

#define RSERV 2
#define RANY 0

//Namespace Macros
#define SVAR_MNS missionNamespace setVariable
#define SVAR_UINS uiNamespace setVariable
#define SVAR_PNS parsingNamespace setVariable
#define GVAR_MNS missionNamespace getVariable
#define GVAR_UINS uiNamespace getVariable

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define PVAR_ALL(var) publicVariable var
#define PVAR_SERV(var) publicVariableServer var
#define PVAR_ID(var,id) id publicVariableClient var
#define GVAR getVariable
#define SVAR setVariable
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define ITEM_WEIGHT(varName) M_CONFIG(getNumber,"VirtualItems",varName,"weight")

//Condition Macros
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define CONFIG_BOOL(NUMBER) [##NUMBER] call { _ret = false; if((_this select 0) in [0,1] && EQUAL((_this select 0),1)) then { _ret = true; }; _ret;}

// Arrays
#define ARRAY_TYPE(a) [##a] call {if((typeName (_this select 0)) == "ARRAY") then {true;} else {false;};}
#define ARRAY_EMPTY(a) [##a] call {if(count (_this select 0) == 0) then {true;} else {false;};}

// extDB2 Macros
#define EXTDB "extDB2" callExtension
#define RCON_SELECTION getText(configFile >> "CfgServerSettings" >> "extDB" >> "RCON_Selection")
#define EXTDB_SETTINGS_BOOL(SETTING) CONFIG_BOOL(getNumber(configFile >> "CfgServerSettings" >> "extDB" >> SETTING))
#define EXTDB_SETTING(TYPE,SETTING) TYPE(configFile >> "CfgServerSettings" >> "extDB" >> SETTING)
#define EXTDB_FAILED(MESSAGE) \
	life_server_extDB_notLoaded = [true,##MESSAGE]; \
	PVAR_ALL("life_server_extDB_notLoaded"); \
	diag_log MESSAGE;
