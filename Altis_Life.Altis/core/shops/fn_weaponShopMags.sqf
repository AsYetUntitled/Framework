#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Author: Daniel Stuart

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    private ["_weapon","_magArray","_magWell","_subClass","_muzzles"];
    _weapon = lbData[38403,lbCurSel (38403)];
    _magArray = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazines");
    _magWell = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"magazineWell");
	_muzzles = FETCH_CONFIG2(getArray,"CfgWeapons",_weapon,"muzzles") - ["this"];
    {
		_subClass = _x;
		{
			_magArray append getArray ("CfgMagazineWells" >> _subClass >> _x);
		} count "true" configClasses (configFile >> "CfgMagazineWells" >> _subClass);
	} count _magWell;
	
	//GL and stuff
	if (count _muzzles > 0) then {
		{
			_magArray append FETCH_CONFIG(getArray,"CfgWeapons",_weapon,_x,"magazines");
			_magWell = FETCH_CONFIG(getArray,"CfgWeapons",_weapon,_x,"magazineWell");
			{
			_subClass = _x;
				{
					_magArray append getArray("CfgMagazineWells" >> _subClass >> _x);
				} count "true" configClasses (configFile >> "CfgMagazineWells" >> _subClass);
			} count _magWell;
		} count _muzzles;
	};
    uiNamespace setVariable ["Magazine_Array",_magArray];
    uiNamespace setVariable ["Weapon_Magazine",1];
} else {
    uiNamespace setVariable ["Weapon_Magazine",0];
};
