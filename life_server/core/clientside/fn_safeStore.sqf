/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
private["_ctrl"];
disableSerialization;
