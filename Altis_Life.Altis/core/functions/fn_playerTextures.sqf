#include "..\..\script_macros.hpp"
/*
	## Nikko Renolds
    ## AsYetUnited | fn_playerTextures.sqf [v2.6]
	## https://github.com/Ni1kko
*/

//-- Preint is called and not scheduled so terinate script here and add it to scheduler
if(not(canSuspend))exitWith{_this spawn life_fnc_playerTextures; false};

//-- Wait for session to complete
waitUntil {(missionNamespace getVariable ["life_session_completed",false])};

//-- Get ranks once session has completed
private _adminlevel = call (missionNamespace getVariable ["life_adminlevel",{0}]);
private _donorlevel = call (missionNamespace getVariable ["life_donorlevel",{0}]);
private _policeRank = call (missionNamespace getVariable ["life_coplevel",{0}]);
private _medicRank =  call (missionNamespace getVariable ["life_medicLevel",{0}]);

//-- Get config
private _civExtendedSkins = LIFE_SETTINGS(getNumber,"civ_extendedSkins") isEqualTo 1;
private _copExtendedSkins = LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1;
private _medExtendedSkins = LIFE_SETTINGS(getNumber,"med_extendedSkins") isEqualTo 1;

//--
private _lastUniform = "";
private _lastUniformTextures = [];
private _lastVest = "";
private _lastVestTextures = [];
private _lastBackpack = "";
private _lastBackpackTextures = [];
private _lastPlayerObject = player;
private _lastPlayerSide = playerSide;

while{true}do
{
	//-- Wait for change
	waitUntil {
		uiSleep 0.2;
		_lastPlayerObject isNotEqualTo player 
        OR {playerSide isNotEqualTo _lastPlayerSide 
		OR {(uniform player) isNotEqualTo _lastUniform
		OR {(getObjectTextures(uniformContainer player)) isNotEqualTo _lastUniformTextures 
		OR {(vest player) isNotEqualTo _lastVest 
		OR {(getObjectTextures(vestContainer player)) isNotEqualTo _lastVestTextures 
		OR {(backpack player) isNotEqualTo _lastBackpack
		OR {(getObjectTextures(backpackContainer player)) isNotEqualTo _lastBackpackTextures	
	}}}}}}}};

	//-- Re-texturing
	switch (true) do
	{
		//-- Handle uniforms
		case (getObjectTextures(uniformContainer player) isNotEqualTo _lastUniformTextures OR (uniform player) isNotEqualTo _lastUniform): 
		{ 
			private _defaultTextures = getArray(configFile >> "CfgWeapons" >> (uniform player) >> "hiddenSelectionsTextures");
			private _uniformTexture = (switch (uniform player) do 
			{
				//-- Police Uniforms (1 - 7)
				case "U_Rangemaster": 
				{ 
					switch (side player) do 
					{ 
						case west:          {["textures\cop_uniform.jpg", format["textures\cop_uniform_%1.jpg",(_policeRank max 1) min 8]] select _copExtendedSkins};
						case independent:	{["textures\medic_uniform.jpg", format["textures\medic_uniform_%1.jpg",(_medicRank max 1) min 5]] select _medExtendedSkins};
						default 			{""};
					};
				};
				case "U_C_Poloshirt_blue": 			{["", "textures\civilian_uniform_1.jpg"] select _civExtendedSkins};
				case "U_C_Poloshirt_burgundy": 	    {["", "textures\civilian_uniform_2.jpg"] select _civExtendedSkins};
				case "U_C_Poloshirt_stripped": 	    {["", "textures\civilian_uniform_3.jpg"] select _civExtendedSkins};
				case "U_C_Poloshirt_tricolour": 	{["", "textures\civilian_uniform_4.jpg"] select _civExtendedSkins};
				case "U_C_Poloshirt_salmon": 		{["", "textures\civilian_uniform_5.jpg"] select _civExtendedSkins};
				case "U_C_Poloshirt_redwhite": 	    {["", "textures\civilian_uniform_6.jpg"] select _civExtendedSkins};
				case "U_C_Commoner1_1": 			{["", "textures\civilian_uniform_7.jpg"] select _civExtendedSkins};
				default 							{""};
			});
            
			if(_adminlevel >= 1) then 
			{
				private _customTexture = (uniformContainer player) getVariable ["customTexture", ""]; 
				if(count _customTexture > 0) then {
					_uniformTexture = _customTexture;
				};
			};

			if(playerSide in [civilian,east] AND ((uniformContainer player) getVariable ["protectedTexture",false]))then{
				_uniformTexture = "";
			};
			
			if(count _uniformTexture > 0) then {
				(uniformContainer player) setObjectTextureGlobal [0, _uniformTexture];
				if(playerSide in [west,independent])then{
					(uniformContainer player) setVariable ["protectedTexture",true,true];
				};
			}else{
				{(uniformContainer player) setObjectTextureGlobal [_forEachIndex, _x]}forEach _defaultTextures;
				(uniformContainer player) setVariable ["protectedTexture",false,true];
			};
			
			_lastUniformTextures = getObjectTextures(uniformContainer player);
			_lastUniform = uniform player;
		};
		//-- Handle vests
		case (getObjectTextures(vestContainer player) isNotEqualTo _lastVestTextures OR (vest player) isNotEqualTo _lastVest):
		{
			private _defaultTextures = getArray(configFile >> "CfgWeapons" >> (vest player) >> "hiddenSelectionsTextures");
            private _vestTexture = (switch (vest player) do 
			{
				case "V_Chestrig_rgr": 
				{ 
					switch (side player) do 
                    {
                        case independent:	{"textures\medic_vest.paa"};
                        default 			{""};
                    };
				};
				default {""};
			});

			if(_adminlevel >= 1) then 
			{
				private _customTexture = (vestContainer player) getVariable ["customTexture", ""]; 
				if(count _customTexture > 0) then {
					_vestTexture = _customTexture;
				};
			};

			if(playerSide in [civilian,east] AND ((vestContainer player) getVariable ["protectedTexture",false]))then{
				_vestTexture = "";
			};

			if(count _vestTexture > 0) then {
				(vestContainer player) setObjectTextureGlobal [0, _vestTexture];
				if(playerSide in [west,independent])then{
					(vestContainer player) setVariable ["protectedTexture",true,true];
				};
			}else{
				{(vestContainer player) setObjectTextureGlobal [_forEachIndex, _x]}forEach _defaultTextures;
				(vestContainer player) setVariable ["protectedTexture",false,true];
			};

			_lastVestTextures = getObjectTextures (vestContainer player);
			_lastVest = vest player;
		};
		//-- Handle backpacks
		case (getObjectTextures(backpackContainer player) isNotEqualTo _lastBackpackTextures OR (backpack player) isNotEqualTo _lastBackpack):
		{
			private _defaultTextures = getArray(configFile >> "CfgVehicles" >> (backpack player) >> "hiddenSelectionsTextures");
			private _backpackTexture = (switch (backpack player) do {
                case "B_Bergen_tna_F":
                { 
                    switch (side player) do 
                    {
                        case west:			{"Invisible"};
                        case independent:	{"Invisible"};
                        default 			{""};
                    }
                };
                case "B_Carryall_ghex_F":
                { 
                    switch (side player) do 
                    {
                        case west:			{"Invisible"};
                        case independent:	{"Invisible"};
                        default 			{""};
                    }
                };
                default {""};
            });

			if(_adminlevel >= 1) then 
			{
				private _customTexture = (backpackContainer player) getVariable ["customTexture", "Invisible"];
				if(count _customTexture > 0) then {
					_backpackTexture = _customTexture;
				};
			};

			if(playerSide in [civilian,east] AND ((backpackContainer player) getVariable ["protectedTexture",false]))then{
				_backpackTexture = "";
			};

			if(count _backpackTexture > 0) then {
				//Load custom or invisible texture
				(backpackContainer player) setObjectTextureGlobal [0, [_backpackTexture, ""] select (_backpackTexture isEqualTo "Invisible")];
				if(playerSide in [west,independent])then{
					(backpackContainer player) setVariable ["protectedTexture",true,true];
				};
			}else{
				//Reload default textures (need for if player switches side without droping gear)
				{(backpackContainer player) setObjectTextureGlobal [_forEachIndex, _x]}forEach _defaultTextures;
				(backpackContainer player) setVariable ["protectedTexture",false,true];
			};
			
			_lastBackpackTextures = getObjectTextures (backpackContainer player);
			_lastBackpack = backpack player;
		};
	};
	
    _lastPlayerObject = player;
	_lastPlayerSide = playerSide;
};

false