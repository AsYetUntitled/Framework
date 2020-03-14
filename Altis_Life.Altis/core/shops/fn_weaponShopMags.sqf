#include "..\..\script_macros.hpp"
/*
    File: fn_weaponShopMags.sqf
    Authors: Daniel Stuart, Faron
	 

    Description:
    Set Weapon Shop in magazine mode
*/
disableSerialization;

if ((uiNamespace getVariable ["Weapon_Magazine",0]) isEqualTo 0) then {
    private ["_weapon","_magArray","_magWell","_subClass","_muzzles"];
    _weapon = lbData[38403,lbCurSel (38403)];
    _magArray = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    _magWell = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazineWell");
	_muzzles = (getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles")) - ["this"];
	
	{
		_subClass = _x;
		{
			_magArray append getArray (configFile >> "CfgMagazineWells" >> _subClass >> _x);
			true;
		} count ("true" configClasses (configFile >> "CfgMagazineWells" >> _subClass));
		true;
	} count _magWell;
	
	//GL and stuff
	if (count _muzzles > 0) then {
		{
			_magArray append getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines");
			_magWell = getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazineWell");
			{
			_subClass = _x;
				{
					_magArray append getArray(configFile >>"CfgMagazineWells" >> _subClass >> _x);
					true;
				} count ("true" configClasses (configFile >> "CfgMagazineWells" >> _subClass));
				true;
			} count _magWell;
			true;
		} count _muzzles;
	};
	
    uiNamespace setVariable ["Magazine_Array",_magArray];
    uiNamespace setVariable ["Weapon_Magazine",1];
} else {
    uiNamespace setVariable ["Weapon_Magazine",0];
};
