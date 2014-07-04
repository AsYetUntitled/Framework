/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells clients to either turn the lights on for that house
	or off.
*/
private["_house","_mode","_lightSource","_exit"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,false,[true]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
_exit = false;
if(_mode) then {
	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
	
	switch(true) do {
		case ((typeOf _house) in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"]): {_lightSource lightAttachObject [_house,[0,-2,3.8]];};
		case ((typeOf _house) in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"]): {_lightSource lightAttachObject [_house,[2,0,3.5]];};
		case ((typeOf _house) in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]): {_lightSource lightAttachObject [_house,[-1.5,0,2]]};
		case ((typeOf _house) in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]): {_lightSource lightAttachObject [_house,[2,0,2.4]]};
		case ((typeOf _house) in ["Land_i_House_Small_03_V1_F","Land_i_House_Small_03_V3_F","Land_i_House_Small_03_V3_F"]): {_lightSource lightAttachObject [_house,[-3.3,1,2.5]];};
		default {_exit = true;};
	};
	if(_exit) exitWith {deleteVehicle _lightSource;};
	
	_lightSource setLightColor [250,150,50];
	_lightSource setLightAmbient [1,1,0.2];
	_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare true;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;
	_house setVariable["lightSource",_lightSource];
} else {
	if(isNull (_house getVariable["lightSource",ObjNull])) exitWith {};
	deleteVehicle (_house getVariable["lightSource",ObjNull]);
};