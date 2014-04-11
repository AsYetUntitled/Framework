/*
	File: fn_variableCheck.sqf
	
	Description:
	Checks against harmful variables, disable this if client-performance is 
	to bad in the fn_payLoad.sqf, the menuCheck should be good enough!
*/
private["_badVariables","_checkThread"];
_badVariables = ["W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FuckUp_GunStore_a",
	"W_O_O_K_I_E_M_E_N_U_funcs_inited","Menu_Init_Lol","E_X_T_A_S_Y_Atm","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl",
	"efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn","adadawer24_1337","lkjhgfuyhgfd","E_X_T_A_S_Y_M_E_N_U_funcs_inited","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List",
	"Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x",
	"hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","E_X_T_A_S_Y_Keybinds","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited",
	"Monky_initMenu","player_zombieCheck","E_X_T_A_S_Y_Recoil","godlol","playericons","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex",
	"nukeDONEstar","Wookie_List","Wookie_Pro_RE","FUCKTONIC","E_X_T_A_S_Y_FuckUp_GunStore_a","E_X_T_A_S_Y_Cash_1k_t","E_X_T_A_S_Y_Cash_a","E_X_T_A_S_Y_LicenseDrive","E_X_T_A_S_Y_Menu_LOOOOOOOOOL"
];

_checkThread = {
	{
		_var = missionNamespace getVariable _x;
		if(!isNil "_var") then {
			missionNamespace setVariable[_x,nil];
			[[name player,getPlayerUID player,format["Variable: %1",_x]],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[name player,format["Variable: %1",_x]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			["SpyGlass",false,false] call BIS_fnc_endMission;
		};
	} foreach _this;
};

//Create the worker.
while {true} do {
	_thread = _badVariables spawn _checkThread;
	waitUntil {scriptDone _thread};
	sleep 120; //Goto sleep for 2 minutes.
};