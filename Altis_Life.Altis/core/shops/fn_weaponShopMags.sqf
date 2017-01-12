#include "..\..\script_macros.hpp"
/*
	File: fn_weaponShopMags.sqf
	Author: Daniel Stuart

	Description:
	Set Weapon Shop in magazine mode
*/
disableSerialization;
private ["_1rnd","_3rnd","_1gl","_3gl","_magArray"];
_1rnd = ["1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareYellow_F","UGL_FlareCIR_F","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell"];
_3rnd = ["3Rnd_HE_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareYellow_F","3Rnd_UGL_FlareCIR_F","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell"];
_1gl = ["arifle_Katiba_GL_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_MX_GL_khk_F","arifle_AK12_GL_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F"];
_3gl = ["arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_MX_GL_khk_F"];

if((GVAR_UINS ["Weapon_Magazine",0]) == 0) then {
	private["_weapon"];
	_weapon = lbData[38403,lbCurSel (38403)];
	_magArray = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
	if (_weapon in _1gl) then { _magArray append _1rnd };
	if (_weapon in _3gl) then { _magArray append _3rnd };
	uiNamespace setVariable["Magazine_Array",_magArray];
	uiNamespace setVariable["Weapon_Magazine",1];
} else {
	uiNamespace setVariable["Weapon_Magazine",0];
};

