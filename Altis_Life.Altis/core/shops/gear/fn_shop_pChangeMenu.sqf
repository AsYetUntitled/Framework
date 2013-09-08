/*
	File: fn_shop_pChangeMenu.sqf
*/
private["_type","_dialog","_plist","_magarray","_mag","_mags"];
_type = _this select 0;
disableSerialization;

_dialog = findDisplay 2500;
_plist = _dialog displayCtrl 2502;

lbClear _plist;

switch (_type) do
{
	case "guns":
	{
		{
			_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
			_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
			if(_x == "hgun_P07_snds_F") then
			{
				_plist lbAdd "Stun Pistol";
			}
				else
			{
				_plist lbAdd format["%1", _name];
			};
			_plist lbSetPicture [(lbSize _plist)-1,_pic];
			_plist lbSetData [(lbSize _plist)-1,_x];
		} foreach (weapons player);
	};
	
	case "mags":
	{
		_magarray = [];
		_mags = magazines player;
		
		if(primaryWeapon player != "") then
		{
			player selectWeapon (primaryWeapon player);
			if(currentMagazine player != "") then
			{
				_mags set[count _mags,currentMagazine player];
			};
		};
		
		if(secondaryWeapon player != "") then
		{
			player selectWeapon (secondaryWeapon player);
			if(currentMagazine player != "") then
			{
				_mags set[count _mags,currentMagazine player];
			};
		};
		
		if(handgunWeapon player != "") then
		{
			player selectWeapon (handgunWeapon player);
			if(currentMagazine player != "") then
			{
				_mags set[count _mags,currentMagazine player];
			};
		};
		
		player selectWeapon (primaryWeapon player);
		
		{
			if(!(_x in _magarray)) then
			{
				_mag = _x;
				_name = getText(configFile >> "CfgMagazines" >> _x >> "displayname");
				_pic = getText(configFile >> "CfgMagazines" >> _x >> "picture");
				_plist lbAdd format["x%1 %2",({_x == _mag} count _mags),_name];
				_plist lbSetPicture [(lbSize _plist)-1,_pic];
				_plist lbSetData [(lbSize _plist)-1,_x];
				_magarray set[count _magarray,_x];
			};
		} foreach _mags;
	};
	
	case "items":
	{
		{
			if(_x == "G_Diving" || _x == "G_Shades_Black" || _x == "G_Shades_Blue" || _x == "G_Sport_Blackred" || _x == "G_Tactical_Clear") then
			{
				_name = getText(configFile >> "CfgGlasses" >> _x >> "displayname");
				_pic = getText(configFile >> "CfgGlasses" >> _x >> "picture");
				_plist lbAdd format["%1",_name];
				_plist lbSetPicture [(lbSize _plist)-1,_pic];
				_plist lbSetData [(lbSize _plist)-1,_x];
			} else
			{
				_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
				_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
				_plist lbAdd format["%1",_name];
				_plist lbSetPicture [(lbSize _plist)-1,_pic];
				_plist lbSetData [(lbSize _plist)-1,_x];
			};
		} foreach (assigneditems player);
		
		{
			if(_x != "") then
			{
				_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
				_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
				_plist lbAdd format["%1",_name];
				_plist lbSetPicture [(lbSize _plist)-1,_pic];
				_plist lbSetData [(lbSize _plist)-1,_x];
			};
		} foreach (primaryWeaponItems player);
		
		{
			if(_x != "") then
			{
				_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
				_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
				_plist lbAdd format["%1",_name];
				_plist lbSetPicture [(lbSize _plist)-1,_pic];
				_plist lbSetData [(lbSize _plist)-1,_x];
			};
		} foreach (handGunItems player);
		
		{
			if(_x == "G_Diving" || _x == "G_Shades_Black" || _x == "G_Shades_Blue" || _x == "G_Sport_Blackred" || _x == "G_Tactical_Clear") then
			{
				_name = getText(configFile >> "CfgGlasses" >> _x >> "displayname");
				_pic = getText(configFile >> "CfgGlasses" >> _x >> "picture");
				_plist lbAdd format["%1",_name];
				_plist lbSetPicture [(lbSize _plist)-1,_pic];
				_plist lbSetData [(lbSize _plist)-1,_x];
			};
			
				if((getText(configFile >> "CfgWeapons" >> _x >> "picture")) != "") then
				{
					_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
					_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
					_plist lbAdd format["%1",_name];
					_plist lbSetPicture [(lbSize _plist)-1,_pic];
					_plist lbSetData [(lbSize _plist)-1,_x];
				};
		} foreach (uniformItems player);
		
		if(uniform player != "") then
		{
			_name = getText(configFile >> "CfgWeapons" >> (uniform player) >> "displayname");
			_pic = getText(configFile >> "CfgWeapons" >> (uniform player) >> "picture");
			_plist lbAdd format["%1",_name];
			_plist lbSetPicture [(lbSize _plist)-1,_pic];
			_plist lbSetData [(lbSize _plist)-1,(uniform player)];
		};
		
		if(vest player != "") then
		{
			{
				if(_x == "G_Diving" || _x == "G_Shades_Black" || _x == "G_Shades_Blue" || _x == "G_Sport_Blackred" || _x == "G_Tactical_Clear") then
				{
					_name = getText(configFile >> "CfgGlasses" >> _x >> "displayname");
					_pic = getText(configFile >> "CfgGlasses" >> _x >> "picture");
					_plist lbAdd format["%1",_name];
					_plist lbSetPicture [(lbSize _plist)-1,_pic];
					_plist lbSetData [(lbSize _plist)-1,_x];
				};
	
				if((getText(configFile >> "CfgWeapons" >> _x >> "picture")) != "") then
				{
					_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
					_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
					_plist lbAdd format["%1",_name];
					_plist lbSetPicture [(lbSize _plist)-1,_pic];
					_plist lbSetData [(lbSize _plist)-1,_x];
				};
				
			} foreach (vestItems player);
			
			_name = getText(configFile >> "CfgWeapons" >> (vest player) >> "displayname");
			_pic = getText(configFile >> "CfgWeapons" >> (vest player) >> "picture");
			_plist lbAdd format["%1",_name];
			_plist lbSetPicture [(lbSize _plist)-1,_pic];
			_plist lbSetData [(lbSize _plist)-1,(vest player)];
		};
		
		if(backpack player != "") then
		{
			{
				if(_x == "G_Diving" || _x == "G_Shades_Black" || _x == "G_Shades_Blue" || _x == "G_Sport_Blackred" || _x == "G_Tactical_Clear") then
				{
					_name = getText(configFile >> "CfgGlasses" >> _x >> "displayname");
					_pic = getText(configFile >> "CfgGlasses" >> _x >> "picture");
					_plist lbAdd format["%1",_name];
					_plist lbSetPicture [(lbSize _plist)-1,_pic];
					_plist lbSetData [(lbSize _plist)-1,_x];
				};
				
				if((getText(configFile >> "CfgWeapons" >> _x >> "picture")) != "") then
				{
					_name = getText(configFile >> "CfgWeapons" >> _x >> "displayname");
					_pic = getText(configFile >> "CfgWeapons" >> _x >> "picture");
					_plist lbAdd format["%1",_name];
					_plist lbSetPicture [(lbSize _plist)-1,_pic];
					_plist lbSetData [(lbSize _plist)-1,_x];
				};
			} foreach (backpackitems player);
		};
	};
	
	case "packs":
	{
		if(backpack player != "") then
		{
			_name = getText(configFile >> "CfgVehicles" >> (backpack player) >> "displayname");
			_pic = getText(configFile >> "CfgVehicles" >> (backpack player) >> "picture");
			_plist lbAdd format["%1",_name];
			_plist lbSetPicture [(lbSize _plist)-1,_pic];
			_plist lbSetData [(lbSize _plist)-1,(backpack player)];
		};
	};
	
	case "glass":
	{
		if(goggles player != "") then
		{
			_name = getText(configFile >> "CfgGlasses" >> (goggles player) >> "displayname");
			_pic = getText(configFile >> "CfgGlasses" >> (goggles player) >> "picture");
			_plist lbAdd format["%1",_name];
			_plist lbSetPicture [(lbSize _plist)-1,_pic];
			_plist lbSetData [(lbSize _plist)-1,(goggles player)];
		};
	};
};