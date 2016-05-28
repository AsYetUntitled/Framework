#define SYSTEM_TAG "life"
#define ITEM_TAG format["%1%2",SYSTEM_TAG,"item_"]
#define CASH life_cash
#define BANK life_atmbank
#define GANG_FUNDS group player getVariable ["gang_bank",0];

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

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define EXTDB "extDB2" callExtension
#define EXTDB_SETTING(TYPE,SETTING) TYPE(missionConfigFile >> "CfgServer" >> SETTING)
#define EXTDB_FAILED(MESSAGE) \
    life_server_extDB_notLoaded = [true,##MESSAGE]; \
    publicVariable "life_server_extDB_notLoaded"; \
    diag_log MESSAGE;

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index

//System Macros
#define LICENSE_VARNAME(varName,flag) format["license_%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) missionNamespace getVariable [LICENSE_VARNAME(varName,flag),false]
#define ITEM_VARNAME(varName) format["life_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) missionNamespace getVariable [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")
#define ITEM_WEIGHT(varName) M_CONFIG(getNumber,"VirtualItems",varName,"weight")

//Condition Macros
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
